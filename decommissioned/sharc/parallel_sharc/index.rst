.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _parallel_sharc:

=========================
Parallel Computing ShARC
=========================

.. toctree::
   :maxdepth: 1
   :hidden:

   JobArray
   SMP
   MPI
   Hybrid

Parallel Computing uses more than one core.
A *core* (also called *processor*) is capable of executing one
thread of computation.

Modern computers contain more than one core;
a typical laptop usually contains either 2 or 4.
`Hyper-threading <https://en.wikipedia.org/wiki/Hyper-threading>`_
is a way of executing 2 (typically) threads on one core,
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
The :ref:`public nodes on ShARC have 2 CPUs and each CPU has 8 cores <sharc-cpu-specs>`;
and so a (public) node has 16 cores.
Computations running on cores on the same node can share memory.

Code that runs on multiple cores may require that the cores are
all on the same node or may not;
additionally it may require that the code runs simultaneously on
multiple cores, or not.
This gives rise to a number of ways to use multiple cores:

- all cores on same node: this is called :ref:`Shared Memory Parallelism <parallel_SMP_sharc>`;
- cores across many different nodes: :ref:`Message Passing Interface <parallel_MPI_sharc>`;
- a factorised combination of ``k`` cores per ``n`` nodes: :ref:`Hybrid SMP / MPI <parallel_hybrid_sharc>`;
- don't care which nodes, can run at different times: :ref:`Array Job <parallel_jobarray_sharc>`.

If you are using a standardised piece of software designed to
run on HPC, for example :ref:`CASTEP <castep_sharc>` or
:ref:`GROMACS <gromacs_sharc>`, it may well come
with its own opinions about the best parallel setup to use.
Consult the :ref:`software documentation <sharc-apps>`.

.. include:: /referenceinfo/scheduler/SGE/sge_parallel_environments.rst

-------------

Getting help
------------

If you need advice on how to parallelise your workflow,
please :ref:`contact IT Services or the Research Software Engineering team <need_help>`.
