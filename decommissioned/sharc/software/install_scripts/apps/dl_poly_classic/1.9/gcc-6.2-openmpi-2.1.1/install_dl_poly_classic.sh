#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.
#
#This script can be used to reinstall the package on ShARC
############################# Module Loads ###################################
module load mpi/openmpi/2.1.1/gcc-6.2
module load apps/plumed/2.3.2/gcc-6.2-openmpi-2.1.1

############################## Variable Setup ################################
version=1.9
prefix=/usr/local/packages/apps/dl_poly_classic/1.9
build_dir=/scratch/$USER/dl_poly_classic/

filename=/usr/local/media/protected/dl_poly_classic/dl_class_1.9.tar.gz
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
cd dl_class_1.9



# Executable to copy to $prefix is ../execute/DLPOLY.X
cd ..
cp -r execute/ $prefix
cp -r manual/ $prefix
cp -r utility/ $prefix

chmod o+r,o+x $prefix/execute
chmod o+r     $prefix/manual
chmod o+r     $prefix/utility


