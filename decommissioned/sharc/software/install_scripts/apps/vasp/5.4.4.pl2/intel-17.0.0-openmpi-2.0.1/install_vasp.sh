#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load dev/intel-compilers/17.0.0
module load mpi/openmpi/2.0.1/intel-17.0.0
module load libs/intel-mkl/2017.0/binary

############################## Variable Setup ################################
version=5.4.4.pl2
prefix=/usr/local/packages/apps/vasp/$version/intel-17.0.0-openmpi-2.0.1
build_dir=/scratch/$USER/vasp

filename1=/data/$USER/vasp/vasp.5.4.4.pl2.tgz
#filename2=/usr/local/media/protected/vasp/5.4.1.05Feb16/patch.5.4.1.14032016.gz
#filename3=/usr/local/media/protected/vasp/5.4.1.05Feb16/patch.5.4.1.03082016.gz
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
#   chown $USER:app-admins $prefix
fi

# Download the source
#if [ -e $filename ]
#then
#  echo "Install tarball exists. Download not required."
#else
#  echo "Downloading source"
#  wget $baseurl/$filename
#fi

##############################################################################

##############################################################################
# Installation (Write the install script here)
##############################################################################

cd $prefix
gunzip -c $filename1 | tar xvf -
cd vasp.5.4.4.pl2
# apply the two patches
#gunzip -c $filename2
#gunzip -c $filename3
#patch -p0 < patch.5.4.1.14032016
#patch -p0 < patch.5.4.1.03082016
# cp makefile.include for intel compiler
cp arch/makefile.include.linux_intel makefile.include
# change intel mpiifort to openmpi mpifort
sed -i -e s/mpiifort/mpifort/ makefile.include
#info from Anthony Meijer
sed -i -e s/-lmkl_blacs_intelmpi_lp64/-lmkl_blacs_openmpi_lp64/ makefile.include
make all >& make.log
# check for executable files in ./bin - there should be 3
ls -lrt bin | awk '{print $0}END{print NR " files found"}'
# set ownership to group "vasp" and restrict world access
#chgrp -R vasp /usr/local/packages/apps/vasp
#chmod -R o-r,o-x /usr/local/packages/apps/vasp
