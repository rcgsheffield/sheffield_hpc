#!/bin/bash

# This is a template script for building and installing software on iceberg.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.

############################# Module Loads ###################################
module load compilers/gcc/5.2
module load mpi/gcc/openmpi/1.10.0
module load libs/gcc/5.2/boost/1.59 
module load libs/gcc/5.2/scotch/6.0.4


############################## Variable Setup ################################
version=3.0.0
prefix=/usr/local/packages6/apps/gcc/5.2/openfoam/$version
build_dir=$prefix

filename=OpenFOAM-$version.tgz
filename2=ThirdParty-$version.tgz
baseurl=http://downloads.sourceforge.net/foam

# Set this to 'sudo' if you want to create the install dir using sudo.
sudo='sudo'

##############################################################################
# This should not need modifying
##############################################################################

# Create the install directory
if [ ! -d $prefix ]
then
   $sudo mkdir -p $prefix
   $sudo chown -R $USER:cs $prefix
fi 

cd $build_dir

# Download the source
if [ -e $filename ]                                               
then                                                                            
  echo "Install tarball exists. Download not required."                         
else                                                                            
  echo "Downloading source" 
  wget $baseurl/$filename
#  wget $baseurl/$filename2
fi

##############################################################################

##############################################################################
# Installation (Write the install script here)
##############################################################################

tar -xvf $filename
#tar -xvf $filename2

cd OpenFOAM-$version

# Set openfoam install directory
sed -i "s%foamInstall=\$HOME/\$WM_PROJECT%foamInstall=$build_dir%" etc/bashrc

echo "export SCOTCH_VERSION=scotch_6.0.4" > ./etc/config/scotch.sh
echo "export SCOTCH_ARCH_PATH=/usr/local/packages6/libs/gcc/5.2/scotch/6.0.4/" >> ./etc/config/scotch.sh
echo "export SCOTCH_ROOT=/usr/local/packages6/libs/gcc/5.2/scotch/6.0.4/" >> ./etc/config/scotch.sh

# Source OpenFOAM install stuff
source etc/bashrc

./Allwmake



