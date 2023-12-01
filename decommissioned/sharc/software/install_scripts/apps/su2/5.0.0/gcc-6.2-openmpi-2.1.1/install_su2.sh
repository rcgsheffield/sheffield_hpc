#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load mpi/openmpi/2.1.1/gcc-6.2

############################## Variable Setup ################################
version=5.0.0
prefix=/usr/local/packages/apps/su2/$version/gcc-6.2-openmpi-2.1.1
build_dir=/scratch/$USER/su2

filename=SU2-$version.tar.gz
baseurl=https://github.com/su2code/SU2/archive

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
cd SU2-5.0.0
./configure --prefix=$prefix --enable-mpi --with-cc=$(which mpicc) --with-cxx=$(which mpicxx)
make
make install
chmod -R g+w /usr/local/packages/apps/su2

