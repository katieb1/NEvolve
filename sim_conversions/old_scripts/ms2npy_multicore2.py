# Import packages
print("Setting up environment...")
import numpy as np
import sys
import multiprocessing as mp
from multiprocessing import sharedctypes

# Read arguments from command line
parameters = np.genfromtxt(sys.argv[1], delimiter = ',', names = True)
filepath = sys.argv[2]
n = int(sys.argv[3])
nchunks = int(sys.argv[4])

# Parse relevant parameters
sims = parameters.shape[0]
indivs = parameters['indvs'].astype('int32')[0] 
snps = parameters['snps'].astype('int32')[0]
m = sims / nchunks

# Initialize arrays
BIG_data = np.ctypeslib.as_ctypes(np.empty((sims, indivs, snps), dtype = '?'))
shared_array_bd = sharedctypes.RawArray(BIG_data._type_, BIG_data)
positions = np.ctypeslib.as_ctypes(np.empty((sims, snps)))
shared_array_p = sharedctypes.RawArray(positions._type_, positions)

# Creating chunk generator
print("Creating chunk generator...")
def chunkify(nchunks=nchunks, filepath=filepath):
    chunk_size = int((sims / nchunks) * (indivs+8))
    chunk_end = 0
    chunk_count = -1
    
    while True:
        
        chunk_start = chunk_end
        chunk_end = chunk_end + chunk_size
        chunk_count += 1
        print("Reading input file...")
        with open(filepath) as f:
            chunk = f.readlines()[chunk_start:chunk_end]
        yield chunk, chunk_count
        
        if chunk_end == chunk_size * nchunks:
            break

# Extract data from input file
print("Creating data extractor...")            
def data_extractor(chunk, chunk_count):

    cc = chunk_count
    
    # Find position data
    print("Finding position data...")
    tmp_p = np.ctypeslib.as_array(shared_array_p)
    posits = [z for z in chunk if "pos" in z]

    for i in range(len(posits)):

        tmp_p[i+int(cc*m)] = np.fromstring(posits[i][11:], sep=" ")
        
    # Find simulation data
    print("Filling simulation array...")
    tmp_bd = np.ctypeslib.as_array(shared_array_bd)
    inds = np.array([i for i, s in enumerate(chunk) if 'pos' in s])
    inds = inds + 1
    big_dat_inds = np.zeros(shape=0, dtype='int')
    
    for i in range(indivs):
        
        big_dat_inds = np.append(big_dat_inds, inds + i)
        
    big_dat_inds = np.sort(big_dat_inds)
    k=0

    for i in range(int(m)):
        
        for j in range(indivs):
            
            tmp_bd[i+int(cc*m),j] = np.array(list(chunk[big_dat_inds[k]].strip())).astype('?')
            k+=1

# Run data through processor
if __name__=='__main__':
    
    p = mp.Pool(n)
    
    print("Running generator through multiprocessor...")
    for chunk,chunk_count in chunkify(nchunks=nchunks,filepath=filepath):
        
        results = p.apply_async(data_extractor,(chunk,chunk_count))
    
    BIG_data = np.ctypeslib.as_array(shared_array_bd)
    positions = np.ctypeslib.as_array(shared_array_p)
        
    p.close()

# Save output    
print("Saving output...")
np.savez_compressed("ms_output.npz",
                    param=parameters,
                    sim=BIG_data,
                    pos=positions)
print("Process complete")
