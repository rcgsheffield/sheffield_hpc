#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load dev/cmake/3.7.1/gcc-4.9.4
module load dev/gcc/4.9.4
module load libs/CUDA/8.0.44/binary
############################## Variable Setup ################################
version=2018.1
prefix=/usr/local/packages/apps/gromacs/$version/gcc-4.9.4-cuda-8.0
build_dir=/data/$USER/install_gromacs

filename=/data/$USER/install_gromacs/gromacs-$version.tar.gz
baseurl=

# Set this to 'sudo' if you want to create the install dir using sudo.
#sudo='sudo'


##############################################################################
# This should not need modifying
##############################################################################

# Create the build dir

if [ ! -d $build_dir ]
then
    mkdir -p $build_dir
fi

cd $build_dir

# Create the install directory
if [ ! -d $prefix ]
then
   mkdir -p $prefix
   chown $USER:app-admins $prefix
fi 

# Download the source
if [ -e $filename ]                                               
then                                                                            
  echo "Install tarball exists. Download not required."                         
else                                                                            
  echo "Downloading source" 
  wget $baseurl/$filename
fi

##############################################################################

##############################################################################
# Installation (Write the install script here)
##############################################################################

tar xfz $filename
cd gromacs-$version
mkdir build
cd build
cmake ../ -DCMAKE_C_COMPILER=gcc -DGMX_GPU=on \
         -DCMAKE_INSTALL_PREFIX=$prefix \
         -DGMX_FFT_LIBRARY=fftw3 \
         -DREGRESSIONTEST_DOWNLOAD=ON \
         -DGMX_BUILD_OWN_FFTW=ON
make
make check
# Successful "make check" gives: 100% tests passed, 0 tests failed out of 39
make install
