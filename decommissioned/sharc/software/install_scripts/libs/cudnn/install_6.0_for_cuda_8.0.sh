#!/bin/bash
#
# The script installs cuDNN 6.0 for CUDA 8.0 in to the correct ShARC directory.
# The binaries can be downloaded from NVIDIA at https://developer.nvidia.com/cudnn
# and need to be saved in $MEDIA_DIR (see below)

VERS=6.0
CUDA_VERS=8.0
MEDIA_DIR=/usr/local/media/protected/cuDNN
PREFIX_BASE=/usr/local/packages/libs/cudnn/$VERS

install_dir=${PREFIX_BASE}/binary-cuda-${CUDA_VERS}
mkdir -p $install_dir
tar -C $install_dir -xvzf ${MEDIA_DIR}/cudnn-${CUDA_VERS}-linux-x64-v${VERS}.tgz 

sudo chgrp -R app-admins $PREFIX_BASE
sudo chmod -R g+w $PREFIX_BASE
