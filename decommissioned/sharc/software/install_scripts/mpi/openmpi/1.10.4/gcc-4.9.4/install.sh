#!/bin/bash
# Install OpenMPI 1.10.4 built with GCC 4.9.4 on the ShARC cluster

##############################################################################
# Error handling
##############################################################################

handle_error () {
    errcode=$?
    echo "Error code: $errorcode" 
    echo "Error command: " echo "$BASH_COMMAND" 
    echo "Error on line: ${BASH_LINENO[0]}"
    exit $errcode 
} 
trap handle_error ERR

##############################################################################
# Module loads
##############################################################################

module purge
module load dev/gcc/4.9.4

##############################################################################
# Variable setup
##############################################################################

short_version=1.10
version=${short_version}.4
build_dir="/scratch/${USER}/openmpi_${version}"
prefix="/usr/local/packages/mpi/openmpi/${version}/gcc-4.9.4"

filename="openmpi-${version}.tar.gz"
baseurl="http://www.open-mpi.org/software/ompi/v${short_version}/downloads/"
mca_conf="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/openmpi-mca-params.conf"

##############################################################################
# Create build, install and modulefile dirs
##############################################################################

[[ -d $build_dir ]] || mkdir -p $build_dir
cd $build_dir

mkdir -p $prefix
chown ${USER}:app-admins $prefix
chmod 2775 $prefix

######################### Download source ###################################
if [[ -e $filename ]]; then
    echo "Install tarball exists. Download not required."                         
else                                                                            
    echo "Downloading source" 
    wget ${baseurl}/${filename}
fi

##############################################################################
# Build and install
##############################################################################

tar -xzf openmpi-${version}.tar.gz
cd openmpi-${version}

./configure --prefix=${prefix} --with-psm2
make
make check
make install

##############################################################################
# Configure default settings
##############################################################################
cp ${mca_conf} ${prefix}/etc/openmpi-mca-params.conf

##############################################################################
# Download and install examples
##############################################################################

pushd ${prefix}
curl -L https://github.com/open-mpi/ompi/archive/v${short_version}.tar.gz | tar -zx
mv ompi-${short_version}/examples .
rm -r ompi-${short_version}
popd
