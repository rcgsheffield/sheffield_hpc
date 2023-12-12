#!/bin/bash

module add dev/gcc/8.2

############################## Variable Setup ################################
short_version=4.0
version=${short_version}.1
build_dir="/scratch/${USER}/openmpi_${version}"
prefix="/usr/local/packages/mpi/openmpi/${version}/gcc-8.2"
workers=1  # for building in parallel

filename="openmpi-${version}.tar.gz"
baseurl="http://www.open-mpi.org/software/ompi/v${short_version}/downloads/"

##################### Create build and install dir ###########################
rm -rf $build_dir
[[ -d $build_dir ]] || mkdir -p $build_dir
cd $build_dir

mkdir -p $prefix
chown ${USER}:hpc_app-admins $prefix
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

env CPP=cpp ./configure --prefix=${prefix} --with-psm2
make -j${workers}
make check
make install

##############################################################################
# Download and install examples
##############################################################################

pushd ${prefix}
wget https://github.com/open-mpi/ompi/archive/v${short_version}.x.zip
unzip v${short_version}.x.zip 
mv ompi-${short_version}.x/examples .
rm -r ompi-${short_version}.x v${short_version}.x.zip
popd