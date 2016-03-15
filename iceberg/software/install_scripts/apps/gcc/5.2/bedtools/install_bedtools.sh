#!/bin/bash

# This is a template script for building and installing software on iceberg.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load compilers/gcc/5.2

############################## Variable Setup ################################
version=2.25.0
prefix=/usr/local/packages6/apps/gcc/5.2/bedtools/2.25.0
build_dir=/scratch/$USER/bedtools

filename=v2.25.0.tar.gz
baseurl=https://github.com/arq5x/bedtools2/archive/

# Set this to 'sudo' if you want to create the install dir using sudo.
sudo='sudo'


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
if [ ! -d $prefix/$version ]
then
   $sudo mkdir -p $prefix/$version
   $sudo chown $USER:cs $prefix/$version
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

cd bedtools2-$version/

sed -i "s@/usr/local@$prefix@g" Makefile
make -j 6

$sudo mkdir $prefix/bin
$sudo cp -r ./bin $prefix/



