#!/bin/bash
#SBATCH --job-name=ms_neeven
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kb169@queensu.ca
#SBATCH --mem 2000
#SBATCH -c 1
#SBATCH --time 10-0:0:0
#SBATCH -o %x_%j.o

mkdir ms_output

touch ./ms_output/ms_output_neeven.msout
while read indvs smps ne snps; do
	java -jar ~/ImaGene/msms/lib/msms.jar $indvs $smps -t $ne -s $snps >> ./ms_output/ms_output_neeven.msout 2>> ./ms_output/ms_neeven_err.log
	printf "===\n" >> ./ms_output/ms_output_neeven.msout
done < ./test_mode1.param
