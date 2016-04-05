.. _parallel_hybrid:

Hybrid OpenMP / MPI
===================

I'd expect memory requests to be per slot, so for my example with default memory requests (6GB mem, 2GB rmem)
#$ -pe openmpi-hybrid-4 8
module load mpi/intel/openmpi
export OMP_NUM_THREADS=4
mpirun -bynode -np 2 -cpus-per-proc 4 [executable + options]

there would be 2 MPI processes running, each with 4x (6GB mem, 2GB rmem) shared between the 4 theads per MPI process, for a total of 8 x (6GB mem, 2GB rmem) for the entire job.

I just did a couple of quick tests and it looked like it was working as expected.

I also got warnings saying that the -cpus-per-proc was getting deprecated.  A quick google suggests that:
mpirun -np 2 --map-by node:pe=1 [executable + options]
would be the appropriate replacement(?)  I haven't got my head around the new syntax yet..

