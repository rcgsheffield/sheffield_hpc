#!/bin/bash
# Install the the FLTK library v1.3.3 on Iceberg

fltk_vers=1.3.3
fltk_tarball="fltk-${fltk_vers}-source.tar.gz"
fltk_tarball_url="http://fltk.org/pub/fltk/1.3.3/${fltk_tarball}"

compiler=gcc
compiler_vers=4.9.2

prefix="/usr/local/packages6/libs/${compiler}/${compiler_vers}/fltk/${fltk_vers}/"

build_dir="${TMPDIR-/tmp}/${USER}/fltk/${fltk_vers}"

modulefile="/usr/local/modulefiles/libs/${compiler}/${compiler_vers}/fltk/${fltk_vers}"

workers=8

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

mkdir -m 0700 -p $build_dir
pushd $build_dir

# Download and unpack tarball
[[ -f $fltk_tarball ]] || wget $fltk_tarball_url
if ! [[ -f .fltk_tarball_unpacked ]]; then
    tar -zxf ${fltk_tarball}
    touch .fltk_tarball_unpacked 
fi

# Create install and modulefile dirs
for d in $prefix $(dirname $modulefile); do
    mkdir -m 2775 -p $d
done

# Activate a compiler
module purge
module load compilers/${compiler}/${compiler_vers}

# Build and install
pushd fltk-${fltk_vers}

#Fixes error relating to undefined _ZN18Fl_XFont_On_Demand5valueEv
#Source https://groups.google.com/forum/#!topic/fltkgeneral/GT6i2KGCb3A
sed -i 's/class Fl_XFont_On_Demand/class FL_EXPORT Fl_XFont_On_Demand/' FL/x.H

./configure --prefix=${prefix} --enable-shared --enable-xft
make -j${workers}
make install
popd

# Set permissions and ownership
for d in $prefix $(dirname $modulefile); do
    chmod -R g+w $d
    chown -R ${USER}:app-admins $d
done
