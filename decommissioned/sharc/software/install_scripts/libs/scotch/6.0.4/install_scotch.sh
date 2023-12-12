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
version=6.0.4
prefix=/usr/local/packages/libs/scotch/$version/gcc-6.2-openmpi-2.0.1
build_dir=/scratch/$USER/scotch

filename=scotch_$version.tar.gz
baseurl=http://gforge.inria.fr/frs/download.php/file/34618

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

cd scotch_$version

cd src
ln -s Make.inc/Makefile.inc.x86-64_pc_linux2 ./Makefile.inc
echo "prefix=$prefix" >> Makefile.inc
cat Makefile.inc
make scotch ptscotch

cd check
make check

cd ..
make install
