# Main imports
import numpy as np
import torch
import time

# PyTorch shorthands
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim

# From DDP tutorial
import os
import argparse
import torch.multiprocessing as mp
import torch.nn as nn
import torch.distributed as dist

# Testtube for creating slurm jobs
from test_tube.hpc import Experiment, HyperOptArgumentParser, SlurmCluster

# Custom data loader function
import msms

def train(hparams, *args):
    """
    Train model
    
    Arguments:
    ---------
    hparams - arguments to run model with
    """
    
    # Initialize experiments to track all hyperparameter combos
    exp = Experiment(
        name=hparams.test_tube_exp_name,
        # Location to save metrics
        save_dir=hparams.log_path,
        autosave=False#,
    )
    exp.argparse(hparams)
    
    # Train
    # Start timing
    tic = time.perf_counter()
    
    # Calculate GPU rank
    rank = args.nr * args.gpus + gpu
    dist.init_process_group(
        backend='nccl',
        init_method='env://',
        world_size=args.world_size,
        rank=rank
    )
    
    torch.cuda.set_device(gpu)

    # Decide on train / dev split
    lookup = np.load(args.metadata, allow_pickle = True).item()
    num_dev = np.int(min(np.floor(lookup['num_files'] * args.test_prop), 2**5))
    shuffled_ids = np.random.choice(range(lookup['num_files']), lookup['num_files'], replace = False)
    train_ids = shuffled_ids[:-num_dev]
    dev_ids = shuffled_ids[-num_dev:]

    # Initialize dataset
    train_set = msms.Dataset(args.data, args.metadata, args.params, train_ids)
    dev_set = msms.Dataset(args.data, args.metadata, args.params, dev_ids)

    # Create a training sampler for DDP
    train_sampler = torch.utils.data.distributed.DistributedSampler(
        train_set,
        num_replicas=args.world_size,
        rank=rank
    )
    
    # Create a dev sampler for DDP
    dev_sampler = torch.utils.data.distributed.DistributedSampler(
        dev_set,
        num_replicas=args.world_size,
        rank=rank
    )
    
    # Initialize data loaders
    train_loader = torch.utils.data.DataLoader(train_set,
                                               batch_size=args.batch_size,
                                               shuffle=False, # NO SHUFFLE
                                               num_workers=0,
                                               sampler=train_sampler)
    dev_loader = torch.utils.data.DataLoader(dev_set,
                                             batch_size=args.batch_size,
                                             shuffle=False, # NO SHUFFLE
                                             num_workers=0,
                                             sampler=dev_sampler)
    
    # Set network parameters
    try:
        channels = list(map(int, args.channels.split(',')))
        kernels = list(map(int, args.kernels.split(',')))
        pools = list(map(int, args.pools.split(',')))
        nodes = list(map(int, args.hiddennodes.split(',')))
    except ValueError:
        raise Exception("One of the network hyperparameters (channels, kernels, pools, or hidde nods) could not be interpreted as a comma-delimited string of integers.")

    # Create model and wrap in DDP
    net = msms.Net(train_set.num_indivs, train_set.num_sites,
                   channels, kernels, pools, nodes, train_set.num_labels).cuda()
    net = nn.parallel.DistributedDataParallel(net,
                                              device_ids=[gpu])
    
    # Define criterion functions
    criterion = torch.nn.CrossEntropyLoss()
    
    # Initialize overall loss accumulator
    losses = []
    report_every = args.report_every

    # Extract info from dataloader and run network
    for epoch in range(args.epochs):
        
        epoch_start = time.time()
        lr = args.lr_0 * (args.lr_r ** epoch)
        optimizer = torch.optim.Adam(net.parameters(),
                                     lr=lr,
                                     weight_decay=args.l2_lambda)
        
        # Init running loss accumulator
        running_loss = 0.
        running_correct = 0.
        
        for i, (snp, pos, label) in enumerate(train_loader):

            # Reshape each chunk of training examples
            snp = snp.view(-1, train_set.num_indivs,
                           train_set.num_sites).unsqueeze(1)
            pos = pos.view(-1, train_set.num_sites)
            label = label.view(-1)

            # Perform one forward pass
            out = net(snp, pos)
            loss = criterion(out, label)
            
            # Perform backward pass
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            
            # Calculate number correct (hardmax) for this minibatch
            # add to running total
            temp = torch.argmax(out, 1)
            running_correct += (temp == label).float().sum()

            # Print output and shape
            running_loss += loss.item()
            if i % report_every == (report_every - 1) and (len(train_set.filelist)/args.batch_size) - i > report_every:
                # Print running loss and accuracy. Format is [epoch, minibatch]
                print(f'[{epoch}, {i + 1}] Loss: {running_loss / report_every} Acc: {running_correct / (train_set.num_sims * args.batch_size * report_every) * 100}')
                losses.append(running_loss)
                # reset accumulators
                running_loss = 0.
                running_correct = 0.

        epoch_end = time.time()
        print(f"Single iteration training time: {epoch_end - epoch_start}")

    print("Done Training")
        
    # Check testing accuracy
    running_correct = 0.
    with torch.no_grad():
        for snp, pos, label in dev_loader:
            # Reshape!
            snp = snp.view(-1, train_set.num_indivs,
                           train_set.num_sites).unsqueeze(1)
            pos = pos.view(-1, train_set.num_sites)
            label = label.view(-1)

            # Predict and count number of correct labels
            out = torch.argmax(net(snp, pos), 1)
            running_correct += (out == label).float().sum()
    
    toc = time.perf_counter()
    if gpu == 0:
        print(f"Total time run: {(toc-tic)/60:0.4f} minutes")
        
    # Save
    exp.save()
    
if __name__ == '__main__':
    
    parser = argparse.ArgumentParser()
    parser.add_argument('-n', '--cpunodes', default=1, type=int, metavar='N')
    parser.add_argument('-g', '--gpus', default=1, type=int,
                        help='number of gpus per node')
    parser.add_argument('-nr', '--nr', default=0, type=int,
                        help='ranking within the cpu nodes')
    parser.add_argument('--epochs', default=2, type=int, metavar='N',
                        help='number of total epochs to run')
    parser.add_argument('--data', default="../pipeline/data", type=str,
                        help='filepath to data')
    parser.add_argument('--metadata', default="../pipeline/metadata/lookup.npy",
                        type=str, help='path to metadata')
    parser.add_argument('--params', default="../pipeline/metadata/ms_param.csv",
                        type=str, help='path to params file')
    parser.add_argument('--test_prop', default=0.1, type=float,
                        help='proportion of data for testing')
    parser.add_argument('--batch_size', default=4, type=int)
    parser.add_argument('--lr_0', default=0.00005, type=float,
                        help='initial learning rate')
    parser.add_argument('--lr_r', default=0.8, type=float,
                        help='learning rate decay')
    parser.add_argument('--l2_lambda', default=0.5, type=float,
                        help='weight decay rate (lambda)')
    parser.add_argument('--report_every', default=5, type=int,
                        help='print loss and accuracy every x minibatches')
    parser.add_argument('--channels', default='3,6,8', type=str,
                        help='comma-delimited string of colour channels to be produced by each convolutional layer')
    parser.add_argument('--kernels', default='5,4,3', type=str,
                        help='comma-delimited string kernel sizes to use in each convolutional layer')
    parser.add_argument('--pools', default='2,1,1', type=str,
                        help='500,100')
    parser.add_argument('--hiddennodes', default='500, 100', type=str,
                        help='comma-delimited string of hidden nodes to use in each fully connected layer')
    args = parser.parse_args()
    args.world_size = args.gpus * args.cpunodes
    os.environ['MASTER_ADDR'] = os.uname()[1]             
    os.environ['MASTER_PORT'] = '8888'
    # Set up argparser, make hyperparameters tunable
    # Set hyperparameter object
    parser = HyperOptArgumentParser(strategy='random_search') # grid?
    parser.add_argument('--test_tube_exp_name', default='my_test')
    parser.add_argument('--log_path', default='./out.log')
    # Set these for now, can add more later
    parser.opt_list('--lr_0',
                    default=0.00005,
                    options=np.arange(0.00005, 0.01, 0.00005),
                    tunable=True)
    parser.opt_list('--lr_r',
                    default=0.8, 
                    options=np.arange(0.1, 0.9, 0.1),
                    tunable=True)
    parser.opt_list('--l2_lambda',
                    default=0.5,
                    options=np.arange(0.1, 0.9, 0.1),
                    tunable=True)
    parser.opt_list('--batch_size',
                    default=4,
                    options=[2, 4, 8, 16, 32],
                    tunable=True)
    hyperparams = parser.parse_args

    # Init cluster
    cluster = SlurmCluster(
        hyperparam_optimizer=hyperparams,
        log_path='./hyperparam_res',
        python_cmd='python'
    )
    
    # Set slurm commands
    cluster.add_slurm_cmd(cmd='cpus-per-task',
                          value='1',
                          comment='nb cpus / task')
    cluster.add_slurm_cmd(cmd='account',
                          value='def-training-wa_gpu',
                          comment='account')
    cluster.add_slurm_cmd(cmd='reservation',
                          value='hackathon-wr_gpu',
                          comment='reservation')
    cluster.add_slurm_cmd(cmd='mem-per-cpu',
                          value='10g',
                          comment='memory per CPU')
    
    # Notify job status
    cluster.notify_job_status(email='birchardkatie@gmail.com',
                              on_done=True,
                              on_fail=True)

    # Set job options
    cluster.per_experiment_nb_gpus = 1
    cluster.per_experiment_nb_nodes = 1
    cluster.job_time = '3:00:00'

    # Run models on cluster
    cluster.optimize_parallel_cluster_cpu(mp.spawn(train,
                                                   nprocs=args.gpus,
                                                   args=(args,)),
                                          nb_trials=20,
                                          job_name='first_tt_batch',
                                          job_display_name='CNN_ddp_tune')
    
    