.. _sacct:

sacct
======

``sacct`` is a scheduler command used to display accounting data for all jobs and job steps in 
the SLURM job accounting log or SLURM database.

Documentation
-------------

Documentation is available on the system using the command::

    man sacct

Usage
-----

The ``sacct`` command can be used to display status information about a user's historical 
jobs.

The command can be used as follows with the job's ID: ::

    sacct --jobs=job-id

Or to view information about all of a specific user's jobs: ::

    sacct --user=$USER

By default the ``sacct`` command will only bring up information about the user's job from the 
current day. By using the ``--starttime`` flag the command will look further back to the given 
date e.g. : ::

    sacct --user=$USER --starttime=YYYY-MM-DD

Like the ``sstat`` command, the ``--format`` flag can be used to choose the command output: ::

    sacct --user=$USER --format=var_1,var_2, ... ,var_N

.. list-table:: sstat format variable names
   :widths: 50 50
   :header-rows: 1

   * - Variable
     - Description
   * - Account
     - The account the job ran under.
   * - AveCPU
     - Average (system + user) CPU time of all tasks in job. 
   * - AveRSS
     - Average resident set size of all tasks in job. 
   * - AveVMSize
     - Average Virtual Memory size of all tasks in job.
   * - CPUTime
     - Formatted (Elapsed time * CPU) count used by a job or step.
   * - Elapsed
     - Jobs elapsed time formated as DD-HH:MM:SS.
   * - ExitCode
     - The exit code returned by the job script or salloc.
   * - JobID
     - The id of the Job.
   * - JobName
     - The name of the Job.
   * - MaxRSS
     - Maximum resident set size of all tasks in job.  
   * - MaxVMSize
     - Maximum Virtual Memory size of all tasks in job. 
   * - MaxDiskRead
     - Maximum number of bytes read by all tasks in the job.
   * - MaxDiskWrite
     - Maximum number of bytes written by all tasks in the job.
   * - ReqCPUS
     - Requested number of CPUs.
   * - ReqMem
     - Requested amount of memory.
   * - ReqNodes
     - Requested number of nodes.
   * - NCPUS
     - The number of CPUs used in a job.
   * - NNodes
     - The number of nodes used in a job.
   * - User
     - The username of the person who ran the job.


A full list of variables for the ``--format`` flag can be
found with the ``--helpformat`` flag or by `visiting the slurm page on
sacct <https://slurm.schedmd.com/sacct.html>`_.