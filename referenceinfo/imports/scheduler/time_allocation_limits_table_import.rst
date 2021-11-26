
.. list-table:: Time Allocation Limits Table
   :widths: 23 23 23 30
   :header-rows: 1

   * - Scheduler Type
     - Interactive Job |br| (Default / Max)
     - Batch Job |br| (Default / Max)
     - Submission Argument

   * - SGE (ShARC)
     - 8 / 8 hrs
     - 8 / 96 hrs
     - ``-l h_rt=<hh:mm:ss>``

   * - SLURM (Bessemer)
     - 8 / 8 hrs
     - 8 / 168 hrs
     - ``--time=<days-hh:mm:ss>``