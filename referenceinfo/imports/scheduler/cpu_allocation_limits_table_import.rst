
.. list-table:: CPU Allocation Limits Table
   :widths: 23 23 23 30
   :header-rows: 1

   * - Scheduler Type
     - No. CPU Cores Available |br| |br| Interactive Job |br| (Default/ Min / Max )
     - No. CPU Cores Available |br| |br| Batch Job |br| (Default/ Min / Max )
     - Submission Argument

   * - SGE (ShARC)
     - 1 / 1 / ~1536 (MPI), 16 (SMP)
     - 1 / 1 / ~1536 (MPI), 16 (SMP)
     - ``-pe <env> <nn>``

   * - SLURM (Bessemer)
     - 1 / 1 / 40
     - 1 / 1 / 40
     - ``-c <nn>``