#!/bin/bash

# Do not edit this section
#
#$ -pe openmpi-ib XXXmpinodesXXX
#$ -e XXXerrfileXXX
#$ -o XXXoutfileXXX
#$ -cwd

# Remove the first '#' from the start of the following two lines if you want to
# use:
#
#  - 1 gpu for a single-core (serial) job or
#  - 1 gpu per MPI worker
#
##$ -l gpu=1
##$ -l gpu_arch=nvidia-k*

# Remove the first '#' from the start of the following two lines and update the
# email address if you want to receive emails when jobs start, finish and/or
# abort:
#
##$ -m bea
##$ -M USERNAME@sheffield.ac.uk

# Remove the first '#' from the following line and replace the numbers if you
# want to request specific amounts of virtual ('mem') and real ('rmem') memory
#
##$ -l mem=6G,rmem=6G

mpiexec -mca orte_forward_job_control 1 -n XXXmpinodesXXX  XXXcommandXXX
