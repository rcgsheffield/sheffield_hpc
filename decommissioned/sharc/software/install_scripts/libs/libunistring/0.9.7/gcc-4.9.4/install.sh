#!/bin/bash
#
# Install the libunistring library on ShARC 

LUS_VERS=0.9.7
LUS_TARBALL="libunistring-${LUS_VERS}.tar.gz"
LUS_TARBALL_URL="http://ftp.gnu.org/gnu/libunistring/${LUS_TARBALL}"
COMPILER=gcc
COMPILER_VERS=4.9.4
BUILD_DIR="${TMPDIR-/tmp}/libunistring/${LUS_VERS}/${COMPILER}-${COMPILER_VERS}/"
PREFIX="/usr/local/packages/libs/libunistring/${LUS_VERS}/${COMPILER}-${COMPILER_VERS}/"
MODULEFILE="/usr/local/modulefiles/libs/libunistring/${LUS_VERS}/${COMPILER}-${COMPILER_VERS}"

# Signal handling for failure
handle_error () {
    errcode=$? 
    echo "Error code: $errorcode" 
    echo "Errored command: " echo "$BASH_COMMAND" 
    echo "Error on line: ${BASH_LINENO[0]}"
    exit $errcode  
}
trap handle_error ERR

# Make and switch to build directory
mkdir -m 0700 -p $BUILD_DIR
pushd $BUILD_DIR

# Activate a compiler
module purge
module load dev/${COMPILER}/${COMPILER_VERS}

# Create build, install and modulefile dirs
mkdir -m 0700 -p $BUILD_DIR
for d in $PREFIX $(dirname $MODULEFILE); do
    mkdir -m 2775 -p $d
done

# Download tarball
wget -N $LUS_TARBALL_URL $LUS_CHECKSUMS_URL
# Unpack it (if not done already)
if [[ ! -f .unpacked ]]; then
    tar -zxf $LUS_TARBALL
    touch .unpacked
fi

pushd libunistring-${LUS_VERS}
./configure --prefix=${PREFIX}
make -j ${OMP_NUM_THREADS-1}
make check
make install
popd
popd

# Set permissions and ownership
for d in $PREFIX $(dirname $MODULEFILE); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
