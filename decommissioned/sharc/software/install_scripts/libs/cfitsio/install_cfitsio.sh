#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.

############################# Module Loads ###################################

modulename=dev/gcc/8.2															# If this ever changes from dev at the start go down to line 18 and edit moduleprefix. 16/10/2020 J.Moore
module load $modulename

moduleprefix=dev-																# Strip this from the second modulenamestripped - change it if needed.
modulenamestripped="${modulename////-}"											# Believe it or not this converts the forward slash to a dash...
modulenamestripped="${modulenamestripped#"$moduleprefix"}"						# Finish by taking that prefix off and you get a nice name. 16/10/2020 J.Moore
modulefiledir=/usr/local/modulefiles/libs/$name/$version

############################## Variable Setup ################################

name=cfitsio 																	# Please go check the tar for this.
version=3.49 																	# and this too - further down they get connected with a dash - line 72. 16/10/2020 J.Moore
prefix=/usr/local/packages/libs/$name/$version/$modulenamestripped
build_dir=/scratch/$USER/$name
filename=cfitsio_latest.tar.gz
baseurl=http://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/

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
   $sudo chown $USER:hpc_app-admins $prefix  									# Fixed this to the correct group 16/10/2020 J.Moore
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
cd $name-$version 																# Fixed this to CD in the right directory, note that older versions may not requre a dash 16/10/2020 J.Moore

./configure --prefix=$prefix
make -j 8
make install

mkdir -p $modulefiledir
touch $modulefiledir/$modulenamestripped										# Touch to make the empty module file - you'll have to fill it yourself! 16/10/2020 J.Moore
