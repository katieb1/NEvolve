#!/bin/bash
#SBATCH -J hp_submit_jobs 
#SBATCH --cpus-per-task 5 
#SBATCH --mem-per-cpu=1g 
#SBATCH -t 0-4:0:0 
#SBATCH --mail-type=BEGIN,END,FAIL 
#SBATCH -o %x_%j.o

GPU = 4
CPU = 1
EPOCH = 2
DATA = '~/data/data'
METADATA = '~/data/metadata/lookup.npy'
PARAMS = '~/data/metadata/ms_param.csv'
TESTPROP = 0.9
lr_0 = (0.00005, 0.0001, 0.001, 0.01, 0.1, 1.0) 
lr_r = (0.01 0.05 0.1 0.5 1)
l2_lambda = (0.000001 0.00001 0.0001 0.001)
BATCH_SIZE = (4 8 16 32)

for i in ${lr_0[@]}; do
    for j in ${lr_r[@]}; do
        for k in ${l2_lambda[@]}; do
            for l in ${BATCH_SIZE[@]}; do
                sbatch run_hp_tune.sh -g $GPU -n $CPU -e $EPOCH\
                    -d $DATA -m $METADATA -p $PARAMS -t $TESTPROP\
                    --lr_0 ${lr_0[$i]} --lr_r ${lr_r[$j]}\
                    --l2_lambda ${l2_lambda[$k]} -b ${BATCH_SIZE[$l]}