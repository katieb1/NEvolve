#!/bin/bash
#SBATCH --job-name=ms2npy_test
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kb169@queensu.ca
#SBATCH --mem 25g
#SBATCH -c 1
#SBATCH --time 4:00:00
#SBATCH -o %x_%j.o

# Load modules
module load python/3.8
module load StdEnv/2020
module load scipy-stack/2020b

# Set default argument values
INPUT="ms_timevar.msin"
OUTPUT="ms_output_timevar.msout"

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
	esac
done

echo "Input File: $INPUT"
echo "Output File: $OUTPUT"

# Run script
python ms2npy_fast.py $INPUT $OUTPUT >> ms2npy_logfile.log

