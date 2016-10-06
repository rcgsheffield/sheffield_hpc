#!/bin/bash -e

# This is a template script for building and installing software on iceberg.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.

gcc=4.4.7

############################# Module Loads ###################################
module load mpi/gcc/openmpi/1.10.1

############################## Variable Setup ################################
version=4.1.0
prefix=/usr/local/packages6/apps/gcc/$gcc/su2/$version
build_dir=/scratch/$USER/su2

filename=v$version.tar.gz
baseurl=https://github.com/su2code/SU2/archive/

# Set this to 'sudo' if you want to create the install dir using sudo.
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
if [ ! -d $prefix/$version ]
then
   $sudo mkdir -p $prefix/$version
   $sudo chown $USER:cs $prefix/$version
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

cd SU2-$version

echo $HDF5_DIR
./configure \
    --prefix=$prefix\
    --enable-mpi \
    --with-cxx=$(which mpicxx) \
    --with-cc=$(which mpicc) \
    --with-CGNS-lib=/usr/local/packages6/apps/gcc/4.4.7/su2/cgns/3.1.4/lib \
    --with-CGNS-include=/usr/local/packages6/apps/gcc/4.4.7/su2/cgns/3.1.4/include/ 

sleep 20
make -j 4
#$sudo make install

bash
