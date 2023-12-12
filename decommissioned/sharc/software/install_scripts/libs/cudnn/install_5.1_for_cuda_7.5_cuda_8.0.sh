#!/bin/bash
#
# The script installs cuDNN 5.1 for CUDA 7.5 and CUDA 8.0 in to the correct ShARC directory
# The binaries can be downloaded from NVIDIA at https://developer.nvidia.com/cudnn
# and need to be saved in $MEDIA_DIR (see below)

VERS=5.1
MEDIA_DIR=/usr/local/media/protected/cuDNN
PREFIX_BASE=/usr/local/packages/libs/cudnn/$VERS

for cuda_vers in 7.5 8.0; do 
    install_dir=${PREFIX_BASE}/binary-cuda-${cuda_vers}
    mkdir -p $install_dir
    tar -C $install_dir -xvzf ${MEDIA_DIR}/cudnn-${cuda_vers}-linux-x64-v${VERS}.tgz 
done

sudo chgrp -R app-admins $PREFIX_BASE
sudo chmod -R g+w $PREFIX_BASE
