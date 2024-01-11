
.. list-table:: CPU Allocation Limits Table
   :widths: 23 23 23 30
   :header-rows: 1

   * - Scheduler Type
     - No. CPU Cores Available |br| |br| Interactive Job |br| (Default/ Min / Max )
     - No. CPU Cores Available |br| |br| Batch Job |br| (Default/ Min / Max )
     - Submission Argument 

   * - SLURM (Stanage)
     - 1 / 1 /  ~11264  (MPI), 64 (SMP)
     - 1 / 1 /  ~11264  (MPI), 64 (SMP)
     - ``-c <nn>``     

   * - SLURM (Bessemer)
     - 1 / 1 / 40
     - 1 / 1 / 40
     - ``-c <nn>``
