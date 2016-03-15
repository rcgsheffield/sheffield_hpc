#!/bin/bash

# This is a template script for building and installing software on iceberg.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################



############################## Variable Setup ################################
version=6.0.4
prefix=/usr/local/packages6/libs/gcc/5.2/scotch
build_dir=/scratch/$USER/scotch

filename=scotch_$version.tar.gz
baseurl=http://gforge.inria.fr/frs/download.php/file/34618

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

cd scotch_$version

cd src
ln -s Make.inc/Makefile.inc.x86-64_pc_linux2 ./Makefile.inc
echo "prefix=$prefix/$version" >> Makefile.inc
cat Makefile.inc
make

cd check
make check

cd ..
$sudo make install
