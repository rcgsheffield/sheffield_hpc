#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################

############################## Variable Setup ################################
version=7.2
prefix=/usr/local/packages/apps/turbomole/$version/binary
build_dir=/scratch/$USER/911turbo

filename=/usr/local/media/protected/turbomole/turbolinux72.tar.gz
filename2=/usr/local/media/protected/turbomole/license.txt
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
cd TURBOMOLE
#Move license file to TURBOMOLE dir.
mv $filename2 .
#Export env variables to enable tests
export TURBODIR=$build_dir/TURBOMOLE
export PATH=$TURBODIR/scripts:$PATH
export PATH=$TURBODIR/bin/`sysname`:$PATH
#To test binaries:
cd $TURBODIR/TURBOTEST
TTEST
#Move TURBOMOLE dir to $prefix
mv $build_dir/TURBOMOLE $prefix
#Change group ownership to unix group "turbomole"
chgrp -R turbomole /usr/local/packages/apps/turbomole
