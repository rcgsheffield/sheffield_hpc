#!/bin/bash
#$ -cwd
#$ -M a.person@sheffield.ac.uk
#$ -m abe
#$ -l h_rt=02:00:00
#$ -l rmem=2G
#$ -pe smp 1
#$ -N octeract-engine
#$ -q cstest.q
#$ -P cstest

#Naturally this script is for use on SGE clusters only.
#Suggested resource values above should be sane and work.
#Script written by JMoore 01-07-2021 @ The University of Sheffield IT Services.

#Notes:

########################  Options and version selections  #########################
###################################################################################


#Define Names and versions
PACKAGENAME=octeract-engine
PACKAGEVER=3.1.0

FILENAME=$PACKAGENAME-$PACKAGEVER-Linux-Centos7.tar.gz
#        octeract-engine-3.1.0-Linux.tar.gz
URL="https://download.octeract.com/$FILENAME"
#    https://download.octeract.com/octeract-engine-3.1.0-Linux.tar.gz
#    https://download.octeract.com/octeract-engine-3.1.0-Linux-Centos7.tar.gz


#Start the main work of the script
echo "Running install script to make Package: "  $PACKAGENAME " Version: "  $PACKAGEVER 


#Setup calculated variables
INSTALLDIR=/usr/local/packages/apps/$PACKAGENAME/$PACKAGEVER/binary/
SOURCEDIR=$INSTALLDIR/src

MODULEDIR=/usr/local/modulefiles/apps/$PACKAGENAME/$PACKAGEVER/
MODULEFILENAME=binary

FULLPATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")


#Load Modules
# Not needed for binary install

echo "Loaded Modules: " $LOADEDMODULES


#Make directories
mkdir -p $INSTALLDIR
mkdir -p $SOURCEDIR

echo "Install Directory: "  $INSTALLDIR
echo "Source Directory: "  $SOURCEDIR


#Go to the source directory
cd $SOURCEDIR

#Download source and extract
echo "Download Source"

if test -f "$FILENAME"; then
    rm -r $PACKAGENAME-$PACKAGEVER-Linux
    tar -xzvf  $FILENAME
else
    wget $URL
    tar -xzvf  $FILENAME
fi

#Binary Installations
#Install
echo "Installing:"
#Move binaries up to install directory.
mv $SOURCEDIR/$PACKAGENAME-$PACKAGEVER-Linux/* $INSTALLDIR


#Echo the loaded modules used to compile the installed directory
#Splits on colon sends each element to new line
echo $LOADEDMODULES | awk 'BEGIN{RS=":"}{$1=$1}1' >> $INSTALLDIR/compiler_loaded_modules_list

#Copy the used install script to install directory
cp $FULLPATH $INSTALLDIR/install_script.sge

################################## Begin adding the module file ###################################
mkdir -p $MODULEDIR

if test -f "$MODULEDIR$MODULEFILENAME"; then
    rm $MODULEDIR$MODULEFILENAME #Remove it if it already exists due to prior failure to install.
    touch $MODULEDIR$MODULEFILENAME
else
    touch $MODULEDIR$MODULEFILENAME
fi


#Dashes need to be removed from package names or module files will break.
PACKAGENAME=${PACKAGENAME//-/_}


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


if [ -d $INSTALLDIR/share/pkgconfig ]
then

cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set share PKG_CONFIG_PATH
prepend-path PKG_CONFIG_PATH     $NESTEDROOTDIRVAR/share/pkgconfig

EOF

fi

################################# Now add the ACLOCAL_PATH if needed#################################
if [ -d $INSTALLDIR/share/aclocal ]
then

cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set share ACLOCAL_PATH
prepend-path ACLOCAL_PATH     $NESTEDROOTDIRVAR/share/aclocal

EOF

fi


#################################  Custom ENV VARs in module needed  #################################
cat <<EOF >>$MODULEDIR$MODULEFILENAME

# Set PYTHONPATH
prepend-path PYTHONPATH     $NESTEDROOTDIRVAR/lib

EOF

################################# Now chmod the directories properly #################################

chown $USER:hpc_app-admins $INSTALLDIR
chmod 775 -R $INSTALLDIR
chown $USER:hpc_app-admins $MODULEDIR$MODULEFILENAME
chmod 775 $MODULEDIR$MODULEFILENAME

ELOG=${SGE_O_WORKDIR}/${JOB_NAME}.e${JOB_ID}
OLOG=${SGE_O_WORKDIR}/${JOB_NAME}.o${JOB_ID}

if test -f "$ELOG"; then
    echo "$ELOG exists. Copying to install dir."
    cp $ELOG $INSTALLDIR
fi

if test -f "$OLOG"; then
    echo "$OLOG exists. Copying to install dir."
    cp $OLOG $INSTALLDIR
fi