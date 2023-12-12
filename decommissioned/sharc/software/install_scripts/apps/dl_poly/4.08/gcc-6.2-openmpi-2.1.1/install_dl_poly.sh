#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load mpi/openmpi/2.1.1/gcc-6.2
module load apps/plumed/2.3.2/gcc-6.2-openmpi-2.1.1

############################## Variable Setup ################################
version=4.08
prefix=/usr/local/packages/apps/dl_poly/$version/gcc-6.2-openmpi-2.1.1
build_dir=/scratch/$USER/dl_poly

filename=/usr/local/media/protected/dl_poly/$version/dl_poly_$version.tar.gz
baseurl=

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
cd dl_poly_$version

# Copy fix for interface with PLUMED (from Alin Marin Elena, STFC)
cp /usr/local/media/protected/dl_poly/$version/dl_poly_plumed_fix/plumed_module.F90 source/

# Copy and edit Makefile, then make for target "hpc"
cp build/Makefile_MPI_PLUMED source/Makefile
# Edit source/Makefile lines 18 and 20 to read as follows
# line 18  PLUMED_LIBDIR=/usr/local/packages/apps/plumed/2.3.2/gcc-6.2-openmpi-2.1.1/lib
# line 20  BUILDER?='Your Name'
cd source
make hpc

# Executable to copy to $prefix is ../execute/DLPOLY.Z
cd ..
cp -r execute/ $prefix
cp -r manual/ $prefix
cp -r utility/ $prefix
cp -r utils/ $prefix
chmod o+r,o+x $prefix/execute
chmod o+r     $prefix/manual
chmod o+r     $prefix/utility
chmod o+r     $prefix/utils

# To test compilation see $build_dir/data/README.txt. Specific test for integration with PLUMED:
# TEST 28 - Butane in CCl4 Solution with Umbrella Sampling via PLUMED
