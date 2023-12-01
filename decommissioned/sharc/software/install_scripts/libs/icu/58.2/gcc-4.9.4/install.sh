#!/bin/bash
#
# Install the ICU library on ShARC 

ICU_VERS=58.2
ICU_TARBALL="icu4c-${ICU_VERS/./_}-src.tgz"
ICU_TARBALL_URL="http://download.icu-project.org/files/icu4c/${ICU_VERS}/icu4c-${ICU_VERS/./_}-src.tgz"
ICU_CHECKSUMS_URL="https://ssl.icu-project.org/files/icu4c/${ICU_VERS}/icu4c-src-${ICU_VERS/./_}.md5"
COMPILER=gcc
COMPILER_VERS=4.9.4
BUILD_DIR="${TMPDIR-/tmp}/icu/${ICU_VERS}/${COMPILER}-${COMPILER_VERS}/"
PREFIX="/usr/local/packages/libs/icu/${ICU_VERS}/${COMPILER}-${COMPILER_VERS}/"
MODULEFILE="/usr/local/modulefiles/libs/icu/${ICU_VERS}/${COMPILER}-${COMPILER_VERS}"

# Signal handling for failure
handle_error () {
    errcode=$? 
    echo "Error code: $errorcode" 
    echo "Errored command: " echo "$BASH_COMMAND" 
    echo "Error on line: ${BASH_LINENO[0]}"
    exit $errcode  
}
trap handle_error ERR

# Make and switch to build directory
mkdir -m 0700 -p $BUILD_DIR
pushd $BUILD_DIR

# Activate a compiler
module purge
module load dev/${COMPILER}/${COMPILER_VERS}

# Create build, install and modulefile dirs
mkdir -m 0700 -p $BUILD_DIR
for d in $PREFIX $(dirname $MODULEFILE); do
    mkdir -m 2775 -p $d
done

# Download tarball
wget -N $ICU_TARBALL_URL $ICU_CHECKSUMS_URL
# Check its validity
md5sum -c *md5 2>&1 | egrep -q ': OK$'
# Unpack it (if not done already)
if [[ ! -f .unpacked ]]; then
    tar -zxf $ICU_TARBALL
    touch .unpacked
fi

pushd icu/source/
./runConfigureICU Linux/gcc --prefix=$PREFIX
# Build and run tests
make -j ${OMP_NUM_THREADS-1} check
make install
popd
popd

# Set permissions and ownership
for d in $PREFIX $(dirname $MODULEFILE); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
