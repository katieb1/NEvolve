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
import torch
import torch.nn as nn
import torch.distributed as dist
import DistributedDataParallel as DDP

# Custom data loader function
import msms

# Define main function to parse arguments for training function
def main():
    parser.add_argument.ArgumentParser()
    parser.add_argument('-n', '--nodes', default=1, type=int, metavar='N')
    parser.add_argument('-g', '--gpus', default=1, type=int,
                        help='number of gpus per node')
    parser.add_argument('-nr', '--nr', default=0, type=int,
                        help='ranking within the nodes')
    parser.add_argument('--epochs', default=2, type=int, metavar='N',
                        help='number of total epochs to run')
    parser.add_argument('--data', default="data", type=str,
                        help='filepath to data')
    parser.add_argument('--metadata', default="metadata/lookup.npy",
                        type=str, help='path to metadata')
    parser.add_argument('--batch_size', default=20, type=int)
    parser.add_argument('--pool_size', default=1, type=int)
    parser.add_argument('--no_labels', default=5, type=int)
    args = parser.parse_args()
    args.world_size = args.gpus * args.nodes
    mp.spawn(train, nprocs=args.gpus, args=(args,))

# Neural network AND data loader defined in msms.py

# Create train function to run data through nn    
def train(gpu, args):
    
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
    
    # Initialize dataset
    ds = msms.Dataset(args.data, args.metadata)
    
    # Create a training sampler for DDP
    ds_sampler = torch.utils.data.distributed.DistributedSampler(
        ds,
        num_replicas=args.world_size,
        rank=rank
    )
    
    # Initialize data loader
    dataloader = torch.utils.data.DataLoader(ds,
                                             batch_size=args.batch_size,
                                             shuffle=False, # NO SHUFFLE
                                             num_workers=0,
                                             sampler=ds_sampler)
    
    # Set network parameters
    pool_size = args.pool_size
    channels = [4, 6, 8]
    kernels = [5, 4, 3]
    nodes = [500, 100, args.no_labels]

    # Create model and wrap in DDP
    net = msms.Net(ds.num_indivs, ds.num_sites, pool_size,
                   channels, kernels, nodes).cuda()
    net = nn.parallel.DistributedDataParallel(net,
                                              device_ids=[gpu])
    
    # Define criterion and optimizer functions
    criterion = F.mse_loss().cuda()
    optimizer = torch.optim.SGD(net.parameters(), 1e-4)
    total_step = len(dataloader)
    
    # Extract info from dataloader and run network
    for epoch in range(args.epochs):
        count = 0
        for snp, pos, label in dataloader:
            count += 1

            # Reshape each chunk of training examples
            snp = snp.view(-1, ds.num_indivs,
                           ds.num_sites).unsqueeze(1)
            pos = pos.view(-1, ds.num_sites)
            label = label.view(-1)

            # Perform one forward pass
            out = net(snp, pos)
            loss = criterion(out, label)

            # Perform backward pass
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            if (count) % 100 == 0 and gpu == 0:
                print('Epoch [{}/{}], Step [{}/{}], Loss: {:.4f}'.format(
                    epoch + 1,
                    args.epochs,
                    count,
                    total_step,
                    loss.item())
                   )
                
    toc = time.perf_counter()
    if gpu == 0:
        print(f"Total time run: {(toc-tic)/60:0.4f} minutes")
        
# Call main function
if __name__ == '__main__':
    main()
                 