.. _parallel_SMP:

Shared Memory Parallelism (SMP)
===============================

Shared Memory Parallelism (SMP) is when multiple processors can operate independently but they have access to the same memory space.
On our systems, programs that use SMP can make use of only the resources available on a **single node**.
This limits you to 16 processor cores on our current system.

If you wish to scale to more processors, you should consider more complex parallelisation schemes such as MPI or Hybrid OpenMP/MPI.

OpenMP
------
`OpenMP <http://openmp.org/wp/>`_ (Open Multi-Processing) is one of the most common programming frameworks used to implement shared memory parallelism.
To submit an OpenMP job to our system, we make use of the `OpenMP parallel environment` which is specified by adding the line ::

    `#$ -pe openmp N`

to your job submission script, changing the value N to the number of cores you wish to use. Here's an example for 4 cores ::

  #!/bin/bash
  # Request 4 cores from the scheduler
  #$ -pe openmp 4
  #$ Request 4 Gb of memory per CPU core
  #$ -l rmem=4G
  #$ -l mem=4G

  # Tell the OpenMP executable to use 4 cores
  export OMP_NUM_THREADS=4
  ./myprogram

Note that you have to specify the number of cores twice. Once to the scheduler (`#$ -pe openmp 4`) and once to the OpenMP runtime environment `export OMP_NUM_THREADS=4`

Running other SMP schemes
-------------------------
Any system that uses shared memory parallelism, such as `pthreads <https://en.wikipedia.org/wiki/POSIX_Threads>`_, Python's `multiprocessing <https://docs.python.org/3/library/multiprocessing.html>`_ module, R's `mcapply <https://rforge.net/doc/packages/multicore/mclapply.html>`_ and so on can be submitted using the OpenMP parallel environment.
