.. _sstat:

sstat
======

``sstat`` is a scheduler command used to display various status information about a running job/step. 

Documentation
-------------

Documentation is available on the system using the command::

    man sstat

Usage
-----

The ``sstat`` command can be used to display status information about a user's currently running 
jobs such as the CPU usage, task or node information and memory consumption.

The command can be invoked as follows with a specific job ID: ::

    sstat --jobs=job-id

And to display specific information you can use the ``--format`` flag to choose your output: ::

    sstat --jobs=job-id --format=var_1,var_2, ... , var_N

A chart of some these variables are listed in the table below:

.. list-table:: sstat format variable names
   :widths: 50 50
   :header-rows: 1

   * - Variable
     - Description
   * - AveCPU
     - Average (system + user) CPU time of all tasks in job. 
   * - AveRSS
     - Average resident set size of all tasks in job. 
   * - AveVMSize
     - Average Virtual Memory size of all tasks in job. 
   * - JobID
     - The id of the Job.
   * - MaxRSS
     - Maximum resident set size of all tasks in job.  
   * - MaxVMSize
     - Maximum Virtual Memory size of all tasks in job. 
   * - NTasks
     - Total number of tasks in a job or step. 

A full list of variables for the ``--format`` flag can be
found with the ``--helpformat`` flag or by `visiting the slurm page on
sstat <https://slurm.schedmd.com/sstat.html>`_.
