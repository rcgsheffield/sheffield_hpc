
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
     - 251 GB
     - 1TB 
     - 2TB
     - 2 GB / 251 GB
     - 2 GB / 251 GB (SMP) ~74404 GB (MPI)
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

..
   The interactive job max RAM and batch job SMP values are both derived from a normal compute node's total RAM.

   The total MPI memory available above is derived from the total CPU nodes multiplied by the standard node RAM + Large RAM nodes * Large RAM amount and so on. 
   GPU nodes excluded as these should not be contiguously available.

   Values for Stanage are not their total available RAM on the node as a result of Alces configuration for SLURM differing / the node requiring reserved memory
   for the operating system.