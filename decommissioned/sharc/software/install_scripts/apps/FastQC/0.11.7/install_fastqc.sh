#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.

############################# Module Loads ###################################


############################## Variable Setup ################################
version=0.11.7
prefix=/usr/local/packages/apps/FastQC/$version/binary
package_dir=/scratch/$USER/FastQC_package

filename=fastqc_v0.11.7.zip
baseurl=http://www.bioinformatics.babraham.ac.uk/projects/fastqc

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

#Installation of FastQC 0.11.7 on Sharc was a binary installation. Actually installing FastQC is as simple as unzipping the zip file it comes in into a suitable location. There is a wrapper script, called 'fastqc' which is the easiest way to  start the program. The wrapper is in the top level of the FastQC installation.  You may need to make this file executable: chmod 755 fastqc

unzip $filename -d $prefix

cd $prefix
mv FastQC/* .
rm -r FastQC

chmod 755 fastqc

bash
