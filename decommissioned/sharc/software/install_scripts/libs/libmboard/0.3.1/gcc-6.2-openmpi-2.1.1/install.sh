#!/bin/bash
# Install libmboard (used by FLAME) on ShARC
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
vers=0.3.1
compiler=gcc
compiler_vers=6.2
openmpi_vers=2.1.1

tarball_name="libmboard-$vers.tgz"
tarball_top_level_dir="FLAME-HPC-libmboard-5811e29"
tarball_url="https://github.com/FLAME-HPC/libmboard/tarball/${vers}"
tarball_sha256sum="0b6ae614cb2755ec54237d194e905218fc0ab27a436dc8615411054adf3178db"
# The following is needed as the top-level directory in the tarball
# does not follow the convention of "$pkgname-$pkgversion"
tarball_top_level_dir='FLAME-HPC-libmboard-5811e29'

pkg_string_serial="libs/libmboard/${vers}/${compiler}-${compiler_vers}"
pkg_string_mpi="libs/libmboard/${vers}/${compiler}-${compiler_vers}-openmpi-${openmpi_vers}"

prefix_serial="/usr/local/packages/${pkg_string_serial}"
prefix_mpi="/usr/local/packages/${pkg_string_mpi}"

modulefile_serial="/usr/local/modulefiles/${pkg_string_serial}"
modulefile_mpi="/usr/local/modulefiles/${pkg_string_mpi}"

build_dir="/data/$USER/building/${pkg_string_serial}"

# Cunit is used for building/running libmboard unit tests
cunit_vers="2.1-3"
cunit_tarball_name="CUnit-${cunit_vers}.tar.bz2"
cunit_tarball_url="https://downloads.sourceforge.net/project/cunit/CUnit/2.1-3/${cunit_tarball_name}"
cunit_tarball_md5sum="b5f1a9f6093869c070c6e4a9450cc10c"

############################ Module Loads (serial build) ####################
module load "dev/${compiler}/${compiler_vers}"

############################ Create dirs #####################################

# Create the install directory and modulefile directory
for prefix in ${prefix_serial} ${prefix_mpi}; do
    mkdir -p -m 2775 $prefix
    chown -R $USER:app-admins $prefix
done
for modulefile in $modulefile_serial ${modulefile_mpi}; do
    mkdir -p -m 2775 $(dirname $modulefile)
done

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
for prefix in ${prefix_serial} ${prefix_mpi}; do
    ./configure --prefix=${prefix} --enable-test
    make
    make check
    make install
    make clean
    ${prefix}/share/CUnit/Test/test_cunit
done
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

touch README.in README  # avoid autoreconf/autogen.sh errors
[[ -f configure ]] && [[ -f Makefile.in ]] || autoreconf --verbose --force --install  

[[ -f Makefile ]] && make clean
./configure \
    --prefix=${prefix_serial} \
    --disable-parallel \
    --with-cunit=${prefix}
make
make test
#./tests/run_test_serial         # Test serial libmboard API
make install

module load "mpi/openmpi/${openmpi_vers}/${compiler}-${compiler_vers}"

[[ -f Makefile ]] && make clean
./configure \
    --prefix=${prefix_mpi} \
    --with-cunit=${prefix}
make
make test
#./tests/run_test_utils          # Test utility code used by both serial and parallel modules
#./tests/run_test_parallel_utils # Test utility code used only by the parallel modules
#./tests/run_test_parallel       # Test parallel libmboard API
make install

echo "NB: need to create modulefiles: "
echo " - ${modulefile_serial}"
echo " - ${modulefile_mpi}"
