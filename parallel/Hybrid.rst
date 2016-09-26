.. _parallel_hybrid:

Hybrid OpenMP / MPI
===================

Support for Hybrid OpenMP/MPI is in the preliminary stages.
Here is an example job submission for an executable that combines OpenMP with MPI ::

  #$ -pe openmpi-hybrid-4 8
  #$ -l rmem=2G
  #$ -l mem=6G
  module load mpi/intel/openmpi
  export OMP_NUM_THREADS=4
  mpirun -bynode -np 2 -cpus-per-proc 4 [executable + options]

There would be 2 MPI processes running, each with 4x (6GB mem, 2GB rmem) shared between the 4 threads per MPI process, for a total of 8 x (6GB mem, 2GB rmem) for the entire job.
When we tried this, we got warnings saying that the `-cpus-per-proc` was getting deprecated.  A quick google suggests that ::

  mpirun -np 2 --map-by node:pe=1 [executable + options]

would be the appropriate replacement.
