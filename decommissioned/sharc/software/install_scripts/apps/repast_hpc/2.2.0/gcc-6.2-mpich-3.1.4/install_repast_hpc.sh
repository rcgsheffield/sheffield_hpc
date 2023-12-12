#!/bin/bash

# This is a template script for building and installing software on sharc.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load mpi/mpich3/3.1.4/gcc-6.2

############################## Variable Setup ################################
version=2.2.0
prefix1=/usr/local/packages/apps/repast_hpc/$version/gcc-6.2-mpich-3.1.4
prefix2=/usr/local/packages/apps/repast_hpc/$version/third-party-mpich-3.1.4
build_dir=/scratch/$USER/repast_hpc

filename=repast_hpc-2.2.0.tgz
baseurl=https://github.com/Repast/repast.hpc/releases/download/v2.2.0

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
if [ ! -d $prefix1 ]
then
   mkdir -p $prefix1
   chown $USER:hpc_app-admins $prefix1
fi 

if [ ! -d $prefix2 ]
then
   mkdir -p $prefix2
   chown $USER:hpc_app-admins $prefix2
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
cd repast_hpc-2.2.0/MANUAL_INSTALL

# Edit install.sh so that lines 7, 8 and 9 read as follows
# BASE_DIR=$prefix2
# VERSION=$version
# REPAST_DIR=$prefix1

# Install Curl, NetCDF (incl. NetCDF-CXX) and Boost in third-party dir. $prefix2
./install.sh curl
./install.sh netcdf
./install.sh boost
# Install Repast HPC in $prefix1
./install.sh rhpc

chmod -R g+w /usr/local/packages/apps/repast_hpc/$version

