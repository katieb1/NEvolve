# import time
import numpy as np
import sys

# Start timing code
# tic = time.perf_counter()

# Parameters to set
# sys.argv[1] should be first variable passed in bash script (msin file)
parameters = np.genfromtxt(sys.argv[1], delimiter = ',', names = True)

# Parse relevant parameters
sims = parameters.shape[0]
indivs = parameters['indvs'].astype('int32')[0] #number of individuals (from command line)
snps = parameters['snps'].astype('int32')[0]
# num_header_lines = 7

# Calcualted variables
# sim_end = indivs + num_header_lines + 1 #end of sim

# Initialize data sets and counters
BIG_data = np.empty((sims, indivs, snps), dtype = '?')
positions = np.empty((sims, snps))
count = 0
sim = 0
indiv = 0

# sys.argv[2] is the second argument passed to bash script (msout file)
filepath = sys.argv[2]
with open(filepath) as f:
  x = f.readline() # Read in data
  while x:
    if(x[:3]=="pos"):
      #if(count == num_header_lines):
      positions[sim] = np.fromstring(x[11:], sep = " ")
      count = 1
    #elif(count > num_header_lines and count < sim_end):
    elif(count > 0 and count <= indivs):
      BIG_data[sim, indiv] = np.array(list(x.strip())).astype('?')
      indiv += 1
      count += 1
    elif(count==indivs+1):
      count = 0
      indiv = 0
      sim += 1
    x=f.readline()

# Save compressed output
np.savez_compressed("msout.npz", param=parameters, sim=BIG_data, pos=positions)


# print(BIG_data[0,0])
# End timing code
# toc = time.perf_counter()
# print(f"Total run time: {(toc - tic) / 60:0.4f} minutes")
