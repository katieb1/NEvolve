import numpy as np
import pandas as pd
import math

import cudf
import cugraph

import torch

import os
from collections import OrderedDict
import subprocess

from torch.utils.dlpack import from_dlpack

import cupy as cp

# Load in ms formatted text file

# set file name
ms_file = "ms_output_timevar4mini.msout"
rows_to_skip = 6 # This number might change depending on the msms run params, could lead to ridiculous number of cols on import

#read in file; no header, use === line as column sep
data = cudf.read_csv(
        ms_file,
        header=None,
        sep=' ',
        skiprows = rows_to_skip)

# Calculate parameters from data

sim_iter = data[data['0'].isin(['==='])].index.to_pandas().to_list()
pos_rows = data[data['0'].isin(['positions:'])].index.to_pandas().to_list()
num_indivs = sim_iter[0] - pos_rows[0] - 1
segsites = data.iloc[pos_rows[1]-1,1].astype(int)
num_sims = len(sim_iter)

# Find all rows with SNP data
snp_rows_nested = [list(range(i+1, i + num_indivs + 1)) for i in pos_rows]
snp_rows = [item for sublist in snp_rows_nested for item in sublist]

# Pull the SNP data out as cuDF series, convert to cuPy array, reshape
snp_series = data['0'][snp_rows].str.character_tokenize().astype('i')
snps = cp.asarray(snp_series).reshape(num_sims, num_indivs, segsites)

# Extract position data
positions = data.iloc[pos_rows, 1:-1]