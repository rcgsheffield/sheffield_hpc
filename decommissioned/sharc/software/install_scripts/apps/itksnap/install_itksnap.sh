#!/bin/bash

install_dir=/usr/local/packages/apps/itksnap/3.6
mkdir -p $install_dir

#Download the 3.6 version
wget https://sourceforge.net/projects/itk-snap/files/itk-snap/3.6.0-rc1/itksnap-3.6.0-rc1-20161029-Linux-x86_64-qt4.tar.gz

#Install
tar -xvzf itksnap-3.6.0-rc1-20161029-Linux-x86_64-qt4.tar.gz
mv itksnap-3.6.0-rc1-20161029-Linux-x86_64-qt4/* $install_dir/  
