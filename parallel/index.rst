.. _parallel:



==================
Parallel Computing
==================

.. toctree::
   :maxdepth: 1
   :hidden:

   JobArray
   SMP
   MPI
   Hybrid
   GPUComputing

Parallel Computing uses more than one core.
A *core* (also called *processor*) is capable of executing one
thread of computation.

Modern computers contain more than one core;
a typical laptop usually contains either 2 or 4.
`Hyper-threading <https://en.wikipedia.org/wiki/Hyper-threading>`_
is a way of excuting 2 (typically) threads on one core,
it is enabled on most laptop-class cores,
but is disabled on most HPC clusters.
Hyper-threading is disabled on most nodes on ShARC.

Computer clusters such as ShARC contain many hundreds of cores and
the key to making your research code faster is to distribute your work across them.
If your program is designed to run on only one core,
running it on an HPC cluster without modification will not make it any faster (it may even be slower!).
Learning how to use parallelisation technologies is vital.

This section explains how to use the most common parallelisation technologies on our systems.

A CPU contains 1 or more cores.
A *node* is what most people think of as "a computer".
The `public nodes on ShARC have 2 CPUs and each CPU has 8 cores <../sharc/cluster_specs.html#general-cpu-node-specifications>`_;
and so a (public) node has 16 cores.
Computations running on cores on the same node can share memory.

Code that runs on multiple cores may require that the cores are
all on the same node or may not;
additionally it may require that the code runs simultaneously on
multiple cores, or not.
This gives rise to a number of ways to use multiple cores:

- all cores on same node: this is called `Shared Memory Parallelism <SMP.html>`_;
- cores across many different nodes: `Message Passing Interface <MPI.html>`_;
- a factorised combination of ``k`` cores per ``n`` nodes: `Hybrid SMP / MPI <Hybrid.html>`_;
- don't care which nodes, can run at different times: `Array Job <JobArray.html>`_.

If you are using a standardised piece of software designed to
run on HPC, for example `CASTEP </sharc/software/apps/CASTEP.html>`_ or
`GROMACS </sharc/software/apps/gromacs.html>`_, it may well come
with its own opinions about the best parallel setup to use.
Consult the `software documentation </sharc/software/>`_.

.. include:: ../referenceinfo/scheduler/SGE/sge_parallel_environments.rst

-------------

Getting help
------------

If you need advice on how to parallelise your workflow,
please :ref:`contact IT Services or the Research Software Engineering team <need_help>`.
