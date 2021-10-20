#!/bin/bash
#$ -V
#$ -cwd
#$ -M a.person@sheffield.ac.uk
#$ -m abe
#$ -l h_rt=02:00:00
#$ -l rmem=2G
#$ -pe smp 8
#$ -N dakota
#$ -q cstest.q
#$ -P cstest

#Naturally this script is for use on SGE clusters only.
#Suggested resource values above should be sane and work.
#Script written by JMoore 16-06-2021 @ The University of Sheffield IT Services.

#Notes:

########################  Options and version selections  #########################
###################################################################################


#Define Names and versions
PACKAGENAME=dakota
GCCVER=8.2
CMAKEVER=3.17.1
PACKAGEVER=6.14.0

FILENAME=$PACKAGENAME-$PACKAGEVER-release-public-src-gui_cli.tar.gz
#        dakota-6.14.0-release-public-src-gui_cli.tar.gz
URL="https://dakota.sandia.gov/sites/default/files/distributions/public/$FILENAME"
#    https://dakota.sandia.gov/sites/default/files/distributions/public/dakota-6.14.0-release-public-src-gui_cli.tar.gz


#Start the main work of the script
echo "Running install script to make Package: "  $PACKAGENAME " Version: "  $PACKAGEVER 


#Setup calculated variables
INSTALLDIR=/usr/local/packages/apps/$PACKAGENAME/$PACKAGEVER/gcc-$GCCVER-cmake-$CMAKEVER/
SOURCEDIR=$INSTALLDIR/src

MODULEDIR=/usr/local/modulefiles/apps/$PACKAGENAME/$PACKAGEVER/
MODULEFILENAME=gcc-$GCCVER-cmake-$CMAKEVER

FULLPATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/$(basename "${BASH_SOURCE[0]}")


#Load Modules
module load dev/gcc/$GCCVER
module load dev/cmake/$CMAKEVER/gcc-$GCCVER
module load libs/hdf5/1.10.4/gcc-8.2.0
module load mpi/openmpi/4.0.1/gcc-$GCCVER
module load libs/gsl/2.4/gcc-$GCCVER
module load libs/lapack/3.9.1/gcc-$GCCVER-cmake-$CMAKEVER
module load libs/boost/1.64.0/gcc-8.2-cmake-3.17.1

echo "Loaded Modules: " $LOADEDMODULES


#Make directories
mkdir -p $INSTALLDIR
mkdir -p $SOURCEDIR

echo "Install Directory: " + $INSTALLDIR
echo "Source Directory: " + $SOURCEDIR


#Go to the source directory
cd $SOURCEDIR

#Download source and extract
echo "Download Source"

if test -f "$FILENAME"; then
    rm -r $PACKAGENAME-$PACKAGEVER-release-public-src-gui_cli
    tar -xzvf  $FILENAME
else
    wget $URL
    tar -xzvf  $FILENAME
fi

cd $PACKAGENAME-$PACKAGEVER-release-public-src-gui_cli

export DAK_SRC=$(pwd)
mkdir build
export DAK_BUILD=$(pwd)/build


#Configure
echo "Configuring:"
cd $DAK_BUILD

cat <<EOF >> $DAK_SRC/cmake/BuildDakotaCustom.cmake
##############################################################################
# Set BLAS, LAPACK library paths ONLY if in non-standard locations. For MKL,
# set both BLAS_LIBS and LAPACK_LIBS to the appropriate link line. (If any
# C++ compiler options are needed by MKL, use CMAKE_CXX_FLAGS.)
##############################################################################
#set( BLAS_LIBS 
#      "/usr/lib64/libblas.so"
#      CACHE FILEPATH "Use non-standard BLAS library path" FORCE )
#set( LAPACK_LIBS 
#     "/usr/local/packages/libs/lapack/3.4.2-5/binary/lib64/liblapack.so"
#     CACHE FILEPATH "Use non-standard BLAS library path" FORCE )

##############################################################################
# Set MPI options
# Recommended practice is to set DAKOTA_HAVE_MPI and set MPI_CXX_COMPILER 
# to a compiler wrapper.
##############################################################################
set( DAKOTA_HAVE_MPI ON
     CACHE BOOL "Build with MPI enabled" FORCE)
#set( MPI_CXX_COMPILER "path/to/mpicxx"
#     CACHE FILEPATH "Use MPI compiler wrapper" FORCE)

##############################################################################
# Set Boost path if CMake cannot find your installed version of Boost or
# if you have a custom Boost install location.
##############################################################################
#set(BOOST_ROOT
#    "path/to/custom/Boost/install/directory"
#    CACHE PATH "Use non-standard Boost install" FORCE)
#set( Boost_NO_SYSTEM_PATHS TRUE
#     CACHE BOOL "Supress search paths other than BOOST_ROOT" FORCE)

##############################################################################
# Customize DAKOTA
##############################################################################
set( CMAKE_INSTALL_PREFIX
     "$INSTALLDIR"
     CACHE PATH "$INSTALLDIR" )
EOF


cmake -C $DAK_SRC/cmake/BuildDakotaCustom.cmake $DAK_SRC

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

# Add python path
prepend-path PYTHONPATH      $NESTEDROOTDIRVAR/share/dakota/Python

# Add extra dakota Test Path
prepend-path PATH            $NESTEDROOTDIRVAR/share/dakota/test

EOF

################################# Now chmod the directories properly #################################

chown $USER:hpc_app-admins $INSTALLDIR
chmod 775 -R $INSTALLDIR
chown $USER:hpc_app-admins $MODULEDIR$MODULEFILENAME
chmod 775 $MODULEDIR$MODULEFILENAME
