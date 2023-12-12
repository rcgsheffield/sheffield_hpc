#!/bin/bash

proj_vers=4.9.3
proj_tarball="proj-${proj_vers}.tar.gz"
proj_tarball_url="http://download.osgeo.org/proj/${proj_tarball}"

compiler=gcc
compiler_vers=4.9.4

prefix="/usr/local/packages/libs/proj/${proj_vers}/${compiler}-${compiler_vers}"

modulefile="/usr/local/modulefiles/libs/proj/${proj_vers}/${compiler}-${compiler_vers}"

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
[[ -f $proj_tarball ]] || wget $proj_tarball_url
if ! [[ -f .proj_tarball_unpacked ]]; then
    tar -zxf ${proj_tarball}
    touch .proj_tarball_unpacked 
fi

# Create install and modulefile dirs
for d in $prefix $(dirname $modulefile); do
    mkdir -m 2775 -p $d
done

# Activate a compiler
module purge
module load dev/${compiler}/${compiler_vers}

# Build and install
pushd proj-${proj_vers}
./configure --prefix=${prefix}
make -j${OMP_NUM_THREADS-1}
make install
popd

# Set permissions and ownership
for d in $prefix $(dirname $modulefile); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
