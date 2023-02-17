#!/bin/bash
#Naturally this script is written for the SHARC clusters to install ORCA.
#Script was adapted by N Musembi 17/02/2022 .

#Notes:

########################  Options and version selections  #########################
###################################################################################
#Define Names and versions
PACKAGENAME=orca
PACKAGEVER=5.0.3

FILENAME=orca_5_0_3_linux_x86-64_shared_openmpi411.tar.xz
extractedFILENAME=orca_5_0_3_linux_x86-64_shared_openmpi411

#   Orca has their downloads behind a registration site which provides dynamic links. You will have to manually download it and place it in the correct folder .


#Start the main work of the script
echo "Running install script to make Package: "  $PACKAGENAME " Version: "  $PACKAGEVER

#Setup calculated variables
INSTALLDIR=/usr/local/packages/apps/$PACKAGENAME/$PACKAGEVER/binary/
BINARYDIR=/usr/local/modulefiles/apps/$PACKAGENAME/$PACKAGEVER/


#Make directories
mkdir -p $INSTALLDIR

echo "Install Directory: "  $INSTALLDIR

#Go to the source directory
cp $FILENAME $INSTALLDIR
cd $INSTALLDIR

#Download source and extract
echo "Download Source"


if test -f "$FILENAME"; then
        echo "The file exist "
    tar -xvf  $FILENAME
        mv $extractedFILENAME bin
        mkdir src
        mv $FILENAME src
else
    echo "=========================Install Not Found In Directory. Please download it manually==============================="
fi


mkdir $BINARYDIR
cat <<EOF >>$BINARYDIR/binary
#%Module10.2#####################################################################

## Module file logging
source /usr/local/etc/module_logging.tcl
##

proc ModulesHelp { } {
        global ver

        puts stderr " Makes $PACKAGENAME $ver available to the system."
}

# $PACKAGENAME version (not in the user's environment)
set     ver     $PACKAGEVER

module-whatis   "sets the necessary $PACKAGENAME $PACKAGEVER paths"
module           load mpi/openmpi/4.1.4/gcc-10.1
prepend-path PATH /usr/local/packages/apps/$PACKAGENAME/$PACKAGEVER/binary/bin
prepend-path ORCAHOME /usr/local/packages/apps/orca/4.0.1/binary/orca_4_0_1_linux_x86-64_openmpi202
EOF