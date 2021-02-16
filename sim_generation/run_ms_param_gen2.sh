#!/bin/bash
#SBATCH --job-name=run_param_gen
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kb169@queensu.ca
#SBATCH --mem 2000
#SBATCH -c 1
#SBATCH --time 4:00:00
#SBATCH -o %x_%j.o

Rscript --vanilla ms_param_gen2.R -m 1 -o "test_mode1.param" --mutation 2.89e-9 \
	-g 10 --sims 100000 -n 83 --ne_low 3 --ne_high 7 --snps 6197 --len 862945
