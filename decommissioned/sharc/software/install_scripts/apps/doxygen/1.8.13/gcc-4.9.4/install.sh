#!/bin/bash

doxygen_vers=1.8.13
doxygen_tarball="doxygen-${doxygen_vers}.src.tar.gz"
doxygen_tarball_url="http://ftp.stack.nl/pub/users/dimitri/${doxygen_tarball}"

compiler=gcc
compiler_vers=4.9.4

prefix="/usr/local/packages/dev/doxygen/${doxygen_vers}/${compiler}-${compiler_vers}"

modulefile="/usr/local/modulefiles/dev/doxygen/${doxygen_vers}/${compiler}-${compiler_vers}"

# Signal handling for failure
handle_error () {
    errcode=$? # save the exit code as the first thing done in the trap function 
    echo "Error: $errorcode" 
    echo "Command: $BASH_COMMAND" 
    echo "Line: ${BASH_LINENO[0]}"
    exit $errcode  # or use some other value or do return instead 
}
trap handle_error ERR

# Download and unpack tarball
[[ -f $doxygen_tarball ]] || wget $doxygen_tarball_url
if ! [[ -f .doxygen_tarball_unpacked ]]; then
    tar -zxf ${doxygen_tarball}
    touch .doxygen_tarball_unpacked 
fi

# Create install and modulefile dirs
for d in $prefix $(dirname $modulefile); do
    mkdir -m 2775 -p $d
done

# Activate a compiler
module purge
module load dev/${compiler}/${compiler_vers}
module load dev/cmake/3.7.1/${compiler}-${compiler_vers}

# Build and install
pushd doxygen-${doxygen_vers}
mkdir -p build
pushd build
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX:PATH=${prefix} ..
make -j${OMP_NUM_THREADS-1}
make install
popd
popd

# Set permissions and ownership
for d in $prefix $(dirname $modulefile); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
