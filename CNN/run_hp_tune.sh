#!/bin/bash
#SBATCH -J run_hp_tune 
#SBATCH --account=def-training-wa_gpu
#SBATCH --reservation=hackathon-wr_gpu
#SBATCH --gres=gpu:4
#SBATCH --cpus-per-task 5 
#SBATCH --mem-per-cpu=10g 
#SBATCH -t 0-3:0:0 
#SBATCH --mail-type=BEGIN,END,FAIL 
#SBATCH -o %x_%j.o

# Process arguments
for arg in "$@"
do
  	case $arg in
                -g|--gpus)
                GPU=$2
                shift
                ;;
                -n|--cpunodes)
                CPU=$3
                shift
                ;;
                -e|--epochs)
                EPOCH=$4
                shift
                ;;
                -d|--data)
                DATA="$5"
                shift
                ;;
                -m|--metadata)
                METADATA="$6"
                shift
                ;;
                -p|--params)
                PARAMS="$7" 
                shift
                ;;
                -t|--testprop)
                TESTPROP=$8    
                 shift
                ;;
                --lr_0)
                lr_0=$9  
                shift
                ;;
                --lr_r)
                lr_r=${10}
                shift
                ;;
                --l2_lambda)
                l2_lambda=${11}
                shift
                ;;
                -b|--batch_size)
                BATCH_SIZE=${12}                                                                                      
        esac
done

# Set singularity image and activate rapids
singularity shell --nv -B /scratch\
     /scratch/laceyg/genetix/rapids_pytorch.sif
source /opt/conda/etc/profile.d/conda.sh
conda activate rapids

# Run function
python CNN_ddp.py -g $GPU -n $CPU -e $EPOCH -d $DATA\
    -m $METADATA -p $PARAMS -t $TESTPROP --lr_0 $lr_0\
    --lr_r $lr_r --l2_lambda $l2_lambda -b $BATCH_SIZE



