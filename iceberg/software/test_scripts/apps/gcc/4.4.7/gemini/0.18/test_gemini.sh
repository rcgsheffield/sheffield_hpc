#!/bin/bash
#$ -l mem=16G -l rmem=16G

#The test suite uses bedtools and samtools
module load apps/gcc/4.4.7/gemini/0.18
module load apps/gcc/5.2/samtools/1.2
module load apps/gcc/5.2/bedtools/2.25.0

#Run the gemini test suite
cd /usr/local/packages6/apps/gcc/4.4.7/gemini/0.18/github_gemini/
bash ./master-test.sh
