#!/bin/bash

# This compiles GCNS for SU2 without a HDF5 link

gcc=4.4.7

############################# Module Loads ###################################
module load mpi/gcc/openmpi/1.10.1
module load compilers/cmake/3.3.0

############################## Variable Setup ################################
name=cgns
version=3.1.4 # As recommended by SU2
prefix=/usr/local/packages6/apps/gcc/$gcc/su2/$name/$version
build_dir=/scratch/$USER/$name

filename=v$version.tar.gz
baseurl=https://github.com/CGNS/CGNS/archive/
sudo=''


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
   $sudo mkdir -p $prefix
   $sudo chown $USER:app-admins $prefix
   $sudo chmod -R g+rwx $prefix
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

tar -xvf $filename
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$prefix -DENABLE_TESTS=ON -DENABLE_FORTRAN=ON -DCGNS_BUILD_SHARED=OFF -DCGNS_USE_SHARED=OFF ../CGNS-$version
#cmake -DCMAKE_INSTALL_PREFIX=$prefix -DCGNS_ENABLE_PARALLEL=ON ../CGNS-$version
make -j 8

make install
