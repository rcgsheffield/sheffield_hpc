#!/bin/bash
#$ -V
#$ -cwd
#$ -M a.person@sheffield.ac.uk
#$ -m abe
#$ -l h_rt=08:00:00
#$ -l rmem=2G
#$ -pe smp 8
#$ -N Bedtools_install

#Naturally this script is for use on SGE clusters only.
#Suggested resource values above should be sane and work.
#Script written by JMoore 22-02-2021 @ The University of Sheffield IT Services.

#Notes:
#  https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools-2.30.0.tar.gz


########################  Options and version selections  #########################
###################################################################################


#Define Names and versions
PACKAGENAME=bedtools
GCCVER=8.2
CMAKEVER=3.17.1
PACKAGEVER=2.30.0


######################## You should not need to edit below ########################
###################################################################################

#Start the main work of the script
echo "Running install script to make Package: " + $PACKAGENAME " Version: " + $PACKAGEVER


#Setup calculated variables
INSTALLDIR=/usr/local/packages/apps/$PACKAGENAME/$PACKAGEVER/gcc-$GCCVER-cmake-$CMAKEVER/
SOURCEDIR=$INSTALLDIR/src

MODULEDIR=/usr/local/modulefiles/apps/$PACKAGENAME/$PACKAGEVER/
MODULEFILENAME=gcc-$GCCVER-cmake-$CMAKEVER


FILENAME=$PACKAGENAME-$PACKAGEVER.tar.gz
URL=https://github.com/arq5x/bedtools2/releases/download/v$PACKAGEVER/$FILENAME


#This is used at the end to copy the install script to the install directory if the script succeeds.
#This may be over-engineered so no matter how this script is called this copy works...

#If you are sourcing this script (why???) you may wish to amend this with $BASH_SOURCE or ${BASH_SOURCE[0]}
#See: https://stackoverflow.com/a/55798664

SCRIPTDIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPTNAME=${0}
FULLPATH=$SCRIPTDIR/$SCRIPTNAME


#Load Modules
module load dev/gcc/$GCCVER
module load dev/cmake/$CMAKEVER/gcc-$GCCVER

echo "Loaded Modules: " + $LOADEDMODULES


#Make directories
mkdir -p $INSTALLDIR
mkdir -p $SOURCEDIR

echo "Install Directory: " + $INSTALLDIR
echo "Source Directory: " + $SOURCEDIR


#Go to the source directory
cd $SOURCEDIR


#Download source and extract
echo "Download Source"

wget $URL
tar -zxvf $FILENAME
cd bedtools2

#Replace the install dir of /usr/local/ path with our Install path
sed -i "s#/usr/local#$INSTALLDIR#g" Makefile


#Clean
echo "Make precleaning:"

make -j $NSLOTS clean


#Make
echo "Making:"

make -j $NSLOTS


#Check
echo "Make checking:"

#make -j check

echo "Skipping - uncomment if desired."


#Install
echo "Make installing:"

make -j $NSLOTS install


#Echo the loaded modules used to compile the installed directory
#Splits on colon sends each element to new line
echo $LOADEDMODULES | awk 'BEGIN{RS=":"}{$1=$1}1' >> $INSTALLDIR/compiler_loaded_modules_list

#Copy the used install script to install directory
cp $FULLPATH $INSTALLDIR

#To be added - automatic module file generation - usage of EOF likely.
mkdir -p $MODULEDIR
touch $MODULEDIR$MODULEFILENAME
