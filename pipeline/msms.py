import os
import numpy as np
import cudf
import torch
from torch.utils.dlpack import from_dlpack

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
    def __init__(self, dir, lookup):
        self.dir = dir
        temp = np.load(lookup, allow_pickle = True).item()
        self.filelist = temp['filelist']
        self.labels = temp['labels']
        self.num_sims = temp['num_sims'] # This is the number of sims per file, not total number
        self.num_indivs = temp['num_indivs']
        self.num_sites = temp['num_sites']

    # This returns the number of files (chunks) not the number of training
    # examples. Multiple by `self.num_sims` for true number of training examples.
    def __len__(self):
        return len(self.filelist)

    # Note that the input data (X) is split into snp and position data.
    # The labels are more straightforward.
    def __getitem__(self, index):
        snps, positions = read_file(self.dir, self.filelist[index], self.num_sims, self.num_indivs, self.num_sites)
        labels = torch.from_numpy(self.labels[index]).int().to(torch.device("cuda:0"))
        return snps, positions, labels

# Function to read in concatenated msms output files
# All sims are assumed to have the same number of individuals and segregating sites.
# `rows_to_skip` should indicate the number of rows above the first row with position data
def read_file(dir, filename, num_sims, num_indivs, num_sites, rows_to_skip = 6):
    # Read in data using spaces as separator
    data = cudf.read_csv(
            os.path.join(dir, filename),
            header=None,
            sep=' ',
            skiprows = rows_to_skip)
    
    # Find every row with position data
    pos_rows = data[data['0'].isin(['positions:'])].index.to_pandas()
    
    # Find all rows with SNP data
    # This is a collection of rows after each row of position data
    # The number of rows is just the number of individuals per simulation
    snp_rows = []
    for pos_row in pos_rows:
        snp_rows.extend(range(pos_row + 1, pos_row + num_indivs + 1))
    
    # Pull the SNP data out as cuDF series, convert to torch tensor, reshape
    snps = from_dlpack(data['0'][snp_rows].str.character_tokenize().astype(int).astype(bool).to_dlpack()).reshape(num_sims, num_indivs, num_sites)
    
    # Extract position data
    positions = from_dlpack(data.iloc[pos_rows, 1:-1].astype(float).to_dlpack())

    return snps, positions
