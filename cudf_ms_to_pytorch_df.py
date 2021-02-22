# First pass at transforming ms output into cudf dataframe

# Import packages (taken from Matt's GitHub code)


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


# Load in ms formatted text file

# set file name
ms_file = "ms_output_timevar4mini.msout"

# number of segregating sites = width of one sim
cols = 1263

# number of individuals = length of one sim
rows = 10

# sim number (10 in toy dataset)
sims = 10

# lines before positions (white space removed)
header_lines = 5

# row length for one full set of sim output (headers, positions, sim data)
full = header_lines + 1 + rows + 1

# using file structure outlined above, generate start rows for processing loop
sim_iter = [i*full+header_lines for i in range(sims)]

#read in file; no header, use === line as column sep
data = cudf.read_csv(
        ms_file,
        header=None,
        sep="=")

## load input parameters (i.e., answers) separately? e.g.,
# params = cudf.read_csv("./params.csv")
# Otherwise, need to parse from first line

# create df list (one sim per df)
df_list = list()

#generate column names based on number of sims
df_index = [i for i in range(sims+1)]

#loop through data, starting at position rows
for dat in sim_iter:
    
    df = cudf.DataFrame(columns=df_index) #initialize cudf data frame (holds one sim)
    df[0] = data['0'][dat].lstrip("position: ").rstrip(" ").split(" ")
    df[0] = df[0].astype('float32')#remove whitespace, 'position:' string
    sub = data['0'][dat+1:dat+sims+1].to_arrow() # get rows which contain SNP data (0/1 coded data matched to position); convert to iterable object
    
    q=1 # start this loop adding to column 1 (position placed in col 0)
    for dex in sub:
        df[q] = list(dex.as_py()) #turn each SNP string into a list of individiual characters, assign to cudf column
        df[q] = df[q].astype('float32')
        q+=1 #iterate q
    df_list.append(df) # append simulation dataframe to list

# clean-up
del data
# uncomment to view structure of list of cudf dataframes
# print(df_list)

# turn dataframe list into a list of pytorch tensors
k=0
for frame in df_list:
    df_list[k] = frame.to_dlpack() # convert to dlpack tensor
    df_list[k] = from_dlpack(df_list[k]) # convert to pytorch tensor
    k+1
    
# print(df_list)

