#!/bin/bash
#$ -l mem=16G -l rmem=16G

module load apps/binapps/anacondapython/2.3

install_dir=/usr/local/packages6/apps/gcc/4.4.7/gemini/0.18
data_dir=/usr/local/packages6/apps/gcc/4.4.7/gemini/0.18

wget https://raw.github.com/arq5x/gemini/master/gemini/scripts/gemini_install.py
python gemini_install.py $install_dir $data_dir

export PATH=$PATH:/usr/local/packages6/apps/gcc/4.4.7/gemini/0.18/bin/

#Install extra data
$install_dir/bin/gemini update --dataonly --extra cadd_score
$install_dir/bin/gemini update --dataonly --extra gerp_bp
