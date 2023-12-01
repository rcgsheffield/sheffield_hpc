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
version=2.3.2
prefix=/usr/local/packages/apps/plumed/$version/gcc-6.2-openmpi-2.1.1
build_dir=/scratch/$USER/plumed

filename=plumed-$version.tgz
baseurl=http://www.plumed.org/get-it

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

cd plumed-$version
./configure --prefix=$prefix CXX=mpicxx
make -j 2
make install

#Test compiled code in $build_dir
source sourceme.sh
cd regtest
make
# Test results 2017-07-28
# + Final report:
# + 193 tests performed, 38 tests not appliable
# + 3 errors found
# + Find the bug!
# + To replace references, go to the test directory and
# + type 'make reset'

# Module file on Sharc is based on $prefix/lib/plumed/modulefile template
mkdir -p /usr/local/modulefiles/apps/plumed/$version
cp $prefix/lib/plumed/modulefile /usr/local/modulefiles/apps/plumed/$version/gcc-6.2-openmpi-2.1.1
