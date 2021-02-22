# Append + memory saver + 1 core
# Memory conservative version

print("Setting up environment...")

from npy_append_array import NpyAppendArray
import numpy as np
import sys

# Read in arguments from command line
parameters = np.genfromtxt(sys.argv[1], delimiter = ',', names = True)
filepath = sys.argv[2]
nchunks = int(sys.argv[3])

# Parse relevant parameters
sims = parameters.shape[0]
indivs = parameters['indvs'].astype('int32')[0] 
snps = parameters['snps'].astype('int32')[0]
m = int(sims / nchunks)
np.save('cnn_params.npy', parameters)
del parameters

# Creating chunk generator
print("Creating chunk generator...")
def chunkify(nchunks=nchunks, filepath=filepath):
    chunk_size = int((sims / nchunks) * (indivs+8))
    chunk_end = 0
    chunk_count = -1
    
    while chunk_end < chunk_size * nchunks:
        
        chunk_start = chunk_end
        chunk_end = chunk_end + chunk_size
        chunk_count += 1
    
        with open(filepath) as f:
            chunk = f.readlines()[chunk_start:chunk_end]
        yield chunk, chunk_count

# Extract data from input file   
print("Creating data extractor...")
def data_extractor(chunk, chunk_count):

    cc = chunk_count
    
    # Initialize appendable array in first chunk
    if cc == 0:
    
        # Find position data
        print("Initializing position data...")
        tmp_p = np.empty((m, snps))
        posits = [z for z in chunk if "pos" in z]

        for i in range(len(posits)):
            
            tmp_p[i] = np.fromstring(posits[i][11:], sep=" ")

        pos_dat_initialize = tmp_p
        np.save('pos_dat.npy', pos_dat_initialize)
        global pos_dat_array
        pos_dat_array = NpyAppendArray('pos_dat.npy')
        del tmp_p
        
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

                tmp_bd[i,j] = np.array(list(chunk[big_dat_inds[k]].strip()))

                k+=1

        big_dat_initialize = tmp_bd
        np.save('big_dat.npy', big_dat_initialize)
        global big_dat_array
        big_dat_array = NpyAppendArray('big_dat.npy')
        del tmp_bd
        del chunk        
    else:
        # Find position data
        print("Extracting position data...")
        tmp_p = np.empty((m, snps))
        posits = [z for z in chunk if "pos" in z]

        for i in range(len(posits)):

            tmp_p[i] = np.fromstring(posits[i][11:], sep=" ")

        pos_dat_array.append(tmp_p)
        del tmp_p
        
        # Find simulation data
        print("Extracting simulation data...")
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

                tmp_bd[i,j] = np.array(list(chunk[big_dat_inds[k]].strip()))

                k+=1

        big_dat_array.append(tmp_bd)
        del tmp_bd
        del chunk

# Run data through processor
print("Running input through processor...")
if __name__=='__main__':

    for chunk,chunk_count in chunkify(nchunks=nchunks,filepath=filepath):
        
        data_extractor(chunk,chunk_count)
        
print("Process complete")

