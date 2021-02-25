# Installing RAPIDS on Compute Canada Cluster

* See [wiki](https://docs.computecanada.ca/wiki/RAPIDS) for more info

## What is RAPIDS?

RAPIDS is a suite of open source software libraries from NVIDIA for executing Python code on GPUs. It relies on NVIDIA CUDA, but uses Python APIs.

## Install with Singularity
Since Compute Canada does not support a Conda environment, we must use a Docker image to install RAPIDS. Compute Canada does not use Docker, but you can use a Docker image for RAPIDS from NVIDIA to build a Singularity image.

1. Sign on to Compute Canada account and load Singularity module
```
# Run directly or add to .bash_profile
module load singularity
```

2. Navigate to project directory and start an interactive job

```
cd ~/scratch
salloc --mem-per-cpu=2000 --cpus-per-task=4 --time=8:0:0
```

3. Pull a Docker image using the Singularity syntax

* E.g. instead of using `docker pull <path-to-image>`, replace with `singularity build <name-of-image> docker:<path-to-image>`
* the `base` RAPIDS environment is for using RAPIDS in part of your pipeline
* the `runtime` RAPIDS environment is for exploring RAPIDS through notebooks in addition to loading the base environment
* `sif` stands for Singularity Image File
* You may have to create the folders `singularity/tmp` and `singularity/cache`

```
# Pull base image
SINGULARITY_TMPDIR=~/scratch/singularity/tmp SINGULARITY_CACHEDIR=~/scratch/singularity/cache singularity build rapids_b.sif docker://rapidsai/rapidsai-core:cuda11.0-base-centos7-py3.8

# or pull runtime image
SINGULARITY_TMPDIR=~/scratch/singularity/tmp SINGULARITY_CACHEDIR=~/scratch/singularity/cache singularity build rapids_rt.sif docker://rapidsai/rapidsai-core:cuda11.0-runtime-centos7-py3.8
```

This will take ~30 min to install.

4. Running the Singularity image

* Access container shell:

```
singularity shell rapids_rt.sif
```

* Once inside shell, activate rapids

```
source /opt/conda/etc/profile.d/conda.sh
conda activate rapids
# then, to deactivate and leave Singularity once finished
conda deactivate
exit
```

5. Work interactively on a GPU

* Request interactive session

```
salloc --ntasks=1 --cpus-per-task=2 --mem=10G --gres=gpu:1 --time=1:0:0 --account=def-training-wa_gpu --reservation=warmup-wr_gpu
```

* Start RAPIDS shell on GPU node

```
module load singularity
singularity shell --nv -B /home -B /project -B /scratch  rapids_rt.sif
```

* `--nv` = bind mount the GPU driver on the host to the container
* `-B` = bind mount any file system that you would like to access in the container

* Make sure GPU device is accessible by checking stats
```
nvidia-smi
```

* Initiate Conda and activate rapids env:

```
source /opt/conda/etc/profile.d/conda.sh
conda activate rapids
```

* Launch Jupyter Notebook

```
jupyter-lab --ip $(hostname -f) --no-browser
```

* Copy resulting URL