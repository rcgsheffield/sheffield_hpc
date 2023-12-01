#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.

############################# Module Loads ###################################
module load dev/gcc/4.9.4


############################## Variable Setup ################################
version=1.7
compiler=gcc-4.9.4
prefix=/usr/local/packages/apps/SAMtools/$version/$compiler
build_dir=/data/$USER/SAMtools

wget https://github.com/samtools/samtools/releases/download/1.7/samtools-1.7.tar.bz2

filename=samtools-$version.tar.bz2
baseurl=https://github.com/samtools/samtools/releases/download/$version/

# Set this to 'sudo' if you want to create the install dir using sudo.
#sudo='sudo'

##############################################################################
# This should not need modifying
##############################################################################

# Create the install directory
if [ ! -d $prefix ]
then
   #$sudo mkdir -p $prefix
   #$sudo chown -R $USER:cs $prefix
   mkdir -p $prefix
   chown -R $USER $prefix
   chgrp -R app-admins $refix
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

tar xvf $filename

cd vcftools-$version

./configure --prefix=$prefix
make
make install

bash

