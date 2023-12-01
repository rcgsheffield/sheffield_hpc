#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################

############################## Variable Setup ################################
version=2015.1.22
prefix=/usr/local/packages/apps/molpro/$version/binary
build_dir=/scratch/$USER/molpro

filename=/usr/local/media/protected/molpro/$version/molpro-mpp-2015.1.22.linux_x86_64_openmp.sh
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

# Execute the install script and follow input prompts (see below)
sh $filename
# Enter bin directory to link Molpro (optional) []
#
# Enter installation directory for Molpro files [/usr/local/molpro/molprop_2015_1_linux_x86_64_i8]
# $prefix
# Installation of Molpro files complete
# Please give your username for accessing molpro
# sheffieldac
# Please give your password for accessing molpro
# nYLWHVxN

# The above username and password were provided by Grant Hill, Chemistry.

# The installation was tested with an example calculation from 
# http://www.molpro.net/info/2015.1/doc/quickstart/index.html
