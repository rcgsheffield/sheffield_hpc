#!/bin/bash
#$ -V
#$ -cwd
#$ -M a.person@sheffield.ac.uk
#$ -m abe
#$ -l h_rt=08:00:00
#$ -l rmem=2G
#$ -pe smp 4
#$ -N doxygeninstall

#Naturally this script is for use on SGE clusters only.
#Suggested resource values above should be sane and work.
#Script written by JMoore 2-03-2021 @ The University of Sheffield IT Services.

#Notes: 
#


########################  Options and version selections  #########################
###################################################################################


#Define Names and versions
PACKAGENAME=doxygen
GCCVER=8.2
CMAKEVER=3.17.1
PACKAGEVER=1.9.1

FILENAME=$PACKAGENAME-$PACKAGEVER.src.tar.gz
URL=https://doxygen.nl/files/$FILENAME

#https://doxygen.nl/files/doxygen-1.9.1.src.tar.gz

######################## You should not need to edit below ########################
###################################################################################

#Start the main work of the script
echo "Running install script to make Package: " + $PACKAGENAME " Version: " + $PACKAGEVER 


#Setup calculated variables
INSTALLDIR=/usr/local/packages/apps/$PACKAGENAME/$PACKAGEVER/gcc-$GCCVER-cmake-$CMAKEVER/
SOURCEDIR=$INSTALLDIR/src

MODULEDIR=/usr/local/modulefiles/apps/$PACKAGENAME/$PACKAGEVER/
MODULEFILENAME=gcc-$GCCVER-cmake-$CMAKEVER

FULLPATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")


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
tar -xzvf  $FILENAME
cd $PACKAGENAME-$PACKAGEVER
mkdir -p build
cd build

#Configure
echo "Configuring:"

cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX:PATH=$INSTALLDIR ../


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
cp $FULLPATH $INSTALLDIR/install_script.sge

################################## Begin adding the module file ###################################
mkdir -p $MODULEDIR
touch $MODULEDIR$MODULEFILENAME

################################ Add the start of the module file #################################

cat <<EOF >>$MODULEDIR$MODULEFILENAME
#%Module1.0#####################################################################
##
## $PACKAGENAME $PACKAGEVER module file
##

## Module file logging
source /usr/local/etc/module_logging.tcl
##

proc ModulesHelp { } {
        puts stderr "Makes $PACKAGENAME $PACKAGEVER available"
}

module-whatis   "Makes $PACKAGENAME $PACKAGEVER available"

# Add required module loads

EOF

################################# Now add the needed module loads #################################

sed 's/.*/module load &/' $INSTALLDIR/compiler_loaded_modules_list >> $MODULEDIR$MODULEFILENAME


###################### Now add the Package root directory variable and path #######################

cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set package root directory
set ROOT_DIR_$PACKAGENAME  $INSTALLDIR

EOF

NESTEDROOTDIRVAR=\$ROOT_DIR_$PACKAGENAME

#################################### Now add the PATH if needed ###################################

if [ -d $INSTALLDIR/bin ] 
then

cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set executable path
prepend-path PATH        		 $NESTEDROOTDIRVAR/bin

EOF
fi

################################# Now add the LIBRARIES if needed #################################

if [ -d $INSTALLDIR/lib ] 
then

cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set library paths
prepend-path LD_LIBRARY_PATH 	 $NESTEDROOTDIRVAR/lib
prepend-path LIBRARY_PATH 	     $NESTEDROOTDIRVAR/lib

EOF
fi

if [ -d $INSTALLDIR/lib64 ] 
then

cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set 64 bit library paths
prepend-path LD_LIBRARY_PATH 	 $NESTEDROOTDIRVAR/lib64
prepend-path LIBRARY_PATH 	     $NESTEDROOTDIRVAR/lib64

EOF
fi

################################# Now add the C Pathing if needed #################################

cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set CMAKE PREFIX PATH
prepend-path CMAKE_PREFIX_PATH 	 $NESTEDROOTDIRVAR

EOF

if [ -d $INSTALLDIR/include ] 
then

cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set CMAKE INCLUDES
prepend-path CPLUS_INCLUDE_PATH  $NESTEDROOTDIRVAR/include
prepend-path CPATH 		         $NESTEDROOTDIRVAR/include

EOF
fi
################################# Now add the PKG_CONFIG if needed#################################

if [ -d $INSTALLDIR/lib/pkgconfig ] 
then

cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set PKG_CONFIG_PATH
prepend-path PKG_CONFIG_PATH     $NESTEDROOTDIRVAR/lib/pkgconfig

EOF

fi

if [ -d $INSTALLDIR/lib64/pkgconfig ] 
then

cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set 64bit PKG_CONFIG_PATH
prepend-path PKG_CONFIG_PATH     $NESTEDROOTDIRVAR/lib64/pkgconfig

EOF

fi

################################# Now chmod the directories properly #################################

chown $USER:hpc_app-admins $INSTALLDIR
chmod 775 -R $INSTALLDIR
chown $USER:hpc_app-admins $MODULEDIR$MODULEFILENAME
chmod 775 $MODULEDIR$MODULEFILENAME