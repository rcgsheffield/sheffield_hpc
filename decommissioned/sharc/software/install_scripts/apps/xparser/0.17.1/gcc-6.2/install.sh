#!/bin/bash
# Install xparser (used by FLAME) on ShARC
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
vers=0.17.1
compiler=gcc
compiler_vers=6.2

tarball_name="xparser-$vers.tgz"
tarball_top_level_dir="FLAME-HPC-xparser-ef57674"
tarball_url="https://github.com/FLAME-HPC/xparser/tarball/${vers}"
tarball_sha256sum='680f50379c26b936df7a014519010b89c03478a8045e988eb96e9fe93caf25c4'
# The following is needed as the top-level directory in the tarball
# does not follow the convention of "$pkgname-$pkgversion"
tarball_top_level_dir='FLAME-HPC-xparser-ef57674'

pkg_string="apps/xparser/${vers}/${compiler}-${compiler_vers}"
prefix="/usr/local/packages/${pkg_string}"
modulefile="/usr/local/modulefiles/${pkg_string}"

build_dir="/data/$USER/building/${pkg_string}"

# Cunit is used for building/running xparser unit tests
cunit_vers="2.1-3"
cunit_tarball_name="CUnit-${cunit_vers}.tar.bz2"
cunit_tarball_url="https://downloads.sourceforge.net/project/cunit/CUnit/2.1-3/${cunit_tarball_name}"
cunit_tarball_md5sum="b5f1a9f6093869c070c6e4a9450cc10c"

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

######################### Build Cunit so can run unit tests ##################

if $(echo "${cunit_tarball_md5sum}  ${cunit_tarball_name}" | md5sum -c --status 2>/dev/null); then
  echo "Cunit source tarball exists and has a valid checksum."
else                                                                            
  echo "Cunit tarball does not exists or does not have a valid checksum; (re)downloading."
  curl --silent --location ${cunit_tarball_url} -o ${cunit_tarball_name}
fi
tar -jxf ${cunit_tarball_name}
pushd CUnit-${cunit_vers}
autoreconf -ivf
./configure --prefix=${prefix} --enable-test
make
make install
${prefix}/share/CUnit/Test/test_cunit
popd 

######################### Download and unpack tarball ########################

# Check if we have a valid tarball
if $(echo "${tarball_sha256sum}  ${tarball_name}" | sha256sum -c --status 2>/dev/null); then
  echo "Source tarball exists and has a valid checksum."
else                                                                            
  echo "Source tarball does not exists or does not have a valid checksum; (re)downloading."
  curl --silent --location ${tarball_url} -o ${tarball_name}
fi

tar -zxf ${tarball_name}
pushd ${tarball_top_level_dir}

###################### Configure and install #################################

make clean
make
module load libs/libmboard/0.3.1/gcc-6.2-openmpi-2.1.1
sed -i "s#/Users/stc/workspace/libmboard#${prefix}#" tests/Makefile
#CPATH=${prefix}/include:${CPATH} LD_LIBRARY_PATH=${prefix}/lib:${LIBRARY_PATH} LIBMBOARD_DIR= make MAKEOVERRIDES=LIBMBOARD_DIR test
popd 
cp -rT ${tarball_top_level_dir} ${prefix}

echo "NB: need to create modulefile ${modulefile}"
