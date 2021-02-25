# Dockerfile for RAPIDS image with PyTorch
FROM nvcr.io/nvidia/rapidsai/rapidsai:cuda11.0-runtime-centos7

RUN source activate rapids && \
    conda install pytorch torchvision torchaudio cudatoolkit=11.0 -c pytorch