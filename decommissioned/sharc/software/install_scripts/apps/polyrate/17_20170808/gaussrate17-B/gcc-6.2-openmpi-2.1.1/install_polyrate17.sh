#!/bin/bash

# This is a template script for building and installing software on ShARC.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load mpi/openmpi/2.1.1/gcc-6.2
module load apps/gaussian_09/d.01/pgi-17.5

############################## Variable Setup ################################
version=17_20170808
prefix=/usr/local/packages/apps/polyrate/$version/gaussrate17-B/gcc-6.2-openmpi-2.1.1
build_dir=/scratch/$USER/polyrate

filename1=/usr/local/media/protected/polyrate/$version/polyrate$version.tar.gz
filename2=/usr/local/media/protected/polyrate/$version/gaussrate17-B_20170808.tar.gz
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

# First install Polyrate and then install Gaussrate

# Install Polyrate
tar -xzvf $filename1
cd polyrate17
./configure
# Follow prompts:
# [ Choose 'RP' or 'VRC' ]: RP
# Successful install gives:
# Do the options chosen above look OK? [ yes ]: yes
# ---- POLYRATE INSTALLATION COMPLETE ----
# Have a nice day! :)

# Test Polyrate installation:
cd testrun
./run_allRPVTST.jc &
./check_all.jc
./clean_up.jc

# Install Gaussrate in Polyrate directory
cd $build_dir/polyrate17
tar -xzvf $filename2
cd gaussrate17-B
./configure
# Follow prompts:
# [ Choose 'RP' or 'VRC' ]: RP
# Successful install gives:
# ---- GAUSSRATE INSTALLATION COMPLETE ----
# Have a nice day! :)

# Edit $build_dir/polyrate17/exe/shuttle to have the following lines as:
# line 19   set gausspath=/usr/local/packages/apps/gaussian_09/d.01/pgi-17.5/g09 (OR comment out and set in module file due to userids "ch" having gausspath=/usr/local/packages/apps/gaussian_09/d.01/pgi-17.5/chem/g09)
# line 55   $gausspath/g09 < $argv[1] > $argv[2]
# lines 46, 57 and 58 comment out with a #; scratchdir (line 46) is set in a user batch script

# Test Gaussrate installation:
cd $build_dir/polyrate17/gaussrate17-B/testrun/ch5
./ch5tr1.jc
diff ch5tr1.fu15 ../../testo/g16/ch5tr1.fu15
# To run all tests: polyrate17/gaussrate17-B/testrun/run_all.jc

# Copy installation to $prefix
cp -r $build_dir/polyrate17 $prefix
chmod o=rx $prefix/polyrate17 
chmod o=rx $prefix/polyrate17/exe
