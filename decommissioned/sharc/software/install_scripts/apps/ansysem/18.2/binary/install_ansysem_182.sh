#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.

############################# Module Loads ###################################


############################## Variable Setup ################################
version=18.2
prefix=/usr/local/packages/apps/ansysem/$version/binary
package_dir=/scratch/$USER/ansysem_package_$version

filename=/usr/local/media/ansys/Electronics_182_LINX64/install
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

# follow the Ansys EM GUI install instructions,
# in GUI set install directory to
# /usr/local/packages/apps/ansysem/18.2/binary
# the licence server is 1055@ansyslm.shef.ac.uk
# this is a binary install
#
# To integrate with Ansys 18.2 Workbench run the following:
$prefix/AnsysEM18.2/Linux64/scripts/IntegrateWithANSYS18.2.pl

bash
