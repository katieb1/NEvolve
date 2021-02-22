# Import packages
import time
import numpy as np
import sys

# Start timing code
tic = time.perf_counter()

# Load parameters
parameters = np.genfromtxt(sys.argv[1], delimiter = ',', names = True)

# Parse relevant parameters
sims = parameters.shape[0]
indivs = parameters['indvs'].astype('int32')[0] #number of individuals (from command line)
snps = parameters['snps'].astype('int32')[0]

# Initialize arrays
BIG_data = np.empty((sims, indivs, snps), dtype = '?')
positions = np.empty((sims, snps))
count = 0

# Read data and fill arrays
filepath = sys.argv[2]
with open(filepath) as f:
    
    # Read in data
    print("Reading data...")
    x = f.readlines() 
    toc = time.perf_counter()
    print(f"Read data in: {(toc - tic) :0.4f} seconds")    

    # Find position data
    print("Finding position data...")
    posits = [z for z in x if "pos" in z]
    for i in range(len(posits)):
        positions[i] = np.fromstring(posits[i][11:], sep=" ")
    toc = time.perf_counter()
    print(f"Found positions in: {(toc - tic) :0.4f} seconds")
        
    # Find indices of position data
    print("Finding simulation indices...")
    inds = np.array([i for i, s in enumerate(x) if 'pos' in s])
    # Add 1 to indices to get start of sim data
    inds = inds + 1
    # Initialize empty array
    big_dat_inds = np.zeros(shape=0, dtype='int')
    # Find indices for all simulations
    for i in range(indivs):
        big_dat_inds = np.append(big_dat_inds, inds + i)
    toc = time.perf_counter()
    print(f"Found indices in: {(toc - tic) :0.4f} seconds")
    # Order sim data
    print("Sorting indices...")
    big_dat_inds = np.sort(big_dat_inds)
    toc = time.perf_counter()
    print(f"Sorted indices in: {(toc - tic) :0.4f} seconds")
    # Fill the BIG_data array with sim data
    print("Filling simulation data...")     
    for i in range(sims):
        for j in range(indivs):
            BIG_data[i,j] = np.array(list(x[big_dat_inds[count]].strip())).astype('?')
            count+=1
    toc = time.perf_counter()
    print(f"Filled simulation data in: {(toc - tic) :0.4f} seconds")
# Save compressed output
np.savez_compressed("ms_output.npz", param=parameters, sim=BIG_data, pos=positions)

# End timing code
toc = time.perf_counter()
print(f"Total run time: {(toc - tic) :0.4f} seconds")
