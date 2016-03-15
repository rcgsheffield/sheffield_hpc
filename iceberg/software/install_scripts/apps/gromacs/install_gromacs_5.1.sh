#!/bin/bash

module load mpi/intel/openmpi/1.10.0
module load compilers/cmake/3.3.0

version=5.1
prefix=/usr/local/packages6/apps/intel/15/gromacs

filename=gromacs-$version.tar.gz
baseurl=ftp://ftp.gromacs.org/pub/gromacs/

if [ ! -d $prefix/$version ]
then
   sudo mkdir -p $prefix/$version
   sudo chown $USER:cs $prefix/$version
fi 

if [ -e $filename ]                                               
then                                                                            
  echo "Install tarball exists. Download not required."                         
else                                                                            
  echo "Downloading source" 
  wget $baseurl/$filename
fi


tar -xvf gromacs-$version.tar.gz
cd gromacs-$version
mkdir build
cd build
mkdir 
cmake .. -DGMX_MPI=on -DCMAKE_INSTALL_PREFIX=$prefix/$version -DGMX_FFT_LIBRARY="fftw3" -DGMX_BUILD_OWN_FFTW=ON
make -j 16
make install
