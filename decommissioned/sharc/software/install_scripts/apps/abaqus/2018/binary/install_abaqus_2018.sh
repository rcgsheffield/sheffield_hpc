#!/bin/bash

# This is a template script for building and installing software on sharc.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.

############################# Module Loads ###################################


############################## Variable Setup ################################
version=2018
prefix=/usr/local/packages/apps/abaqus/$version/binary
package_dir=/scratch/$USER/abaqus_package

filename=/usr/local/media/abaqus/abaqus-2018/AM_SIM_Abaqus_Extend.AllOS/1/StartGUI.sh
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
# Documentation                       /usr/local/packages/apps/abaqus/2018/binary/SIMULIA2018doc
# Abaqus Simulation Services          /usr/local/packages/apps/abaqus/2018/binary/V6R2018x
# Abaqus Simulation Services CAA API  /usr/local/packages/apps/abaqus/2018/binary/V6R2018x
# Abaqus/CAE                          /usr/local/packages/apps/abaqus/2018/binary/CAE/2018
# Abaqus Commands                     /usr/local/packages/apps/abaqus/2018/binary/Commands
# Abaqus/CAE plugins                  /usr/local/packages/apps/abaqus/2018/binary/CAE/plugins/2018
# Select include path to documentation
# SIMULIA Documentation Path is       /usr/local/packages/apps/abaqus/2018/binary/SIMULIA2018doc
# The FlexLM licence server is 27000@abaquslm.shef.ac.uk
# This is a binary install
