import os
import numpy as np
import cudf
import torch
from torch.utils.dlpack import from_dlpack
import torch.nn as nn
import torch.nn.functional as F

# An extension of torch Datasets for lazy loading msms data
# To do:
# - Profile the heck out of things
# - `labels` in `__getitem__()` is currently hard coded to use `cuda:0`
#   - Introduce a device field?
# - Currently keeps full list of labels in memory
#   - Don't know how to fix without another file per *.msout file
#   - Maybe a chunked reader?
class Dataset(torch.utils.data.Dataset):

    # Constructor takes two arguments, the folder with the data files (dir) and
    # a file containing a dictionary (lookup) that lists the files and their
    # matching labels as well as some other useful metadata. The lookup table
    # should be produced by the script that generates the simulated data.
    def __init__(self, dir, lookup, params):
        self.dir = dir
        temp = np.load(lookup, allow_pickle = True).item()
        temp2 = cudf.read_csv(params)
        self.num_sims = temp['num_sims'] # This is the number of sims per file, not total number
        self.num_indivs = temp['num_indivs']
        self.num_sites = temp['num_sites']
        self.labels = from_dlpack(temp2['labels'].to_dlpack()).reshape(-1, self.num_sims)
        self.filelist = temp2['filename'][[(i * self.num_sims) for i in range(self.labels.shape[0])]].to_pandas().to_numpy()

    # This returns the number of files (chunks) not the number of training
    # examples. Multiple by `self.num_sims` for true number of training examples.
    def __len__(self):
        return len(self.filelist)

    # Note that the input data (X) is split into snp and position data.
    # The labels are more straightforward.
    def __getitem__(self, index):
        snps, positions = read_file(self.dir, self.filelist[index], self.num_sims, self.num_indivs, self.num_sites)
        labels = self.labels[index]
        return snps, positions, labels

# A (reasonably) flexible neural network module for msms data
class Net(nn.Module):
    # Define the transformations
    #   num_indivs: the number of individuals per simulation, ie number of rows in the SNP data
    #   num_sites: the number of SNP sites, ie number of cols in the SNP data
    #   pool_size: the size of the square pooling kernel
    #   channels: a list of the number of channels in each convolution layer. Input is assumed to be 1 channel.
    #   kernels: the size of the square kernel used in each convolution layer. Must be same length as `channels`
    #   nodes: a list of the number of nodes in each hidden linear layer
    def __init__(self, num_indivs, num_sites, pool_size, channels, kernels, nodes):
        # Inherit behaviour from PyTorch class
        super(Net, self).__init__()

        # Check that parameters are acceptable
        if len(channels) != len(kernels):
            raise Exception("List of channels and kernel sizes must be same length!")

        # Calculate dimensions of input after convolutions
        dims = [num_indivs, num_sites]
        for i in range(len(channels)):
            # without padding, both dimensions decrease by 1 less than kernel size
            dims = np.subtract(dims, kernels[i] - 1)
            # Max pooling divides the dimensions by pooling size (given default behaviour of stride = kernel size)
            dims = np.floor(np.divide(dims, pool_size))

        # Calculate the number of nodes leaving the convolutional layers
        # This is the product of the didmensions before and the final number of channels
        self.initial_nodes = (channels[-1] * dims[0] * dims[1]).astype(int)
        if self.initial_nodes <= 0:
            raise Exception("Some combination of inputs led to no output from convolution layers, please try a smaller network or reducing pooling size")

        # We also need to append this to the start of the nodes list
        # The position data will also be concatenated at this step and must be accounted for with `num_sites`
        nodes = [self.initial_nodes + num_sites] + nodes

        # Append the number of channels in input to the beginning of the list of channels
        channels = [1] + channels

        # Convolution transforms
        # Note that `nn.ModuleList()` is used in place of a list (i.e. `[]`) since torch modules can't manage lists
        self.pool = nn.MaxPool2d(pool_size, pool_size)
        self.convolutions = nn.ModuleList(nn.Conv2d(channels[i], channels[i + 1], kernels[i]) for i in range(len(kernels)))

        # Linear transforms # `nn.ModuleList()` is used in place of lists here as well
        self.linears = nn.ModuleList(nn.Linear(nodes[i], nodes[i + 1]) for i in range(len(nodes) - 1))

    # Apply the transformations
    #   x: SNP data
    #   pos: Position data
    def forward(self, x, pos):
        # Apply convolutions with pooling
        for conv in self.convolutions:
            x = self.pool(F.relu(conv(x)))

        # Unwrap and concatenate position data
        x = x.view(pos.shape[0], self.initial_nodes)
        x = torch.cat((x, pos), 1)

        # Apply linear transforms
        for lin in self.linears:
            x = F.relu(lin(x))

        return x

# Function to read in concatenated msms output files
# All sims are assumed to have the same number of individuals and segregating sites.
# `rows_to_skip` should indicate the number of rows above the first row with position data
def read_file(dir, filename, num_sims, num_indivs, num_sites, rows_to_skip = 6):
    # Read in data using spaces as separator
    data = cudf.read_csv(
            os.path.join(dir, filename),
            header=None,
            dtype='float32',
            usecols=range(0,num_sites))

    # Find every row with position data
    pos_rows = [i * (num_indivs + 1) for i in range(num_sims)]

    # Find all rows with SNP data
    # This is a collection of rows after each row of position data
    # The number of rows is just the number of individuals per simulation
    snp_rows = []
    for pos_row in pos_rows:
        snp_rows.extend(range(pos_row + 1, pos_row + num_indivs + 1))

    # Pull the SNP data out as cuDF series, convert to torch tensor, reshape
    snps = from_dlpack(data.iloc[snp_rows, :].to_dlpack()).view(num_sims, num_indivs, num_sites)

    # Extract position data
    positions = from_dlpack(data.iloc[pos_rows, :].to_dlpack())

    return snps, positions


def main():

    # Note that msms.py has many other imports
    import msms
    import torch

    # Initialize a dataset
    example_set = msms.Dataset("data", "metadata/lookup.npy", "metadata/ms_param.csv")

    # Initialize a dataloader with the dataset
    # - Note that you currently can't add more `num_workers`, maybe due to fighting over GPU resources?
    example_loader = torch.utils.data.DataLoader(example_set, batch_size = 2, shuffle = True, num_workers = 0)

    # Set the network parameters
    # Max pooling size for all convolutional layers. Our low `num_indivs` generally makes this a bad idea, but you can make it work with few convolutional layers.
    pool_size = 1
    # The number of channels per convolution layer (think colour channels in an image), input channels assumed to be 1
    channels = [4, 6, 8]
    # The size of the kernel at each convolution step. Length of this list should match length of `channels`
    kernels = [5, 4, 3]
    # The nodes in each hidden fully connected layer. The last should be the number of labels. The length of the list is independent of the other lists.
    nodes = [500, 100, 5]

    # Create the network with the given parameters and send it to the gpu
    example_net = msms.Net(example_set.num_indivs, example_set.num_sites, pool_size, channels, kernels, nodes).cuda()

    # Try running the network
    for snp, pos, label in example_loader:
        # The data loader reads in each file as though it were a training example
        # As each file is actually a collection of training examples (a chunk), we must reshape with `view()`
        # We also need to add a dimension to snp (with unsqueeze) to indicate there is only one colour channel
        snp = snp.view(-1, example_set.num_indivs, example_set.num_sites).unsqueeze(1)
        pos = pos.view(-1, example_set.num_sites)
        label = label.view(-1)

        # Perform one forward pass
        out = example_net(snp, pos)

        # Print output and shape
        print(out)
        print(out.shape)


if __name__ == '__main__':
    import cProfile, pstats
    profiler = cProfile.Profile()
    profiler.enable()
    main()
    profiler.disable()
    stats = pstats.Stats(profiler)
    stats.strip_dirs()
    stats.sort_stats('ncalls')
    stats.print_stats()
    stats.dump_stats('./profiler/stats.prof')
