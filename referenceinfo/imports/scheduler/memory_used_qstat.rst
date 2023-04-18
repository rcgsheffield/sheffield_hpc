.. group-tab:: Stanage
        
        You can detect the memory used by your job while it is running by using the **sacct** command for SLURM as follows:

        While a job is still running find out its job id by: ::

            sacct

        And check its current usage of memory by: ::

            sstat job_id --format='JobID,MaxVMSize,MaxRSS'

        If your job has already finished you can list the memory usage with sacct: ::

            sacct --format='JobID,Elapsed,MaxVMSize,MaxRSS'

        It is the **MaxVMSize** / **MaxRSS** figures that you will need to use to determine the ``--mem=`` parameter for your next job.

.. group-tab:: Bessemer
        
        You can detect the memory used by your job while it is running by using the **sacct** command for SLURM as follows:

        While a job is still running find out its job id by: ::

            sacct

        And check its current usage of memory by: ::

            sstat job_id --format='JobID,MaxVMSize,MaxRSS'

        If your job has already finished you can list the memory usage with sacct: ::

            sacct --format='JobID,Elapsed,MaxVMSize,MaxRSS'

        It is the **MaxVMSize** / **MaxRSS** figures that you will need to use to determine the ``--mem=`` parameter for your next job.

.. group-tab:: ShARC

        You can detect the memory used by your job while it is running by using the **qstat** command for SGE as follows:
        
        While a job is still running find out its job id by: ::

            qstat

        And check its current usage of memory by: ::

            qstat -F -j job_id | grep mem

        If your job has already finished you can list the memory usage with **qacct**: ::

            qacct -j job_id

        The reported figures will indicate:

        * the currently used memory ( vmem ).
        * maximum memory needed since startup ( maxvmem ).

        It is the **maxvmem** figure that you will need to use to determine the ``-l rmem=`` parameter for your next job.