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
version=0.1.14
prefix=/usr/local/packages6/apps/gcc/5.2/vcftools/$version
build_dir=/scratch/cs1sjm/vcftools

filename=vcftools-$version.tar.gz
baseurl=https://github.com/vcftools/vcftools/releases/download/v$version/

# Set this to 'sudo' if you want to create the install dir using sudo.
sudo='sudo'

##############################################################################
# This should not need modifying
##############################################################################

# Create the install directory
if [ ! -d $prefix ]
then
   $sudo mkdir -p $prefix
   $sudo chown -R $USER:cs $prefix
fi 

if [ ! -d $build_dir ]; then
    mkdir -p $build_dir
fi

cd $build_dir

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

cd vcftools-$version

./configure --prefix=$prefix
make
make install

bash

