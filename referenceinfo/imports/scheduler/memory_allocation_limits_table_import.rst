
.. list-table:: Memory Allocation Limits Table
   :widths: 10 10 10 10 10 10 15
   :header-rows: 1

   * - Scheduler Type
     - Standard Nodes
     - Large RAM Nodes
     - Very Large RAM Nodes
     - Interactive Job |br| (Default / Max)
     - Batch Job |br| (Default / Max)
     - Submission Argument

   * - SLURM (Stanage)
     - 256 GB
     - 1TB 
     - 2TB
     - 2 GB / (256 GB/ 1TB / 2TB) 
     - 2 GB / (256 GB/ 1TB / 2TB) 
     - **Per job basis** ``--mem=<nn>``

   * - SLURM (Bessemer)
     - 192 GB
     - N/A
     - N/A
     - 2 GB / 192 GB
     - 2 GB / 192 GB
     - **Per job basis** ``--mem=<nn>``

   * - SGE (ShARC)
     - 64 GB
     - 256 GB
     - N/A
     - 2 GB / 64 GB
     - 2 GB / 64 GB (SMP) ~6144 GB (MPI)
     - **Per core basis** ``-l rmem=<nn>``
