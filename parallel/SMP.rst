.. _parallel_SMP:

Shared Memory Parallelism (SMP)
===============================

Shared-Memory Parallelism (SMP) is when work is divided between multiple `threads <https://en.wikipedia.org/wiki/Thread_(computing)>`_ or `processes <https://en.wikipedia.org/wiki/Process_(computing)>`_ running on a single machine and these threads have access to common (shared) memory.

SMP is most performant when each thread / process has its own CPU core, which limits you to 16 processor cores on ShARC's public nodes.
If you wish to scale to more parallel strands of execution or want more memory per strand than SMP can facilitate, 
you should consider more complex parallelisation schemes such as :ref:`MPI <parallel_MPI>` or :ref:`Hybrid OpenMP/MPI <parallel_hybrid>`.

OpenMP
------
`OpenMP <http://openmp.org/wp/>`_ (Open Multi-Processing) is one of the most common programming frameworks used to implement shared-memory parallelism.
It greatly simplifies the tasks of distributing work and coordination in a multi-threaded C, C++ or Fortran program.
Many research applications make use of the OpenMP library: 
you can often enable OpenMP support at compile-time and/or run-time using compiler flags, command-line options and/or configuration files.

Batch OpenMP jobs
-----------------

To submit a SMP job to our system, we we need to request a particular **Parallel Environment** in our :ref:`batch job submission scripts <submit_batch_sharc>`.
On ShARC your script needs to include a line like: ::

   #$ -pe smp N

Change ``N`` to the number of processor cores you wish to use. 

Here's an example that requests 4 cores and 4 threads on ShARC: ::

   #!/bin/bash
   # Request 4 cores from ShARC's scheduler
   #$ -pe smp 4
   #$ Request 4 GB of memory per CPU core
   #$ -l rmem=4G
 
   # Tell programs that use the OpenMP library to use 4 threads
   export OMP_NUM_THREADS=$NSLOTS
   ./myprogram

Note that you have to specify the number of cores at least **twice** when running OpenMP jobs:

* Once to the scheduler (``#$ -pe smp 4``) so that it knows how many cores to assign to your job;
* Once to the OpenMP runtime environment (``export OMP_NUM_THREADS=$NSLOTS``) so that OpenMP knows how many threads to create.
* You may also need to expliclty need to tell your application how many threads it should create.

Running other SMP schemes
-------------------------
Any system that uses shared memory parallelism, such as `pthreads <https://en.wikipedia.org/wiki/POSIX_Threads>`_, Python's `multiprocessing <https://docs.python.org/3/library/multiprocessing.html>`_ module, R's `mcapply <https://rforge.net/doc/packages/multicore/mclapply.html>`_ and so on can be submitted using the ``smp`` (ShARC) Parallel Environments.  Many of these also check the ``OMP_NUM_THREADS`` environment variable to determine how many threads to create.

Interactive SMP jobs
--------------------

You can start an interactive SMP job on ShARC like so: ::

        qrsh -pe smp 4 -l rmem=3G

.. note:: 
    It may be difficult to start an interactive SMP session if the cluster(s) are busy. 
