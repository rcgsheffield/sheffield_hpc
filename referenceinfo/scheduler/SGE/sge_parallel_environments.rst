
ShARC/SGE Parallel Environments
-------------------------------

The available :ref:`SGE parallel environments <parallel>` (for ShARC only) can be found below:

.. list-table:: ShARC SGE Parallel Environments Table
   :widths: 20 80
   :header-rows: 1

   * - Parallel Environment Name ``<env>``
     - Parallel Environment description

   * - ``smp``
     - Symmetric multiprocessing or  :ref:`'Shared Memory Parallel' <parallel_SMP>` environment. Limited to a single node and therefore 16 cores on a normal ShARC node.

   * - ``openmp``
     - A :ref:`'Shared Memory Parallel' <parallel_SMP>` environment supporting `OpenMP <https://en.wikipedia.org/wiki/OpenMP>`_ execution. Limited to a single node and therefore 16 cores on a normal ShARC node.

   * - ``mpi``
     - :ref:`Message Passing interface <parallel_MPI>`. Can use as many nodes or cores as desired.

   * - ``mpi-rsh``
     - The same as the ``mpi`` parallel environment but configured to use RSH instead of SSH for certain software like ANSYS.

Other parallel environments not mentioned do exist for specific purposes. Those who require these will be informed directly or via signposting in other documentation.

A current list of environments on ShARC can be
generated using the ``qconf -spl`` command.
