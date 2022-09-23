The ``squeue`` command is used to pull up information about jobs in the queue, by default this 
command will list the job ID, partition, username, job status, number of nodes, and name of nodes 
for all jobs queued or running within SLURM.

Display all jobs queued on the system:

.. code-block:: console

  $ squeue

To limit this command to only display a single user's jobs the ``--user`` flag can be used: 

.. code-block:: console

  $ squeue --user=$USER

Further information without abbreviation can be shown by using the ``--long`` flag: 

.. code-block:: console

  $ squeue --user=$USER --long

The ``squeue`` command also provides a method to calculate the estimated start time for a job by 
using the ``--start`` flag: 

.. code-block:: console

  $ squeue --user=$USER --start

When checking the status of a job you may wish to check for updates at a time interval. This can 
be achieved by using the ``--iterate`` flag and a number of seconds: 

.. code-block:: console

  $ squeue --user=$USER --start --iterate=n_seconds

You can stop this command by pressing ``Ctrl + C``.

**Example output:**

.. include:: /referenceinfo/imports/scheduler/SLURM/squeue_example_output_import.rst

States shown above indicate job states including running **"R"** and Pending **"PD"** with various 
reasons for pending states including a node (**ReqNodeNotAvail**) full of jobs and a user hitting 
the max limit for numbers of jobs they can run simultaneously in a QOS (**QOSMaxJobsPerUserLimit**).

A list of the most relevant job states and reasons can be seen below:

**SLURM Job States:**

Jobs typically pass through several states in the course of their execution. The typical 
states are PENDING, RUNNING, SUSPENDED, COMPLETING, and COMPLETED.

.. include:: /referenceinfo/imports/scheduler/SLURM/SLURM_job_state_codes_import.rst

A full list of job states can be found at: 
https://slurm.schedmd.com/squeue.html#SECTION_JOB-STATE-CODES

**SLURM Job Reasons:**

These codes identify the reason that a job is waiting for execution. A job may 
be waiting for more than one reason, in which case only one of those reasons is displayed. 

.. include:: /referenceinfo/imports/scheduler/SLURM/SLURM_job_reasons.rst

A full list of job reasons can be found at: 
https://slurm.schedmd.com/squeue.html#SECTION_JOB-REASON-CODES