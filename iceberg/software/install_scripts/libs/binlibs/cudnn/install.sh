#!/bin/bash

#The script installs cuDNN 5.0 for CUDA 7.5 and CUDA 8.0 in to the correct iceberg directory
#The binaries can be downloaded from Nvidia at https://developer.nvidia.com/cudnn
#We assume that the .tgz fils are in current working directory

#Install cuDNN 5.0 for CUDA 7.5
install_dir=/usr/local/packages6/libs/binlibs/cudnn/cuda7.5/cudnn5.0
mkdir -p $install_dir
tar -C $install_dir -xvzf ./cudnn-7.5-linux-x64-v5.0-ga.tgz 

#Install cuDNN 5.0 for CUDA 8.0
install_dir=/usr/local/packages6/libs/binlibs/cudnn/cuda8.0/cudnn5.0
mkdir -p $install_dir
tar -C $install_dir -xvzf ./cudnn-8.0-linux-x64-v5.0-ga.tgz 

