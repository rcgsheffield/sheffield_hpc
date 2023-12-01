#!/bin/bash
# Install script used to install cmake 3.7.1 on ShARC

################################################################################
# Error handling
################################################################################
handle_error () {
    errcode=$?
    echo "Error code: $errorcode" 
    echo "Error cmd: " echo "$BASH_COMMAND" 
    echo "Error line: ${BASH_LINENO[0]}"
    exit $errcode  
}
trap handle_error ERR

################################################################################
# Set variables
################################################################################
SHORT_VERS=3.17
VERS="${SHORT_VERS}.1"
COMPILER=gcc
COMPILER_VERS=8.2

TARBALL_URL="https://cmake.org/files/v${SHORT_VERS}/cmake-${VERS}.tar.gz"

TMPDIR="${TMPDIR:-/tmp}"
BUILD_DIR="${TMPDIR}/${USER}/cmake/${VERS}/"

PREFIX="/usr/local/packages/dev/cmake/${VERS}/${COMPILER}-${COMPILER_VERS}"

export OMP_NUM_THREADS=1

################################################################################
# Load modules
################################################################################
# Enable a compiler
module load dev/${COMPILER}/${COMPILER_VERS}

# Enable sphinx (for building cmake's man pages)
module load apps/python/anaconda3-4.2.0

################################################################################
# Create directories and download + unpack tarball
################################################################################
mkdir -m 700 -p ${BUILD_DIR}
mkdir -m 2775 -p ${PREFIX}

pushd ${BUILD_DIR}
curl -L ${TARBALL_URL} | tar -zx
pushd cmake-${VERS}

################################################################################
# Configure, build and install
################################################################################
# Ensure that bootstrap does not find Grid Engine's 'qmake' (when hunting for
# Qt's 'qmake')
alias qmake='/no/file/here'

# Configure, build and install
./bootstrap \
    --prefix=${PREFIX} \
    --parallel=${OMP_NUM_THREADS} \
    --sphinx-man
#--mandir=${PREFIX}/man \
gmake -j ${OMP_NUM_THREADS}
gmake install

################################################################################
# Set permissions
################################################################################
chown -R ${USER}:app-admins ${PREFIX}
chmod -R g+w ${PREFIX}
