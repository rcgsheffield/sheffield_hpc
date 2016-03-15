#!/bin/bash

# This is a template script for building and installing software on iceberg.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load mpi/gcc/openmpi/1.10.1

############################## Variable Setup ################################
version=1.8.16
prefix=/usr/local/packages6/libs/gcc/4.4.7/openmpi/1.10.1/hdf5/$version
build_dir=/scratch/$USER/hdf5

filename=hdf5-$version.tar.gz
baseurl=http://www.hdfgroup.org/ftp/HDF5/current/src/

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

function mkprefix {
    # Create the install directory
    if [ ! -d $prefix/$version ]
    then
       $sudo mkdir -p $prefix
       $sudo chown $USER:app-admins $prefix
    fi 
}

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
## SZIP
szip_prefix=$prefix/../szip/2.1
mkdir -p $szip_prefix
szip_prefix=$(cd $szip_prefix; pwd)
echo $szip_prefix
sleep 1
wget http://www.hdfgroup.org/ftp/lib-external/szip/2.1/src/szip-2.1.tar.gz
tar -xvf szip-2.1.tar.gz
cd szip-2.1
./configure --prefix=$szip_prefix
make
make install

cd ..

#ZLIB
zlib_prefix=$prefix/../zlib/1.2.8/
mkdir -p $zlib_prefix
zlib_prefix=$(cd $zlib_prefix; pwd)
echo $zlib_prefix
sleep 1
wget http://zlib.net/zlib-1.2.8.tar.gz
tar -xvf zlib-1.2.8.tar.gz
cd zlib-1.2.8
./configure --prefix=$zlib_prefix
make 
make install

cd ..


tar -xvf $filename
cd hdf5-$version

./configure --enable-fortran --enable-fortran2003 --enable-shared --enable-parallel --with-zlib=$zlib_prefix --with-szlib=$szip_prefix --prefix=$prefix
sleep 20
make -j 6
export HDF5TestExpress=3
cd test
make check &&
mkprefix &&

cd ..
# Install
make install

