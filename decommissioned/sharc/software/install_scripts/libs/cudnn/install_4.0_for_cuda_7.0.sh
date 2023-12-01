#!/bin/bash
#
# The script installs cuDNN 4.0 for CUDA >=7.0 in to the correct ShARC directory.
# The binary can be downloaded from NVIDIA at https://developer.nvidia.com/cudnn
# and need to be saved in $MEDIA_DIR (see below).

set -eu

VERS="4.0"
VERS_MAJ="${VERS%%.*}"
CUDA_MAJ_MIN_VERS=7.0

MEDIA_DIR="/usr/local/media/protected/cuDNN"
PREFIX_BASE="/usr/local/packages/libs/cudnn/$VERS"

TARBALL="${MEDIA_DIR}/cudnn-${CUDA_MAJ_MIN_VERS}-linux-x64-v${VERS}-prod.tgz"
INSTALL_DIR="${PREFIX_BASE}/binary-cuda-${CUDA_MAJ_MIN_VERS}"
mkdir -p "$INSTALL_DIR"
tar -C "$INSTALL_DIR" -zxf "$TARBALL"

# Install examples
EXAMPLES_TARBALL="${MEDIA_DIR}/cudnn-sample-v${VERS_MAJ}.tgz"
EXAMPLES_INSTALL_DIR="${INSTALL_DIR}/cuda/src/cudnn_samples_v${VERS_MAJ}"
mkdir -p "${EXAMPLES_INSTALL_DIR}"
tar -C "${EXAMPLES_INSTALL_DIR}" -zxf "${EXAMPLES_TARBALL}"

sudo chgrp -R app-admins "$PREFIX_BASE"
sudo chmod -R g+w "$PREFIX_BASE"
