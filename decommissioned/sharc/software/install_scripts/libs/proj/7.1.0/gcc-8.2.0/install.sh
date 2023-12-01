#!/bin/bash

proj_vers=7.1.0
proj_tarball="proj-${proj_vers}.tar.gz"
proj_tarball_url="http://download.osgeo.org/proj/${proj_tarball}"

compiler=gcc
compiler_vers=8.2.0

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
module load dev/cmake/3.17.1/gcc-8.2
module load libs/sqlite/3.32.3/gcc-8.2.0
module load libs/tiff/4.1.0/gcc-8.2.0

# Build and install
pushd proj-${proj_vers}
mkdir build
cd build
cmake -DSQLITE3_INCLUDE_DIR=/usr/local/packages/libs/sqlite/3.32.3/gcc-8.2.0/include/ -DSQLITE3_LIBRARY=/usr/local/packages/libs/sqlite/3.32.3/gcc-8.2.0/lib/libsqlite3.so -DTIFF_INCLUDE_DIR=/usr/local/packages/libs/tiff/4.1.0/gcc-8.2/include -DTIFF_LIBRARY=/usr/local/packages/libs/tiff/4.1.0/gcc-8.2/lib/libtiff.so -DCMAKE_INSTALL_PREFIX:PATH=/usr/local/packages/libs/proj/7.1.0/gcc-8.2 ..
cmake --build . --target install
popd

# Set permissions and ownership
for d in $prefix $(dirname $modulefile); do
    chmod -R g+w $d
    chown -R ${USER}:hpc_app-admins $d
done
