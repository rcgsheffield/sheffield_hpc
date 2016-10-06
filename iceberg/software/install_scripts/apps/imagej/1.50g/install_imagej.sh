#!/bin/bash

install_dir=/usr/local/packages6/apps/binapps/imagej/1.50g
mkdir -p $install_dir

#Download the 1.49 version
#This is later upgraded manually via the GUI
wget http://rsb.info.nih.gov/ij/download/zips/ij149.zip

#Install
unzip ij149.zip
mv ImageJ/* $install_dir/  
