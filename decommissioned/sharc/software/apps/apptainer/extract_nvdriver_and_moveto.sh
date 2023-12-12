#!/bin/bash

NVID_VER=$1
DEST_DIR=$2

if [ "$#" -ne 2 ]; then
    echo "Use as follows: \n extract_driver_and_moveto.sh version_number path/to/move \n example: \n extract_driver_and_moveto.sh 367.57 ~/nvdriver"
    exit 1
fi

if [ ! -f "NVIDIA-Linux-x86_64-${NVID_VER}.run" ]; then
    echo "Driver installer file NVIDIA-Linux-x86_64-${NVID_VER}.run not found"
    exit 1
fi

if mkdir -p $DEST_DIR ; then
    echo "Created directory at $DEST_DIR"
else
    echo "Could not create directory at $DEST_DIR"
    exit 1
fi

chmod 755 ./NVIDIA-Linux-x86_64-${NVID_VER}.run

# extract nvidia files
if ./NVIDIA-Linux-x86_64-${NVID_VER}.run --extract-only ; then
  echo "Extracted driver"
else
  echo "Could not extract driver"
  exit 1
fi

# make links in nvidia directory
cd NVIDIA-Linux-x86_64-${NVID_VER}
ln -s libGL.so.${NVID_VER}         libGL.so.1
ln -s libEGL_nvidia.so.${NVID_VER}         libEGL_nvidia.so.0
ln -s libGLESv1_CM_nvidia.so.${NVID_VER}   libGLESv1_CM_nvidia.so.1
ln -s libGLESv2_nvidia.so.${NVID_VER}      libGLESv2_nvidia.so.2
ln -s libGLX_nvidia.so.${NVID_VER}         libGLX_indirect.so.0
ln -s libGLX_nvidia.so.${NVID_VER}         libGLX_nvidia.so.0
ln -s libnvidia-cfg.so.1                   libnvidia-cfg.so
ln -s libnvidia-cfg.so.${NVID_VER}         libnvidia-cfg.so.1
ln -s libnvidia-encode.so.1                libnvidia-encode.so
ln -s libnvidia-encode.so.${NVID_VER}      libnvidia-encode.so.1
ln -s libnvidia-fbc.so.1                   libnvidia-fbc.so
ln -s libnvidia-fbc.so.${NVID_VER}         libnvidia-fbc.so.1
ln -s libnvidia-ifr.so.1                   libnvidia-ifr.so
ln -s libnvidia-ifr.so.${NVID_VER}         libnvidia-ifr.so.1
ln -s libnvidia-ml.so.1                    libnvidia-ml.so
ln -s libnvidia-ml.so.${NVID_VER}          libnvidia-ml.so.1
ln -s libnvidia-opencl.so.${NVID_VER}      libnvidia-opencl.so.1
ln -s vdpau/libvdpau_nvidia.so.${NVID_VER} libvdpau_nvidia.so
ln -s libcuda.so.${NVID_VER}               libcuda.so
ln -s libcuda.so.${NVID_VER}               libcuda.so.1

# move into place (overwrite old if exist)
cd ..
if mv NVIDIA-Linux-x86_64-${NVID_VER}/* $DEST_DIR ; then
  echo "Successfully installed to $DEST_DIR"
else
  echo "Cannot install drivers to $DEST_DIR"
  exit 1
fi
