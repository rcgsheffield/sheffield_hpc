#!/bin/bash
# Install GNU Scientific Library GSL on ShARC
# Will Furnass 2018

# Signal handling for failure
handle_error () {
    errcode=$? 
    echo "Error code: $errcode" 
    echo "Errored command: " echo "${BASH_COMMAND}" 
    echo "Error on line: ${BASH_LINENO[0]}"
    exit $errcode  
}
trap handle_error ERR

# Bail if we encounter undefined variables
set -u

############################## Variable Setup ################################
vers=2.4
compiler=gcc
compiler_vers=6.2

tarball_name="gsl-$vers.tar.gz"
tarball_url="https://ftp.heanet.ie/mirrors/gnu/gsl/${tarball_name}"
tarball_sha256sum="4d46d07b946e7b31c19bbf33dda6204d7bedc2f5462a1bae1d4013426cd1ce9b"

pkg_string="libs/gsl/${vers}/${compiler}-${compiler_vers}"
prefix="/usr/local/packages/${pkg_string}"

modulefile="/usr/local/modulefiles/${pkg_string}"

build_dir="/data/$USER/building/${pkg_string}"


############################ Module Loads ###################################
module load "dev/${compiler}/${compiler_vers}"

############################ Create dirs #####################################

# Create the install directory and modulefile directory
mkdir -p -m 2775 $prefix
chown -R $USER:app-admins $prefix
mkdir -p -m 2775 $(dirname $modulefile)

# Create the build directory
mkdir -p ${build_dir}
cd ${build_dir}

######################### Download and unpack tarball ########################

# Check if we have a valid tarball
if $(echo "${tarball_sha256sum}  ${tarball_name}" | sha256sum -c --status 2>/dev/null); then
  echo "Source tarball exists and has a valid checksum."
else                                                                            
  echo "Source tarball does not exists or does not have a valid checksum; (re)downloading."
  curl --silent --location ${tarball_url} -o ${tarball_name}
fi

tar -zxf ${tarball_name}
pushd gsl-${vers}

###################### Configure and install #################################

[[ -f Makefile ]] && make clean
./configure --prefix=${prefix}
make
make check
make install

echo "NB: need to create modulefile: ${modulefile}"
