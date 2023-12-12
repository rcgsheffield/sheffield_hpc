#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load dev/PGI-compilers/17.5

############################## Variable Setup ################################
version=d.01
prefix=/usr/local/packages/apps/gaussian_09/$version/pgi-17.5
build_dir=

filename1=/usr/local/media/protected/gaussian_09/d.01/g09.tar.gz
filename2=/usr/local/media/protected/gaussian_09/d.01/gv.tar.gz
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

# Gaussian 09 installation requires csh
/bin/csh
setenv g09root $prefix
cd $g09root
gunzip -c $filename1 | tar xvf -
# set ownership to group "gaussian09"
chgrp -R gaussian09 g09
cd g09
./bsd/install
source $g09root/g09/bsd/g09.login
bsd/bldg09 >& make.log
# check for executable files in ./g09 - there should be 83
ls -lrt *.exe | awk '{print $0}END{print NR " files found"}'

# GaussView installation
cd $g09root
gunzip -c $filename2 | tar xvf -
chgrp -R gaussian09 gv

# Installation for Department of Chemistry, unix group "ch"
cd $g09root
mkdir chem
cp -r g09 chem
cp -r gv chem
cd chem
chgrp -R ch g09
chgrp -R ch gv
