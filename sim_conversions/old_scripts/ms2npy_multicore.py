# Import packages
print("Setting up environment...")
import numpy as np
import sys
import multiprocessing as mp

# Load arguments
parameters = np.genfromtxt(sys.argv[1], delimiter = ',', names = True)
filepath = sys.argv[2]
n = int(sys.argv[3])
nchunks = int(sys.argv[4])

# Parse relevant parameters
sims = parameters.shape[0]
indivs = parameters['indvs'].astype('int32')[0] #number of individuals (from command line)
snps = parameters['snps'].astype('int32')[0]

# Make sure number of cores is factor of sims
assert sims % n == 0, "number of cores must be a factor of sims"
assert nchunks <= sims, "number of chunks must be less than number of sims"

# Initialize data sets and counters
BIG_data = np.empty((sims, indivs, snps), dtype = '?')
positions = np.empty((sims, snps))

# Creating chunk generator
print("Creating generator...")
def chunkify(nchunks=nchunks):
    chunk_size = int((sims / nchunks) * (indivs+8))
    chunk_end = 0
    chunk_count = 1
    while True:
        chunk_start = chunk_end
        chunk_end = chunk_end + chunk_size
        print(f"Reading chunk number {chunk_count}...")
        chunk_count += 1
        yield chunk_start, chunk_end
        if chunk_end == chunk_size * nchunks:
            break

def process_wrapper(filepath, chunk_start, chunk_end):
    with open(filepath) as f:
        x = f.readlines()[chunk_start:chunk_end]
        return(x)

print("Reading input file...")
if __name__=='__main__':
    p = mp.Pool(n)
    jobs = []

    for chunk_start,chunk_end in chunkify(nchunks=nchunks):
        
        jobs.append(p.apply_async(process_wrapper, (filepath,
                                                    chunk_start,
                                                    chunk_end)))
    print("Beginning data extraction...")
    job_no = 0    
    for job in jobs:
        chunk = job.get()
        
        # Find position data
        print("Extracting position data...")
        posits = [z for z in chunk if "pos" in z]
        for i in range(len(posits)):
            positions[job_no+i] = np.fromstring(posits[i][11:], sep=" ")
        
        # Find simulation data
        print("Extracting simulation data...")
        inds = np.array([i for i, s in enumerate(chunk) if 'pos' in s])
        inds = inds + 1
        big_dat_inds = np.zeros(shape=0, dtype='int')
        for i in range(indivs):
            big_dat_inds = np.append(big_dat_inds, inds + i)
        big_dat_inds = np.sort(big_dat_inds)
        k=0
        for i in range(int(sims / nchunks)):
            for j in range(indivs):
                BIG_data[job_no+i,j] = np.array(list(chunk[big_dat_inds[k]].strip())).astype('?')
                k+=1
        job_no += int(sims / nchunks)
        
    p.close()

# Save compressed output
print("Saving compressed output...")
np.savez_compressed("ms_output.npz", param=parameters, sim=BIG_data, pos=positions)
print("Process complete...")
