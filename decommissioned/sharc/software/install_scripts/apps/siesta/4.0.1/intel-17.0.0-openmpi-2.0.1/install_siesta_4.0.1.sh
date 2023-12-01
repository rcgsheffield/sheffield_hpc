#!/bin/bash

# This is a template script for building and installing software on sharc.
# You should use it to document how you install things.
# You will need to configure any module loads the build needs and then 
# configure the variables for the build.
# This script will then create the directories you need and download and unzip
# the source in to the build dir.


############################# Module Loads ###################################
module load mpi/openmpi/2.0.1/intel-17.0.0
module load libs/intel-mkl/2017.0/binary

############################## Variable Setup ################################
version=4.0.1
prefix1=/usr/local/packages/apps/siesta/$version/intel-17.0.0/bin
prefix2=/usr/local/packages/apps/siesta/$version/intel-17.0.0-openmpi-2.0.1/bin
build_dir=/scratch/$USER/siesta

filename=siesta-$version.tar.gz
baseurl=https://launchpad.net/siesta/4.0/4.0.1/+download

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
if [ ! -d $prefix1 ]
then
   mkdir -p $prefix1
   chown $USER:app-admins $prefix1
fi 

if [ ! -d $prefix2 ]
then
   mkdir -p $prefix2
   chown $USER:app-admins $prefix2
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

# Serial build

tar -xvf $filename
cd siesta-$version
mkdir obj-ser
cd obj-ser
../Src/obj_setup.sh
../Src/configure

# Edit the arch.make file to read as follows:
# line 24  FFLAGS=-g -w -O2 -mp -xhost
# line 35  BLAS_LIBS=-L/usr/local/packages/dev/intel-ps-xe-ce/2017.0/binary/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lmkl_blas95_lp64 -lm
# line 36  LAPACK_LIBS=-L/usr/local/packages/dev/intel-ps-xe-ce/2017.0/binary/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lmkl_lapack95_lp64 -lm
# line 40  COMP_LIBS=

make

# To test the compilation see $build_dir/siesta-$version/obj-ser/Tests/README and run the following:
cd Tests
make SIESTA=$build_dir/siesta-$version/obj-ser/siesta check

# The executable to copy to $prefix1 is $build_dir/siesta-$version/obj-ser/siesta
cp $build_dir/siesta-$version/obj-ser/siesta $prefix1
chmod -R g+w $prefix1


# Parallel build using Open MPI

cd $build_dir/siesta-$version
mkdir obj-mpi
cd obj-mpi
../Src/obj_setup.sh
../Src/configure --enable-mpi

# Edit the arch.make file to read as follows:
# line 15  FC=mpifort
# line 24  FFLAGS=-g -w -O2 -mp -xhost
# line 35  BLAS_LIBS=-L/usr/local/packages/dev/intel-ps-xe-ce/2017.0/binary/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lmkl_blas95_lp64 -lm
# line 36  LAPACK_LIBS=-L/usr/local/packages/dev/intel-ps-xe-ce/2017.0/binary/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lmkl_lapack95_lp64 -lm
# line 37  BLACS_LIBS=-L/usr/local/packages/dev/intel-ps-xe-ce/2017.0/binary/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lmkl_blacs_openmpi_lp64 -lm
# line 38  SCALAPACK_LIBS=-L/usr/local/packages/dev/intel-ps-xe-ce/2017.0/binary/compilers_and_libraries/linux/mkl/lib/intel64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lmkl_scalapack_lp64 -lm
# line 40  COMP_LIBS=

make

# To test the compilation see $build_dir/siesta-$version/obj-mpi/Tests/README and run the following:
cd Tests
make SIESTA="mpirun -np 4 $build_dir/siesta-$version/obj-mpi/siesta" check

# The executable to copy to $prefix2 is $build_dir/siesta-$version/obj-mpi/siesta
cp $build_dir/siesta-$version/obj-mpi/siesta $prefix2
chmod -R g+w $prefix2

