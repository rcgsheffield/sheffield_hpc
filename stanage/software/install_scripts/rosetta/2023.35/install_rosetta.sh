#!/bin/bash

# This is a template script for building and installing software on sharc.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################

############################## Variable Setup ################################
version=2023.35
prefix=/opt/apps/testapps/precompiled-el7/software/staging/rosetta/$version/binary
build_dir=$TMPDIR/rosetta

filename=/opt/apps/testapps/media/eb-srcs/r/Rosetta/rosetta.binary.linux.release-362.tar.bz2
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

cd $build_dir || exit

# Create the install directory
if [ ! -d $prefix ]
then
   mkdir -p $prefix
   chown $USER:hpc_app-admins $prefix
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

tar -xjvf $filename
cd rosetta.binary.linux.release-362 || exit
mv * $prefix
chmod -R g+w /opt/apps/testapps/precompiled-el7/software/staging/rosetta