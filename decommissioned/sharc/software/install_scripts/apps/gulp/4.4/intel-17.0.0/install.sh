#!/bin/bash
################################################################################
# Install GULP 4.4 (serial and MPI builds) on the ShARC cluster
################################################################################

################################################################################
# Variables
################################################################################
VERS=4.4
TARBALL_PATH=/usr/local/media/protected/GULP/${VERS}/gulp-${VERS}.tgz
COMPILER_VERS=17.0.0
OPENMPI_VERS=2.0.1

SERIAL_BUILD_DIR=${TMPDIR-/tmp}/$USER/gulp/$VERS/intel-${COMPILER_VERS}/serial
SERIAL_BUILD_CONFIG=$(realpath getmachine_serial)
SERIAL_PREFIX=/usr/local/packages/apps/gulp/${VERS}/intel-${COMPILER_VERS}

MPI_BUILD_DIR=${TMPDIR-/tmp}/$USER/gulp/$VERS/intel-${COMPILER_VERS}/mpi
MPI_BUILD_CONFIG=$(realpath getmachine_mpi)
MPI_PREFIX=/usr/local/packages/apps/gulp/${VERS}/intel-${COMPILER_VERS}-openmpi-${OPENMPI_VERS}

#WORKERS=${OMP_NUM_THREADS-1}

################################################################################
# Error handling
################################################################################
handle_error () {
    errcode=$? 
    echo "Error code: $errorcode" 
    echo "Errored command: " echo "$BASH_COMMAND" 
    echo "Error on line: ${BASH_LINENO[0]}"
    exit $errcode  
}
trap handle_error ERR

################################################################################
# Load common modules
################################################################################
module purge
module load dev/intel-compilers/${COMPILER_VERS}
module load libs/intel-mkl/2017.0/binary

################################################################################
# Serial build
################################################################################

mkdir -m 0700 -p $SERIAL_BUILD_DIR
mkdir -m 2770 -p $SERIAL_PREFIX

tar -zxf $TARBALL_PATH -C $SERIAL_BUILD_DIR
pushd $SERIAL_BUILD_DIR/gulp-${VERS}/Src
# Create backup of config file
[[ -f getmachine.orig ]] || cp getmachine{,.orig}
# Copy config file for serial build in place
cp $SERIAL_BUILD_CONFIG getmachine
make #-j $WORKERS

cp -r $SERIAL_BUILD_DIR/gulp-${VERS}/* $SERIAL_PREFIX/
mkdir -p $SERIAL_PREFIX/bin
ln -srf $SERIAL_PREFIX/Src/gulp -t $SERIAL_PREFIX/bin/

################################################################################
# MPI build
################################################################################
module load mpi/openmpi/${OPENMPI_VERS}/intel-${COMPILER_VERS}

mkdir -m 0700 -p $MPI_BUILD_DIR
mkdir -m 2770 -p $MPI_PREFIX

tar -zxf $TARBALL_PATH -C $MPI_BUILD_DIR
pushd $MPI_BUILD_DIR/gulp-${VERS}/Src
# Create backup of config file
[[ -f getmachine.orig ]] || cp getmachine{,.orig}
# Copy config file for MPI build in place
cp $MPI_BUILD_CONFIG getmachine
make #-j $WORKERS

cp -r $MPI_BUILD_DIR/gulp-${VERS}/* $MPI_PREFIX/
mkdir -p $MPI_PREFIX/bin
ln -srf $MPI_PREFIX/Src/gulp -t $MPI_PREFIX/bin/

################################################################################
# Restrict permissions
################################################################################
chmod -R o-rwx $SERIAL_PREFIX $MPI_PREFIX
echo "Now, run the following: sudo chgrp -R gulp $SERIAL_PREFIX $MPI_PREFIX"
