#!/bin/bash
# Install Samtools 1.3.1 on Iceberg

samtools_vers=1.3.1
samtools_tarball="samtools-${samtools_vers}.tar.bz2"
samtools_tarball_url="https://github.com/samtools/samtools/releases/download/${samtools_vers}/${samtools_tarball}"

compiler=gcc
compiler_vers=6.2

build_dir="/scratch/${USER}/samtools/${samtools_vers}/"
prefix="/usr/local/packages6/apps/${compiler}/${compiler_vers}/samtools/${samtools_vers}/"

modulefile="/usr/local/modulefiles/apps/${compiler}/${compiler_vers}/samtools/${samtools_vers}"

# Signal handling for failure
handle_error () {
    errcode=$? # save the exit code as the first thing done in the trap function 
    echo "error $errorcode" 
    echo "the command executing at the
    time of the error was" echo "$BASH_COMMAND" 
    echo "on line ${BASH_LINENO[0]}"
    # do some error handling, cleanup, logging, notification $BASH_COMMAND
    # contains the command that was being executed at the time of the trap
    # ${BASH_LINENO[0]} contains the line number in the script of that command
    # exit the script or return to try again, etc.
    exit $errcode  # or use some other value or do return instead 
}
trap handle_error ERR

# Create and switch to directory for compiling in
[[ -d $build_dir ]] || mkdir -p $build_dir
cd $build_dir

# Download and unpack tarball
[[ -f $samtools_tarball ]] || wget $samtools_tarball_url
if ! [[ -f .samtools_tarball_unpacked ]]; then
    tar -jxf ${samtools_tarball}
    touch .samtools_tarball_unpacked 
fi

# Create install and modulefile dirs
for d in $prefix $(dirname $modulefile); do
    mkdir -m 2775 -p $d
done

# Activate a compiler
module purge
module load compilers/${compiler}/${compiler_vers}

# Build and install
pushd samtools-${samtools_vers}
./configure --enable-plugins --enable-libcurl --prefix=$prefix
make all all-htslib
make test 2>&1 | tee $prefix/tests.log
make install install-htslib
popd

# Set permissions and ownership
for d in $prefix $(dirname $modulefile); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done

echo "Next: install modulefile for Samtools as $modulefile"
