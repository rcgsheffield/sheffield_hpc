
.. list-table:: Memory Allocation Limits Table
   :widths: 10 10 10 10 10 15
   :header-rows: 1

   * - Scheduler Type
     - Standard Nodes
     - Large RAM Nodes
     - Interactive Job |br| (Default / Max)
     - Batch Job |br| (Default / Max)
     - Submission Argument

   * - SGE (ShARC)
     - 64 GB
     - 256 GB
     - 2 GB / 64 GB
     - 2 GB / 64 GB (SMP) ~6144 GB (MPI)
     - **Per core basis** ``-l rmem=<nn>``

   * - SLURM (Bessemer)
     - 192 GB
     - N/A
     - 2 GB / 192 GB
     - 2 GB / 192 GB
     - **Per job basis** ``--mem=<nn>``
