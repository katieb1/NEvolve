import numpy as np
import pandas as pd
import math

import cudf
import cugraph

import os
from collections import OrderedDict
import datetime
import subprocess

data = cudf.read_csv(
    "test.msout",
    header=None,
    skip_blank_lines=True
    )


cutsites = data[data['0'] == "==="].index

data_dict = OrderedDict({'param_dat': [],
                         'pos_dat': [],
                         'sim_dat': []})
ind = cutsites[0]
for i in range(len(cutsites)):
    new_dat = data[(cutsites[i]-ind):cutsites[i]]
    data_dict['param_dat'].append(new_dat.iloc[0,0].split()[1:-1])
    data_dict['pos_dat'].append(new_dat.iloc[5,0].split()[1:-1])
    data_dict['sim_dat'].append(list(new_dat.iloc[6,0]))