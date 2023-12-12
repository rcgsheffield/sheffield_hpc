#!/bin/bash

gdal_vers=2.2.0
gdal_tarball="gdal-${gdal_vers}.tar.gz"
gdal_tarball_url="http://download.osgeo.org/gdal/${gdal_vers}/${gdal_tarball}"
echo $gdal_tarball_url

compiler=gcc
compiler_vers=4.9.4

prefix="/usr/local/packages/libs/gdal/${gdal_vers}/${compiler}-${compiler_vers}"

modulefile="/usr/local/modulefiles/libs/gdal/${gdal_vers}/${compiler}/${compiler_vers}/"

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
[[ -f $gdal_tarball ]] || wget $gdal_tarball_url
if ! [[ -f .gdal_tarball_unpacked ]]; then
    tar -zxf ${gdal_tarball}
    touch .gdal_tarball_unpacked 
fi

# Create install and modulefile dirs
for d in $prefix $(dirname $modulefile); do
    mkdir -m 2775 -p $d
done

# Activate a compiler
module purge
module load dev/${compiler}/${compiler_vers}
module load apps/doxygen/1.8.13/${compiler}-${compiler_vers}

# Build and install
pushd gdal-${gdal_vers}
./configure --prefix=${prefix} 
make -j${OMP_NUM_THREADS-1}
make man
make install
make install-man INST_MAN=${prefix}/share/man
popd

# Set permissions and ownership
for d in $prefix $(dirname $modulefile); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
