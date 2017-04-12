Completed / aborted jobs
========================

It is often useful to look at the resource usage of jobs (with respect to e.g. execution time and memory usage) after the finish running:

- To see how the resource footprint scales with the problem size (e.g. to determine how much memory you'll need to run a big job after running several smaller 'test' jobs of a similar nature);
- To determine if/why a job failed.

Email notifications
-------------------

The simplest way to access information of completed/failed jobs is to request **email notifications** for job start/end/abortion when you first submit a job.  This is done by passing  ``-m`` and ``-M`` parameters to the scheduler. **XREF QSUB OPTS**.  You should then get an email like the following if a job exits successfully: ::

        Job 24732 (myjobname) Complete
        
        User             = cs1wf
        Queue            = parallel.q@node119.iceberg.shef.ac.uk
        Host             = node119.iceberg.shef.ac.uk
        Start Time       = 12/20/2016 18:02:51
        End Time         = 12/20/2016 18:03:42
        User Time        = 00:00:43
        System Time      = 00:00:01
        Wallclock Time   = 00:00:51
        CPU              = 00:00:45
        Max vmem         = 1.866G
        Exit Status      = 0

From this we can determine how long the job took to run and how much virtual memory (``vmem``) was used.

However email notifications are of limited use as they provide little information on resource usage, it is difficult to aggregate/compare multiple emails and emails may be accidentally deleted.

For more detailed information on historic jobs you need to use the ``qacct`` command to **query the scheduler's accounting file**.  

Querying the accounting file
----------------------------

To see information on a specific job: ::

        qacct -u myusername -j myjobid 

.. warning::

    Also, note that ``qacct`` may take about 3 minutes to run as it needs to parse a multi-gigabyte text file.

.. tip:: 
    
    ``qacct`` produces quite a bit of output so you may want to *pipe it to a pager* (append ``| less`` to the above command) to allow you to view output a screen at a time.

If you don't include ``-u myusername`` here then you may receive information on multiple jobs as old job IDs are eventually reused.

An example of the output from ``qacct`` for a specific job: ::

        $ qacct -u $USER -j 637275

        qname        openmp-int.q
        hostname     node050.iceberg.shef.ac.uk
        group        cs
        owner        cs1wf
        project      SHEFFIELD
        department   defaultdepartment
        jobname      gromacs_2016_1_serial
        jobnumber    637275
        taskid       undefined
        account      sge
        priority     0
        qsub_time    Thu Dec  8 12:29:28 2016
        start_time   Thu Dec  8 12:39:36 2016
        end_time     Thu Dec  8 12:46:33 2016
        granted_pe   openmp
        slots        4
        failed       0
        exit_status  0
        ru_wallclock 417s
        ru_utime     924.879s
        ru_stime     103.791s
        ru_maxrss    338.559KB
        ru_ixrss     0.000B
        ru_ismrss    0.000B
        ru_idrss     0.000B
        ru_isrss     0.000B
        ru_minflt    31430306
        ru_majflt    192
        ru_nswap     0
        ru_inblock   121248
        ru_oublock   1330312
        ru_msgsnd    0
        ru_msgrcv    0
        ru_nsignals  0
        ru_nvcsw     312473
        ru_nivcsw    221718
        cpu          1028.671s
        mem          47.804GBs
        io           14.598GB
        iow          0.000s
        maxvmem      810.199MB
        arid         undefined
        category     -u cs1wf -l arch=intel*,h_rt=2100 -pe openmp 4 -P SHEFFIELD

Things of note:

- ``hostname`` show you the main node that the job was started on (but not additional nodes that were used if it were an MPI job);
- ``jobname`` and ``jobnumber``: the name specified with ``-N`` at submission time and the job ID respectively;
- ``taskid``: here undefined as this job was not a task array;
- ``qsub_time``, ``start_time`` and ``end_time``: provide information on how long the job was queueing for and how long it then ran for.
- ``granted_pe`` and ``slots``: which parallel environment was used (here ``openmp``) and how many cores were allocated to the job.
- ``failed``: typically non-zero if the scheduler decided that there was an issue with this job.
- ``exit_status``: the `exit code <https://en.wikipedia.org/wiki/Exit_status>`_ returned by the job.  A non-zero code tells you that the job did not complete successfully and the value of this code may tell you why.  Different programs use different codes to indicate particular abnormal conditions.
- ``ru_maxrss``: the name indicates that it is the maximum amount of real memory used by the process, but this figure typically looks incorrect.
- ``cpu``: total time spent running.  
- ``mem``: the integrated total memory usage (in gigabyte seconds)
- ``maxvmem``: the maximum virtual memory usage.  
- ``category``: the resources that were *requested* by the user (here, an Intel (not AMD) processor, a maximum run-time of 45 minutes (2100 seconds) and four cores in an OpenMP parallel environment)

``cpu`` and ``maxvmem`` are obviously both useful for refining resource estimates for future job submissions.

To see information on *all* the jobs you have submitted: ::

        qacct -u myusername -j '*'

Or all jobs with a specific name (specified with ``-N`` at submission time): ::

        qacct -u myusername -j myjobname

Or all jobs that have requested specific resources e.g. one or more GPUs: ::

        qacct -u myusername -j '*' -l gpu=1

.. tip:: 

   To filter the results from qacct to just focus on certain things you can use the ``egrep`` command.  
   
   For example, to find all OpenMP jobs where you requested 6GB of virtual memory per core then 
   limit output to just ``start_time``, ``cpu`` and ``maxvmem`` you can do: ::

           qacct -u myusername -j '*' -pe openmp -l h_vmem=6G | egrep '(start_time|cpu|maxvmem)'

If wanting information about **MPI** jobs note that data is logged on a per-node rather than per-core basis.
