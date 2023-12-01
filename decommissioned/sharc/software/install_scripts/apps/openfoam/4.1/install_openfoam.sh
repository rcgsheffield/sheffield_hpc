#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.

############################# Module Loads ###################################
module load dev/gcc/6.2
module load mpi/openmpi/2.0.1/gcc-6.2

############################## Variable Setup ################################
version=4.1
prefix=/usr/local/packages/apps/openfoam/$version/gcc-6.2-openmpi-2.0.1
build_dir=$prefix

filename=OpenFOAM-4.x-version-$version
filename2=ThirdParty-4.x-version-$version
baseurl=http://dl.openfoam.org/source/4-1
baseurl2=http://dl.openfoam.org/third-party/4-1

# Set this to 'sudo' if you want to create the install dir using sudo.
#sudo='sudo'

##############################################################################
# This should not need modifying
##############################################################################

# Create the install directory
if [ ! -d $prefix ]
then
   mkdir -p $prefix
   chown -R $USER:app-admins $prefix
#  chgrp -R app-admins $prefix
fi

cd $build_dir

# Download the source
if [ -e $filename ]
then
  echo "Install tarball exists. Download not required."
else
  echo "Downloading source"
  wget -O $baseurl  | tar xvz
  wget -O $baseurl2 | tar xvz
fi

##############################################################################

##############################################################################
# Installation (Write the install script here)
##############################################################################

#tar -xvf $filename
#tar -xvf $filename2
mv OpenFOAM-4.x-version-$version OpenFOAM-$version
mv ThirdParty-4.x-version-$version ThirdParty-$version
cd OpenFOAM-$version

# Set openfoam install directory and FOAMY_HEX_MESH=no
sed -i -e s/FOAMY_HEX_MESH=yes/FOAMY_HEX_MESH=no/ etc/bashrc
# Source OpenFOAM install stuff and install
source $prefix/etc/bashrc

./Allwmake -k -j > log 2>&1

# OpenFOAM's install documentation at
# https://openfoam.org/download/4-1-source/

