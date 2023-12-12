#!/bin/bash

# This is a template script for building and installing software on sharc.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load dev/gcc/6.2

############################## Variable Setup ################################
version=0.7.17
prefix=/usr/local/packages/apps/bwa/$version/gcc-6.2/bin
build_dir=/scratch/$USER/bwa

filename=bwa-0.7.17.tar.bz2
baseurl=https://sourceforge.net/projects/bio-bwa/files

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

tar -xvf $filename
cd bwa-0.7.17
make
cp bwa $prefix

