.. _parallel_hybrid:

Hybrid SMP / MPI
================

Overview
--------

If you want to distribute work between a large number of cores (e.g. >16) on ShARC
then the most common approach is MPI,
as :ref:`described here <parallel_mpi>`.
The default MPI setup on ShARC does not ensure that your MPI job is assigned the same number of CPU cores per node.
However in certain cases you may want a symmetric distribution of of cores:
you may want eight MPI processes,
each of which internally parallelises work using four :ref:`OpenMP threads <parallel_smp>`,
which would run optimally if each process were assigned four cores on a node
(possibly running multiple processes on a node).

Usage on ShARC
----------------

Support for Hybrid SMP/MPI is in the preliminary stages.
Here is an example job submission for an executable that combines SMP (specifically OpenMP) with MPI: ::

  #$ -pe mpi-smp-16 64
  #$ -l rmem=2G
  module load mpi/openmpi/4.0.1/gcc-8.2
  export OMP_NUM_THREADS=16
  mpirun -bynode -np 4 -cpus-per-proc 16 [executable + options]

There would be 4 MPI processes running, each with 16x 2GB of real memory shared between the 16 threads per MPI process, for a total of 64 x 2GB of real memory for the entire job.
When we tried this, we got warnings saying that the `-cpus-per-proc` was getting deprecated.  A quick google suggests that ::

  mpirun -np 4 --map-by node:pe=1 [executable + options]

would be the appropriate replacement.

Here, ``-pe mpi-smp-16 64`` means 'request 64 *slots* (CPU cores) from the scheduler using the ``mpi-smp-16`` *Parallel Environment*'.
This Parallel Environment ensure that the slots are assigned to nodes in groups of 16.

More Parallel Environments for Hybrid SMP/MPI (e.g. for requesting slots in multiples of e.g. 4 or 8) can be added on request.

Note that the number of cores you request should be wholely divisible by the number in the name of the Parallel Environment you use.
