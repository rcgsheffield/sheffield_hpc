#!/bin/bash
#
# Install the Boost library on ShARC 

BOOST_VERS=1.64.0
BOOST_TARBALL="boost_${BOOST_VERS//./_}.tar.gz"
BOOST_TARBALL_URL="http://downloads.sourceforge.net/project/boost/boost/${BOOST_VERS}/${BOOST_TARBALL}"
COMPILER=gcc
COMPILER_VERS=4.9.4
BUILD_DIR="${TMPDIR-/tmp}/boost/${BOOST_VERS}/${COMPILER}-${COMPILER_VERS}/"
PREFIX="/usr/local/packages/libs/boost/${BOOST_VERS}/${COMPILER}-${COMPILER_VERS}/"
MODULEFILE="/usr/local/modulefiles/libs/boost/${BOOST_VERS}/${COMPILER}-${COMPILER_VERS}"

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
module load libs/icu/58.2/${COMPILER}-${COMPILER_VERS}
module load libs/libunistring/0.9.7/${COMPILER}-${COMPILER_VERS}

# Create build, install and modulefile dirs
mkdir -m 0700 -p $BUILD_DIR
for d in $PREFIX $(dirname $MODULEFILE); do
    mkdir -m 2775 -p $d
done

# Download tarball
echo "Grabbing $BOOST_TARBALL_URL (if not already downloaded)"
wget -N $BOOST_TARBALL_URL 
# Unpack it (if not done already)
if [[ ! -f .unpacked ]]; then
    tar -zxf $BOOST_TARBALL
    touch .unpacked
fi

pushd boost_${BOOST_VERS//./_}
./bootstrap.sh --prefix=${PREFIX} --without-libraries=python
./b2 install 
popd
popd

# Set permissions and ownership
for d in $PREFIX $(dirname $MODULEFILE); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
