# ms2npy memory saving version with hdf5

print("Setting up environment...")

# Load packages
import numpy as np
import sys
import h5py

# Read input data - change to sys.argv[i] after testing
parameters = np.genfromtxt(sys.argv[1], delimiter = ',', names = True)
filepath = sys.argv[2]
nchunks = int(sys.argv[3])

# Parse relevant parameters
sims = parameters.shape[0]
indivs = parameters['indvs'].astype('int32')[0]
snps = parameters['snps'].astype('int32')[0]
m = int(sims / nchunks)

# Create hdf5 object w/ chunk array storage
with h5py.File("ms2npy_output.h5", "w") as f:
    cnn_params = f.create_dataset("cnn_params", data=parameters)
    sim_dat = f.create_dataset("sim_dat", (sims, indivs, snps), chunks=(m, indivs, snps))
    pos_dat = f.create_dataset("pos_dat", (sims, snps), chunks=(m, snps))

# Creating chunk generator 
print("Creating chunk generator...")
def chunkify(nchunks=nchunks, filepath=filepath):
    chunk_size = int((sims / nchunks) * (indivs+8))
    chunk_end = 0
    
    while chunk_end < chunk_size * nchunks:
        
        chunk_start = chunk_end
        chunk_end = chunk_end + chunk_size
    
        with open(filepath) as f:
            chunk = f.readlines()[chunk_start:chunk_end]
        yield chunk
        
# Extract data from input file 
print("Creating data extractor...")
def data_extractor(chunk):

    # Find position data
    print("Initializing position data...")
    tmp_p = np.empty((m, snps))
    posits = [z for z in chunk if "pos" in z]

    for i in range(len(posits)):

        tmp_p[i] = np.fromstring(posits[i][11:], sep=" ", dtype='float32')

    # Find simulation data
    print("Initializing simulation data...")
    tmp_bd = np.empty((m, indivs, snps))
    inds = np.array([i for i, s in enumerate(chunk) if 'pos' in s])
    inds = inds + 1
    big_dat_inds = np.zeros(shape=0, dtype='int')

    for i in range(indivs):

        big_dat_inds = np.append(big_dat_inds, inds + i)

    big_dat_inds = np.sort(big_dat_inds)
    k=0

    for i in range(int(m)):

        for j in range(indivs):

            tmp_bd[i,j] = np.array(list(chunk[big_dat_inds[k]].strip()), dtype='float32')

            k+=1

    return tmp_bd, tmp_p

# Run data through processor
print("Running input through processor...")
if __name__=='__main__':

    # Don't assign count directly to m because of how python assigns variables
    count = int(sims / nchunks)
    chunk_num = 1
    for chunk in chunkify(nchunks=nchunks, filepath=filepath):
        print(f"Processing chunk {chunk_num} out of total {nchunks} chunks")
        tmp_bd, tmp_p = data_extractor(chunk)
        with h5py.File("ms2npy_output.h5", "a") as f:
            sim_dat = f["sim_dat"]
            pos_dat = f["pos_dat"]
            sim_dat[(count-m):count, :, :] = tmp_bd
            pos_dat[(count-m):count, :] = tmp_p
        count = count + m
        chunk_num += 1
        
print("Process complete")
