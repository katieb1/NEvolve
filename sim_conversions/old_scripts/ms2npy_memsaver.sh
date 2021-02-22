#!/bin/bash
#SBATCH --job-name=ms2npy_multicore
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kb169@queensu.ca
#SBATCH --mem-per-cpu 2g
#SBATCH -c 2
#SBATCH --time 4:00:00
#SBATCH -o %x_%j.o

# Load modules
module load python/3.8
module load StdEnv/2020
module load scipy-stack/2020b

# Set default argument values
INPUT="ms_timevar.msin"
OUTPUT="ms_output_timevar.msout"
CORES=2
NCHUNKS=10

# Loop through arguments to process them
for arg in "$@"
do
	case $arg in 
		-i|--input)
		INPUT="$2"
		shift
		;;
		-o|--output)
		OUTPUT="$3"
		shift
		;;
		-c|--cores)
		CORES=$4
		;;
		-n|--nchunks)
		NCHUNKS=$6
	esac
done

echo "Input File: $INPUT"
echo "Output File: $OUTPUT"
echo "Number of cores: $CORES"
echo "Number of chunks: $NCHUNKS"

# Run script
python ms2npy_memsaver.py $INPUT $OUTPUT $CORES $NCHUNKS > ms2npy_logfile.log

