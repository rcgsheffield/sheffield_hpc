#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.

############################# Module Loads ###################################


############################## Variable Setup ################################
version=2017
prefix=/usr/local/packages/apps/abaqus/$version/binary
package_dir=/scratch/$USER/abaqus_package

filename=/usr/local/media/abaqus/ABAQUS-2017/1/StartGUI.sh
baseurl=

# Set this to 'sudo' if you want to create the install dir using sudo.
#sudo='sudo'

##############################################################################
# This should not need modifying
##############################################################################

# Create the install directory
if [ ! -d $prefix ]
then
   mkdir -p $prefix
   chown -R $USER $prefix
   chgrp -R app-admins $prefix
fi

#create package directory
if [ ! -d $package_dir ]; then
    mkdir -p $package_dir
fi

#create source directory
#if [ ! -d $source_dir ]; then
#    mkdir -p $source_dir
#fi

cd $package_dir

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

$filename

# Follow the Abaqus GUI install instructions,
# and in the GUI set installation directories as follows.
# Documentation               /usr/local/packages/apps/abaqus/2017/binary/Documentation
# Abaqus Services (Solvers)   /usr/local/packages/apps/abaqus/2017/binary/V6R2017x
# Abaqus/CAE                  /usr/local/packages/apps/abaqus/2017/binary/CAE/2017
# Abaqus Commands             /usr/local/packages/apps/abaqus/2017/binary/Commands
# Abaqus/CAE plugins          /usr/local/packages/apps/abaqus/2017/binary/CAE/plugins/2017
# The FlexLM licence server is 27000@abaquslm.shef.ac.uk
# This is a binary install
