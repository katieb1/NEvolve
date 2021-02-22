# Memory conservative version

print("Setting up environment...")

# Load packages
import numpy as np
import sys
import multiprocessing as mp
from multiprocessing import sharedctypes
from scipy.sparse import csr_matrix

# Read in arguments from command line
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
big_dat_dict = {'sim_no': [], 'data': [], 'indices': [], 'pointer': []}
positions = np.ctypeslib.as_ctypes(np.empty((sims, snps)))
BIG_data = np.ctypeslib.as_ctypes(np.empty((sims, indivs, snps), dtype = '?'))
shared_array_bd = sharedctypes.RawArray(BIG_data._type_, BIG_data)
shared_array_p = sharedctypes.RawArray(positions._type_, positions)

# Creating chunk generator
print("Initializing chunk generator...")
def chunkify(nchunks=nchunks, filepath=filepath):
    chunk_size = int((sims / nchunks) * (indivs+8))
    chunk_end = 0
    chunk_count = -1
    
    while True:
        
        chunk_start = chunk_end
        chunk_end = chunk_end + chunk_size
        chunk_count += 1
        print(f"Reading chunk {chunk_count} from input file...")
        with open(filepath) as f:
            chunk = f.readlines()[chunk_start:chunk_end]
        yield chunk, chunk_count
        
        if chunk_end == chunk_size * nchunks:
            break

# Extract data from input file  
print("Initializiing data extractor...")
def data_extractor(chunk, chunk_count):

    cc = chunk_count
    
    # Find position data
    print("Extracting position data...")
    tmp_p = np.ctypeslib.as_array(shared_array_p)
    posits = [z for z in chunk if "pos" in z]

    for i in range(len(posits)):

        tmp_p[i+int(cc*m)] = np.fromstring(posits[i][11:], sep=" ")
        
    # Find simulation data
    print("Extracting simulation data...")
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
            
            tmp_bd[i+int(cc*m),j] = np.array(list(chunk[big_dat_inds[k]].strip()))
            sparse_mat = csr_matrix(tmp_bd[i+int(cc*m),j],
                                    dtype=np.float32)
            big_dat_dict['sim_no'].append(int(cc*m*indivs) + k)
            big_dat_dict['data'].append(sparse_mat.data)
            big_dat_dict['indices'].append(sparse_mat.indices)
            big_dat_dict['pointer'].append(sparse_mat.indptr)
            # Set array to zero to save memory
            tmp_bd[i+int(cc*m),j] = 0
            k+=1
    return(big_dat_dict)

# Run data through processor
print("Running processor...")
if __name__=='__main__':
    
    p = mp.Pool(n)
    results = []

    for chunk,chunk_count in chunkify(nchunks=nchunks,filepath=filepath):
        
        results.append(p.apply_async(data_extractor,(chunk,chunk_count)))
    
    positions = np.ctypeslib.as_array(shared_array_p)
        
    p.close()

# Cycle through results to fill the big_dat_dict
print("Finalizing results...")
for res in results:
    big_dat_dict['sim_no'].append(res.get()['sim_no'])
    big_dat_dict['data'].append(res.get()['data'])
    big_dat_dict['indices'].append(res.get()['indices'])
    big_dat_dict['pointer'].append(res.get()['pointer'])
    
# Save output    
print("Saving output as ms_output.npz...")
np.savez_compressed("ms_output.npz",
                    param=parameters,
                    sim_no=big_dat_dict['sim_no'],
                    sim_data=big_dat_dict['data'],
                    sim_indices=big_dat_dict['indices'],
                    sim_indptrs=big_dat_dict['pointer'],
                    pos=positions)
print("Process complete")
