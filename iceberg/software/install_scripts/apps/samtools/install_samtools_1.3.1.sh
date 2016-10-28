#!/bin/bash
# Install Samtools 1.3.1 on Iceberg

samtools_vers=1.3.1
samtools_tarball="samtools-${samtools_vers}.tar.bz2"
samtools_tarball_url="https://github.com/samtools/samtools/releases/download/${samtools_vers}/${samtools_tarball}"

compiler=gcc
compiler_vers=6.2

prefix="/usr/local/packages6/libs/${compiler}/${compiler_vers}/samtools/${samtools_vers}/"

modulefile_src="samtools_1.3.1_modulefile"
modulefile_dest="/usr/local/modulefiles/libs/${compiler}/${compiler_vers}/samtools/${samtools_vers}"

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

# Download and unpack tarball
[[ -f $samtools_tarball ]] || wget $samtools_tarball_url
if ! [[ -f .samtools_tarball_unpacked ]]; then
    tar -jxf ${samtools_tarball}
    touch .samtools_tarball_unpacked 
fi

# Create install and modulefile dirs
for d in $prefix $(dirname $modulefile_dest); do
    mkdir -m 2775 -p $d
done

# Activate a compiler
module purge
module load compilers/${compiler}/${compiler_vers}

# Build and install
pushd samtools-${samtools_vers}
./configure --enable-plugins --enable-libcurl --prefix=$prefix
make all all-htslib
make tests 2>&1 | tee $prefix/tests.log
make install install-htslib
popd

# Install modulefile
cp -b modulefile_src modulefile_dest

# Set permissions and ownership
for d in $prefix $(dirname $modulefile_dest); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
