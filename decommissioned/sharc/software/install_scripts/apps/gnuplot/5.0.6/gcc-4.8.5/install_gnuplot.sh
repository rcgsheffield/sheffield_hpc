#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################

############################## Variable Setup ################################
version=5.0.6
prefix=/usr/local/packages/apps/gnuplot/$version/gcc-4.8.5
build_dir=/scratch/$USER/gnuplot

filename=gnuplot-$version.tar.gz
baseurl=https://sourceforge.net/projects/gnuplot/files/gnuplot/$version

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

cd gnuplot-$version
./configure --prefix=$prefix
make
make check
make install
