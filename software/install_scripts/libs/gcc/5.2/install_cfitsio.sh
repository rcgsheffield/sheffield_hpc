#!/bin/bash

# This is a template script for building and installing software on iceberg.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load compilers/gcc/5.2

############################## Variable Setup ################################
name=cfitsio
version=3.380
prefix=/usr/local/packages6/libs/gcc/5.2/$name/$version
build_dir=/scratch/$USER/$name

filename=cfitsio_latest.tar.gz
baseurl=http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/

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
if [ ! -d $prefix ]
then
   $sudo mkdir -p $prefix
   $sudo chown $USER:cs $prefix
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
cd cfitsio

./configure --prefix=$prefix
make -j 8
make install
