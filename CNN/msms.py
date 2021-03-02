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

    # Constructor takes the following args:
    # - dir: the folder with the *.msout data files
    # - lookup: path to a numpy dictionary of global simulation parameters
    #   - num_files: number of data files in the folder
    #   - num_sims: number of simulations per file
    #   - num_indivs: number of individuals per simulation
    #   - num_sites: number of simulated SNP's per individual
    #   - num_labels: number of distinct demographic scenarios
    # - params: a csv table of filenames, labels, etc
    # a file containing a dictionary (lookup) that lists the files and their
    # matching labels as well as some other useful metadata. The lookup table
    # should be produced by the script that generates the simulated data.
    def __init__(self, dir, lookup, params, file_ids = None):
        self.dir = dir
        temp = np.load(lookup, allow_pickle = True).item()
        temp2 = cudf.read_csv(params)
        self.num_sims = temp['num_sims'] # This is the number of sims per file, not total number
        self.num_indivs = temp['num_indivs']
        self.num_sites = temp['num_sites']
        self.num_labels = temp['num_labels']
        if file_ids is None:
            self.file_ids = list(range(temp['num_files']))
        elif any(index >= temp['num_files'] for index in file_ids):
            raise Exception("Provided file ids exceed the number of files! Please double check.")
        else:
            self.file_ids = file_ids
        self.labels = from_dlpack(temp2['labels'].to_dlpack()).reshape(-1, self.num_sims).long()[self.file_ids]
        self.filelist = temp2['filename'][[(i * self.num_sims) for i in self.file_ids]].to_pandas().to_numpy()

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
    #   channels: a list of the number of channels in each convolution layer. Input is assumed to be 1 channel.
    #   kernels: the size of the square kernel used in each convolution layer. Must be same length as `channels`
    #   pools: the sizes of the square max pooling kernels. Must be same length as channels
    #   nodes: a list of the number of nodes in each hidden linear layer
    #   num_labels: the number of possible output classes
    def __init__(self, num_indivs, num_sites, channels, kernels, pools, nodes, num_labels):
        # Inherit behaviour from PyTorch class
        super(Net, self).__init__()

        # Check that parameters are acceptable
        if len(channels) != len(kernels):
            raise Exception("List of channels and kernel sizes must be same length!")
        if len(pools) != len(kernels):
            raise Exception("List of pool sizes and kernel sizes must be same length!")

        # Calculate dimensions of input after convolutions
        dims = [num_indivs, num_sites]
        for i in range(len(channels)):
            # without padding, both dimensions decrease by 1 less than kernel size
            dims = np.subtract(dims, kernels[i] - 1)
            # Max pooling divides the dimensions by pooling size (given default behaviour of stride = kernel size)
            dims = np.floor(np.divide(dims, pools[i]))

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
        # Bias is disabled for the convolution as I believe it is redundant with batch normalization, be sure to re-enable if you disable batch norm
        self.convolutions = nn.ModuleList(nn.Conv2d(channels[i], channels[i + 1], kernels[i], bias = False) for i in range(len(kernels)))
        self.batch2d = nn.ModuleList(nn.BatchNorm2d(channels[i + 1]) for i in range(len(channels) - 1))
        self.pools = nn.ModuleList(nn.MaxPool2d(pools[i]) for i in range(len(pools)))

        # Linear transforms # `nn.ModuleList()` is used in place of lists here as well
        # Bias is disabled as I believe it is redundant with batch normalization, be sure to re-enable if you disable batch norm
        self.linears = nn.ModuleList(nn.Linear(nodes[i], nodes[i + 1], bias = False) for i in range(len(nodes) - 1))
        self.batch1d = nn.ModuleList(nn.BatchNorm1d(nodes[i + 1]) for i in range(len(nodes) - 1))

        # Output layer
        # No ReLU activation for this layer as we will softmax during forward pass
        self.output = nn.Linear(nodes[-1], num_labels)

    # Apply the transformations
    #   x: SNP data
    #   pos: Position data
    def forward(self, x, pos):
        # Apply convolutions with pooling
        for conv, batch, pool in zip(self.convolutions, self.batch2d, self.pools):
            x = pool(F.relu(batch(conv(x))))

        # Unwrap and concatenate position data
        x = x.view(pos.shape[0], self.initial_nodes)
        x = torch.cat((x, pos), 1)

        # Apply linear transforms
        for lin, batch in zip(self.linears, self.batch1d):
            x = F.relu(batch(lin(x)))

        # No ReLU for output, cross entropy loss calculates soft max for us
        x = self.output(x)

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
