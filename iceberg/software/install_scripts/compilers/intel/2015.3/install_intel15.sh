#!/bin/bash

install_dir=/usr/local/packages6/compilers/intel/2015
license_file=/usr/local/packages6/compilers/intel/license.lic

#If the installer .tgz file is called foo.tgz, tgz_base is foo
tgz_base_c=l_ccompxe_2015.3.187
tgz_base_f=l_fcompxe_2015.3.187

#Create install directory
mkdir -p $install_dir

#Decompress tarball and move silent.cfg into install directory with correct values of install_dir and license_file
tar -xzf $tgz_base_f.tgz
tar -xzf $tgz_base_c.tgz
sed -e s:SYSTEM_INSTALLDIR:$install_dir: -e s:LICENSEFILE:$license_file: silent_master.cfg > $tgz_base_c/silent.cfg
sed -e s:SYSTEM_INSTALLDIR:$install_dir: -e s:LICENSEFILE:$license_file: silent_master.cfg > $tgz_base_f/silent.cfg

#Run installer
$tgz_base_f/install.sh --silent $tgz_base_f/silent.cfg
$tgz_base_c/install.sh --silent $tgz_base_c/silent.cfg
