# Dockerfile for RAPIDS image with PyTorch
ARG IMAGE=rapidsai/rapidsai:cuda11.0-runtime-ubuntu18.04
FROM $IMAGE

RUN source activate rapids && \
    conda install pytorch torchvision torchaudio cudatoolkit=11.0 -c pytorch

# NVIDIA Nsight Systems 2020.2.1
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        gnupg \
        wget && \
    rm -rf /var/lib/apt/lists/*
RUN wget -qO - https://developer.download.nvidia.com/devtools/repos/ubuntu2004/amd64/nvidia.pub | apt-key add - && \
    echo "deb https://developer.download.nvidia.com/devtools/repos/ubuntu2004/amd64/ /" >> /etc/apt/sources.list.d/nsight.list && \
    apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        nsight-systems-2020.2.1 && \
    rm -rf /var/lib/apt/lists/* 
