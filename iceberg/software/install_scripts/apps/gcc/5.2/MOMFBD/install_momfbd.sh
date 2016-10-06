#!/bin/bash

# This is a template script for building and installing software on iceberg.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load apps/gcc/5.2/git
module load libs/gcc/5.2/cfitsio
module load libs/gcc/5.2/fftw

############################## Variable Setup ################################
name=MOMFBD
version=2016.04.14
prefix=/usr/local/packages6/apps/gcc/5.2/$name/$version
build_dir=/scratch/$USER/$name

# Set this to 'sudo' if you want to create the install dir using sudo.
sudo=''


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
   $sudo mkdir -p $prefix
   $sudo chown $USER:app-admins $prefix
fi 

# Download the source
if [ -d momfbd ]
then                                                                            
    cd momfbd
    git pull origin master
else
    git clone git://dubshen.astro.su.se/noort/momfbd
    cd momfbd
fi

##############################################################################

##############################################################################
# Installation (Write the install script here)
##############################################################################
aclocal
autoconf
./configure --prefix=$prefix --with-cfitsio=/usr/local/packages6/libs/gcc/5.2/cfitsio/3.380
make -j 8

# Install has hard coded directories, so we will have to re-make the install here
mkdir $prefix/bin
cp slave/momfbd_slave $prefix/bin
cp master/manager $prefix/bin
cp jsub/jsub $prefix/bin
cp jstat/jstat $prefix/bin
cp jdel/jdel $prefix/bin
cp sdel/sdel $prefix/bin
