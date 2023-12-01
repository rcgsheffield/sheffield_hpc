#!/bin/bash

# This is a template script for building and installing software on sharc.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################

############################## Variable Setup ################################
version=3.8
prefix=/usr/local/packages/apps/rosetta/$version/binary
build_dir=/scratch/$USER/rosetta

filename=/usr/local/media/protected/rosetta/3.8/rosetta_bin_linux_3.8_bundle.tgz
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
cd rosetta_bin_linux_2017.08.59291_bundle
mv * $prefix
chmod -R g+w /usr/local/packages/apps/rosetta

