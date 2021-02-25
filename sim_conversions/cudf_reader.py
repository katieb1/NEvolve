import numpy as np

import cudf
import torch
from torch.utils.dlpack import from_dlpack

# Load in ms formatted text file

# set file name
def cudf_reader(ms_file="test_inputes/test.msout", rows_to_skip=6):

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
    snps = from_dlpack(data['0'][snp_rows]
                       .str.character_tokenize()
                       .astype('i')
                       .to_dlpack())
    .reshape(num_sims, num_indivs, segsites)

    # Extract position data
    positions = from_dlpack(data.iloc[pos_rows, 1:-1].astype(float).to_dlpack())
    
    return snps, positions
