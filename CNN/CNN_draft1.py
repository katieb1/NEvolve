# Main imports
import numpy as np
import torch
import time

# PyTorch shorthands
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim

# Import custom function
import msms

tic = time.perf_counter()

# Create train function to run data through nn    
def main():
    
    # Start timing
    tic = time.perf_counter()
    
    # Initialize dataset
    ds = msms.Dataset("../pipeline/data",
                      "../pipeline/metadata/lookup.npy",
                      "../pipeline/metadata/ms_param.csv")
    
    # Initialize data loader
    dataloader = torch.utils.data.DataLoader(ds,
                                             batch_size=20,
                                             shuffle=False, # NO SHUFFLE
                                             num_workers=0)
    
    # Set network parameters
    pool_size = 1
    channels = [4, 6, 8]
    kernels = [5, 4, 3]
    nodes = [500, 100, 5]

    # Create model and wrap in DDP
    net = msms.Net(ds.num_indivs, ds.num_sites, pool_size,
                   channels, kernels, nodes).cuda()
    
    # Define criterion and optimizer functions
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
            print(f"label shape before reshape: {label.shape}")
            label = label.view(-1)
            label_ohe = F.one_hot(label)
            label_ohe = label_ohe.to(torch.float32)

            # Perform one forward pass
            out = net(snp, pos)
            out = out.to(torch.float32)
            print(f"net output shape: {out.shape}")
            print(f"label tensor shape: {label.shape}")
            loss = F.mse_loss(out, label_ohe).cuda()
            
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
    print(f"Total time run: {(toc-tic)/60:0.4f} minutes")

if __name__ == '__main__:
    if __name__ == '__main__':
    import cProfile, pstats
    profiler = cProfile.Profile()
    profiler.enable()
    main()
    profiler.disable()
    stats = pstats.Stats(profiler)
    stats.strip_dirs()
    stats.sort_stats('tottime')
    stats.print_stats()
    stats.dump_stats('./profiler/CNN_draft.prof')