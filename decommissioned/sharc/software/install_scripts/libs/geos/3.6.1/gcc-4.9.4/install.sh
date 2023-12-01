#!/bin/bash

geos_vers=3.6.1
geos_tarball="geos-${geos_vers}.tar.bz2"
geos_tarball_url="http://download.osgeo.org/geos/${geos_tarball}"
compiler=gcc
compiler_vers=4.9.4

prefix="/usr/local/packages/libs/geos/${geos_vers}/${compiler}-${compiler_vers}"

modulefile="/usr/local/modulefiles/libs/geos/${geos_vers}/${compiler}-${compiler_vers}"

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
[[ -f $geos_tarball ]] || wget $geos_tarball_url
if ! [[ -f .geos_tarball_unpacked ]]; then
    tar -jxf ${geos_tarball}
    touch .geos_tarball_unpacked 
fi

# Create install and modulefile dirs
for d in $prefix $(dirname $modulefile); do
    mkdir -m 2775 -p $d
done

# Activate a compiler
module purge
module load dev/${compiler}/${compiler_vers}

# Build and install
pushd geos-${geos_vers}
./configure --prefix=${prefix}
make -j${OMP_NUM_THREADS-1}
make install
popd

# Set permissions and ownership
for d in $prefix $(dirname $modulefile); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
