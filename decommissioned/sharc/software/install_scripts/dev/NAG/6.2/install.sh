#!/bin/bash
# Install NAG Fortran compiler v6.2 on ShARC

set -euxo pipefail

# Define variables
nag_vers=6.2
media_dir="/usr/local/media/NAG/$nag_vers"
tarball=npl6a62na_amd64.tgz 
tarball_url=https://www.nag.co.uk/downloads/impl/$tarball
prefix=/usr/local/packages/dev/NAG/$nag_vers
tmp_dir=/tmp/${USER}/NAG/$nag_vers/
# Directory to contain binary materials:
export INSTALL_TO_BINDIR=$prefix/bin
# Directory to contain supporting library materials, which must
# be different from the binaries directory:
export INSTALL_TO_LIBDIR=$prefix/lib/NAG_Fortran
# Directory prefix for preformatted man pages:
export INSTALL_TO_CATMANDIR=$prefix/man/man
# Directory prefix for unformatted man pages;
export INSTALL_TO_MANDIR=$prefix/man/man

# Create directories
mkdir -p $media_dir

mkdir -m 2775 -p $prefix
chown -R $USER:app-admins $prefix

mkdir -p $tmp_dir

# Download and unpack 
pushd $tmp_dir
wget -c $tarball_url -P $media_dir
tar -zxf $media_dir/$tarball

# Unattended install
pushd NAG_Fortran-amd64/
sh INSTALLU.sh

popd
popd

# Test using:
#nagfor -o ~/f90_util /usr/local/packages/dev/NAG/6.2/lib/NAG_Fortran/f90_util.f90

