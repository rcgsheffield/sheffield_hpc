.. _advanced_job_submission_control:

Advanced Job Submission and Control
===================================

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:
    
.. contents::
    :depth: 3


.. tip::

    If you are not familiar with basic job submission and control you should first read our :ref:`job_submission_control` page.


Introduction
------------

This page details more advanced job submission and control methods that can be used 
with the :ref:`SGE scheduler <sge_info>` on ShARC 
and the more modern :ref:`SLURM scheduler <slurm_info>` on Bessemer and Stanage.


.. raw:: html

    <hr class="hr-mid-section-separator">

Advanced Job Submission Methods
-------------------------------

In this section, the concept of each advanced submission method will be described with 
subsequent explanations of how to implement these on each scheduler.

-----

.. _array_jobs:

Job or task arrays
^^^^^^^^^^^^^^^^^^^

An "array job" is a set of tasks run from a single batch job submission script. Each of these tasks should consume a relatively large amount of 
compute time to maintain optimum efficiency.  If each task is short (seconds or even a few minutes),  array jobs will saturate the scheduler 
and more time is spent managing jobs than running your jobs. This will also negatively impacts other users!

**Advantages of array jobs:**

* You only need to submit one job to run a series of very similar tasks;
* These tasks are independent and do not all need to run at once so
  the job scheduler can efficiently run one or more queued tasks as the requested computational resources become available;
* They are particularly useful for `Embarrassingly Parallel <https://en.wikipedia.org/wiki/Embarrassingly_parallel>`_ problems such as:

  * Monte Carlo simulations;
  * Parameter sensitivity analysis;
  * Batch file processing.

**Disadvantages of array jobs:**

* If a single task fails to run correctly it can be a pain to determine and re-submit failed tasks.
* If the tasks are small, the scheduler will spend more time managing and queueing your tasks than computing them.

.. _array_jobs_sharc:

Task arrays on ShARC
""""""""""""""""""""

.. warning::

  Array jobs on ShARC can have a maximum of 75000 tasks.

Task arrays on ShARC can be defined using the ``#$ -t`` SGE argument in batch submission files as follows: 

.. code-block:: shell

  #!/bin/bash
  #
  #$ -t 1-100
  #
  echo "Task id is $SGE_TASK_ID"

  ./myprog.exe $SGE_TASK_ID > output.$SGE_TASK_ID

The above script will submit 100 tasks to the job queues at once.
The difference between each of these 100 jobs is the value of the environment variable ``$SGE_TASK_ID``
which will range from 1 to 100,
determined by the line ``#$ -t 1-100``.
In this example, the program ``myprog.exe`` will be run 100 times
with differing input values of ``$SGE_TASK_ID``.
100 output files will be created with filenames ``output.1``, ``output.2`` and so on.

**Using email notifications**

If you :ref:`enable email notifications <submit_batch_sharc>` in your batch job submission script then
you will receive emails for *every* task in your array job.
This helps you determine if any tasks in the array job failed but
doesn't help you determine if the entire array job has finished running.
Here's a sensible approach to managing email notifications:

1. Edit your array job submission script so you are *only* notified of aborted (``a``) tasks i.e. 
   
.. code-block:: console

        #$ -M me@sheffield.ac.uk
        #$ -m a

2. Then submit your array job like so: 

.. code-block:: console

        [te1st@sharc-login1 ~]$ qsub my_array_job.sge
        Your job-array 2035587.1-3:1 ("my_array_job.sge") has been submitted

3. Next, submit a very simple job that will only run when array job ``2035587`` has completed and emails you when it finishes:

.. code-block:: console

        [te1st@sharc-login1 ~]$ qsub -o /dev/null -e /dev/null -M me@sheffield.ac.uk -m ea -b y -l h_rt=00:00:15 -hold_jid 2035587 -N 'Array_Job_finished' true
        Your job 2035588 ("Job_array_finished") has been submitted

You will therefore receive:

* An email for every failed task in the array job;
* An email shortly after the entire array job finishes.

**Managing output and error files**

By default, when you run a Job Array
a separate output and error file will be written *per task*
to the directory the Job Array was submitted from.
This may not be convenient:
you may not want to be generating tens, hundreds or thousands of log files
in your project's directories on ShARC.

A more sensible approach could be to
tell the scheduler to write output and error log files per task to
a folder in your home directory called ``logs``,
also ensuring that the names of these files contain the job name: 

.. code-block:: shell

    #!/bin/bash
    #
    #$ -N MyProjectX
    #$ -t 1-100
    #$ -o /home/$USER/logs
    #$ -e /home/$USER/logs
    #
    echo "Task id is $SGE_TASK_ID"

    ./myprog $SGE_TASK_ID

This will generate output files of the form: 

.. code-block:: shell

    MyProjectX.o$JOB_ID.$SGE_TASK_ID

Error files of the form:

.. code-block:: shell

    MyProjectX.e$JOB_ID.$SGE_TASK_ID

Where ``$SGE_TASK_ID`` is the task ID and ``$JOB_ID`` is the ID of the entire array job.

**Grouping tasks for efficiency**

If you know that each of your workflow's tasks takes only a few seconds to run then
making each of these a separate task in your Job Array may not be particularly efficient as
it takes a few seconds to schedule each job.

A better approach may be to batch up tasks into groups that you know will run for a few minutes each.
This can be achieved by specifying a **step size** for the range of task IDs and then
doing multiple things per task.

In the example below, the submitted array job that consists of ten tasks
which have ``SGE_TASK_ID`` values of 1, 11, 21...91 (and therefore a step size of 10).
This step size only needs to be specified once;
later on in the script it can be determined using the ``$SGE_TASK_STEPSIZE`` variable.
In the example, ``myprog`` is run ten times per task:

.. code-block:: shell

    #!/bin/bash
    #
    #$ -N MyProjectX
    #$ -t 1-100:10
    #$ -o /home/$USER/logs/
    #$ -e /home/$USER/logs/

    echo "Starting task $SGE_TASK_ID"
    for subtask_id in $(seq $SGE_TASK_ID $(( $SGE_TASK_ID + $SGE_TASK_STEPSIZE - 1 )) ); do
        echo "Subtask $subtask_id of task $SGE_TASK_ID"
        ./myprog $subtask_id
    done

**Limiting number of concurrent tasks**

You can use the flag ``-tc 5`` to specify the maximum number of concurrent tasks (five tasks in 
this example). As per the ``-t`` flag, it can either be included on the command line: ::

  #Running 100 jobs with maximum of 5 running concurrently
  qsub -t 1-100 -tc 5 my_array_job.sh

Or in the batch file itself: 

.. code-block:: shell

  #$ -t 1-100
  #$ -tc 5

.. _array_jobs_bessemer:

.. _array_jobs_stanage:

Task arrays on Bessemer and Stanage
"""""""""""""""""""""""""""""""""""

.. warning::

  Array jobs on Bessemer and Stanage can have a maximum of 1000 tasks.

SLURM job arrays are only supported for batch jobs and the array index values are specified using 
the ``--array`` or ``-a`` option of the sbatch command as follows: 

.. code-block:: console

  # Submit a job array with index values between 0 and 31
  $ sbatch --array=0-31

  # Submit a job array with index values of 1, 3, 5 and 7
  $ sbatch --array=1,3,5,7

  # Submit a job array with index values between 1 and 7
  # with a step size of 2 (i.e. 1, 3, 5 and 7)
  $ sbatch --array=1-7:2

Job arrays will have two additional environment variable set. ``SLURM_ARRAY_JOB_ID`` 
will be set to the first job ID of the array. ``SLURM_ARRAY_TASK_ID`` will be set to the job array 
index value. ``SLURM_ARRAY_TASK_COUNT`` will be set to the number of tasks in the job array. 
``SLURM_ARRAY_TASK_MAX`` will be set to the highest job array index value. 
``SLURM_ARRAY_TASK_MIN`` will be set to the lowest job array index value. 

For example a job submission of this sort:

.. code-block:: console

  $ sbatch --array=1-3
  Submitted batch job 39319

Will generate a job array containing three jobs with the environment variables set as follows:

.. code-block:: shell

  SLURM_JOB_ID=39319
  SLURM_ARRAY_JOB_ID=39319
  SLURM_ARRAY_TASK_ID=3
  SLURM_ARRAY_TASK_COUNT=3
  SLURM_ARRAY_TASK_MAX=3
  SLURM_ARRAY_TASK_MIN=1

  SLURM_JOB_ID=39320
  SLURM_ARRAY_JOB_ID=39319
  SLURM_ARRAY_TASK_ID=1
  SLURM_ARRAY_TASK_COUNT=3
  SLURM_ARRAY_TASK_MAX=3
  SLURM_ARRAY_TASK_MIN=1

  SLURM_JOB_ID=39321
  SLURM_ARRAY_JOB_ID=39319
  SLURM_ARRAY_TASK_ID=2
  SLURM_ARRAY_TASK_COUNT=3
  SLURM_ARRAY_TASK_MAX=3
  SLURM_ARRAY_TASK_MIN=1

All SLURM commands and APIs recognize the ``SLURM_JOB_ID`` value. Most commands also recognize the ``SLURM_ARRAY_JOB_ID`` 
plus ``SLURM_ARRAY_TASK_ID`` values separated by an underscore as identifying an element of a job array. Using the 
example above, "39320" or "39319_1" would be equivalent ways to identify the second array element of job 39319 as 
shown in the following ``sacct`` command example. 

.. code-block:: console
  :emphasize-lines: 1,7
   
   $ sacct -j 39319_1
   JobID           JobName  Partition    Account  AllocCPUS      State ExitCode
   ------------ ---------- ---------- ---------- ---------- ---------- --------
   39319_1      array.sh  sheffield       free          1  COMPLETED      0:0
   39319_1.b+      array                  free          1  COMPLETED      0:0
   
   $ sacct -j 39320
   JobID           JobName  Partition    Account  AllocCPUS      State ExitCode
   ------------ ---------- ---------- ---------- ---------- ---------- --------
   39319_1      array.sh  sheffield       free          1  COMPLETED      0:0
   39319_1.b+      array                  free          1  COMPLETED      0:0

Note that the parent job runs the final task. In the following ``sacct`` command example using
``SLURM_ARRAY_JOB_ID`` (39319 i.e spawning job) will retrieve details of the whole task array:   

.. code-block:: console
  :emphasize-lines: 1
   
   $ sacct -j 39319
   JobID           JobName  Partition    Account  AllocCPUS      State ExitCode
   ------------ ---------- ---------- ---------- ---------- ---------- --------
   39319_1      array.sh  sheffield       free          1  COMPLETED      0:0
   39319_1.b+      array                  free          1  COMPLETED      0:0
   39319_2      array.sh  sheffield       free          1  COMPLETED      0:0
   39319_2.b+      array                  free          1  COMPLETED      0:0
   39319_3      array.sh  sheffield       free          1  COMPLETED      0:0
   39319_3.b+      array                  free          1  COMPLETED      0:0

The same output could have been achieved with ``sacct -j 39319_3`` .

**Using email notifications**

By default in SLURM, the emails for events **BEGIN**, **END** and **FAIL** apply to the job array as a whole rather 
than individual tasks. So:

.. code-block:: shell

  #SBATCH --mail-type=BEGIN,END,FAIL

Would result in one email per job, not per task. If you want per task emails, specify:

.. code-block:: shell

 #SBATCH --mail-type=BEGIN,END,FAIL,ARRAY_TASKS

Which will send emails for each task in the array. 

**Managing output and error files**

SLURM uses the ``%A`` and ``%a`` replacement strings for the master job ID and task ID, respectively.

For example:

.. code-block:: shell

  #SBATCH --output=Array_test.%A_%a.out
  #SBATCH --error=Array_test.%A_%a.error

The error log is optional as both types of logs can be written to the 'output' log.

.. code-block:: shell

  #SBATCH --output=Array_test.%A_%a.log

.. warning::

    If you only use ``%A`` in the log all array tasks will try to write to a single file. 
    The performance of the run will approach zero asymptotically. Make sure to use both ``%A`` and ``%a`` in the log file name specification.

**Grouping tasks for efficiency**

**Limiting number of concurrent tasks**

A maximum number of simultaneously running tasks from the job array may be specified using a ``%`` separator. 
For example ``--array=0-15%4`` will limit the number of simultaneously running tasks from this job array to 4.

-----

Dependent jobs
^^^^^^^^^^^^^^

Dependent jobs, or jobs submitted with dependencies on other jobs will wait until 
the job they are dependent on has met with a certain conditon. This can allow you 
to build workflows with pre-processing or post-processing steps.

.. _dependent_jobs_sharc:

Dependent jobs on ShARC
"""""""""""""""""""""""

Job dependencies with the SGE scheduler on ShARC can be 
specified with the ``-hold_jid`` (job hold) and ``-N`` (name) options to ``qsub`` in the format:

.. code-block:: shell

  qsub -N job1 job1.sh
  qsub -hold_jid job1 job2.sh

Where the first job is submitted with a name of "job1" and the second job is held back by a job called "job1".

A single job can be held back by multiple other named jobs using comma separation as below:

.. code-block:: shell

  qsub -hold_jid job1,job2,job3 job4.sh

Or by making use of SGE pattern matching:

.. code-block:: shell

  qsub -hold_jid job* job4.sh

It is also possible to use job IDs instead of names:

.. code-block:: shell

  job_ids=$(qsub -terse job1.sh)
  job_ids=job_ids,$(qsub -terse job2.sh)
  job_ids=job_ids,$(qsub -terse job3.sh)
  qsub -hold_jid ${job_ids} job4.sh

Where ``-terse`` ensures that ``qsub`` only outputs the job ID to correctly populate the ``job_ids`` variable and fourth job
is held back by the previous three.

.. _dependent_jobs_bessemer:

.. _dependent_jobs_stanage:

Dependent jobs on Bessemer and Stanage
""""""""""""""""""""""""""""""""""""""

Job dependencies with the SLURM scheduler on Bessemer and Stanage are 
specified with the ``--dependency`` option to ``sbatch`` using job IDs only in the format:

.. code-block:: console

  $ sbatch --dependency=<type:job_id[:job_id][,type:job_id[:job_id]]> ...

The different dependency types available are:

.. code-block:: shell

  after:jobid[:jobid...] 	#job can begin after the specified jobs have started
  afterany:jobid[:jobid...] 	#job can begin after the specified jobs have terminated
  afternotok:jobid[:jobid...] 	#job can begin after the specified jobs have failed
  afterok:jobid[:jobid...] 	#job can begin after the specified jobs have run to completion with an exit code of zero (see the user guide for caveats).
  singleton 	                #jobs can begin execution after all previously launched jobs with the same name and user have ended. This is useful to collate results of a swarm or to send a notification at the end of a swarm.

The most simple way to use dependencies are to use the **afterany** type for single consecutive jobs e.g. :

.. code-block:: console

  $ sbatch job1.sh
  12345678
  $ sbatch --dependency=afterany:12345678 job2.sh

In this case when job 1 finishes (terminates), job 2 will become eligible for scheduling. This means even if 
job 1 fails, job 2 will run.

A further example with more complicated conditions is shown below:

.. code-block:: shell

  #! /bin/bash

  # first job - no dependencies
  jid1=$(sbatch  --mem=12g --cpus-per-task=4 job1.sh)
  #Trim the output from Submitted batch job 123456 to just 123456 for jid variable.
  jid1=$(echo $jid1 | tr -dc '0-9')

  # multiple jobs can depend on a single job
  jid2=$(sbatch  --dependency=afterany:$jid1 --mem=20g job2.sh)
  jid2=$(echo $jid2 | tr -dc '0-9')
  jid3=$(sbatch  --dependency=afterany:$jid1 --mem=20g job3.sh)
  jid3=$(echo $jid3 | tr -dc '0-9')

  # a single job can depend on multiple jobs
  jid4=$(sbatch  --dependency=afterany:$jid2:$jid3 job4.sh)
  jid4=$(echo $jid4 | tr -dc '0-9')

  # a single job can depend on all jobs by the same user with the same name
  jid5=$(sbatch --dependency=afterany:$jid4 --job-name=dtest job5.sh)
  jid5=$(echo $jid5 | tr -dc '0-9')
  jid6=$(sbatch --dependency=afterany:$jid5 --job-name=dtest job6.sh)
  jid6=$(echo $jid6 | tr -dc '0-9')

  sbatch --dependency=singleton --job-name=dtest job9.sh



-----

Timed start jobs
^^^^^^^^^^^^^^^^

Jobs can be submitted to the schedulers to run at a specific time. This section explains how 
to achieve this with SGE on ShARC and SLURM on Bessemer and Stanage.

.. _timed_jobs_sharc:

Timed start jobs on ShARC
""""""""""""""""""""""""""""

Timed start jobs in SGE scheduler are requested with the ``-a`` argument in the following formats:

.. code-block:: shell

  qsub -a 12241200 job1.sh # Dec 24th at 12:00.00
  qsub -a 202312241200 job2.sh # Dec 24th 2023 at 12:00.00
  qsub -a 202312241200.30 job2.sh # Dec 24th 2023 at 12:00.30

The scheduler will immediately submit these jobs but will wait until the elected date/time has passed before starting them.

The time format must match ``[[CC]]YY]MMDDhhmm[.SS]`` where:

*    **CC**           denotes the century in 2 digits.
*    **YY**           denotes the year in 2 digits.
*    **MM**           denotes the month in 2 digits.
*    **DD**           denotes the day in 2 digits.
*    **hh**           denotes the hour in 2 digits.
*    **mm**           denotes the minute in 2 digits.
*    **ss**           denotes the seconds in 2 digits (default 00).

.. _timed_jobs_bessemer:

.. _timed_jobs_stanage:

Timed start jobs on Bessemer and Stanage
""""""""""""""""""""""""""""""""""""""""

Timed start jobs using the Slurm scheduler are requested with the ``--begin`` argument in the following formats:

.. code-block:: shell

  sbatch --begin=16:00 job.sh
  sbatch --begin=now+60 job.sh #(seconds by default)
  sbatch --begin=now+1hour job.sh
  sbatch --begin=2023-06-30T12:34:00 job.sh

The scheduler will immediately submit these jobs but will wait until the elected date/time has passed before starting them.

-----

Preemptable jobs
^^^^^^^^^^^^^^^^

A preemptable job is a job which has been set to run in a reserved queue's node when those nodes are idle.

The reserved queues are typically private (researcher, research group-owned or dept-owned) nodes :ref:`on Bessemer <groupnodes_bessemer>` or 
:ref:`ShARC <groupnodes_sharc>`, 

Usage of preemptable jobs will typically allow users to access significant amounts of resource very quickly due to poor  
utilisation of private nodes by their owners, however these resources will be instantly reclaimed (and the associated jobs preempted) 
if private node owners submit jobs that can only start immediately using their private node resources.

Usage of preemptable jobs will typically allow users to access significant amounts of compute resource very quickly due to poor private node 
utilisation of private nodes by their owners.

.. warning::

  If your job is preempted by a job from the owner of the reserved queue your job will be terminated so your jobs must be tolerant 
  to being able to stop quickly and cleanly or they will be terminated uncleanly and you can lose output data.

  i.e. your job must be able to make use of checkpointing and / or receive, understand and act on the scheduler signalling to stop execution. 

.. _preemptable_jobs_sharc:

Preemptable jobs on ShARC
""""""""""""""""""""""""""""

At present the ShARC cluster does not have any preemptable queues and this preemptable jobs cannot be submitted on ShARC.

.. _preemptable_jobs_bessemer:

.. _preemptable_jobs_stanage:

Preemptable jobs on Bessemer and Stanage
""""""""""""""""""""""""""""""""""""""""

Under certain conditions,
SLURM on Bessemer and Stanage allows jobs running in higher-priority Partitions (sets of nodes) to
*preempt* jobs in lower-priority Partitions.
When a higher priority job *preempts* a lower priority job,
the lower priority job is stopped (and by default cancelled) and
the higher priority job takes its place.

Specifically, SLURM allows users to run interactive sessions and batch jobs using idle resources
in :ref:`private (research group-owned or dept-owned) nodes <groupnodes_bessemer>`,
but these resources will be reclaimed (and the associated jobs preempted) if
members of those groups/departments submit jobs that can only start if those resources are repurposed.

.. note::
    Support for preemptable jobs has been enabled on Bessemer **only**, on a trial basis
    and will be disabled if it impacts on
    priority access by groups / departments to
    private nodes they have purchased.

An example of the use of preemptable jobs:

1. Researcher A wants to run a job using 2 GPUs.  All 'public' GPUs are being used by jobs, but some GPUs in a private node belonging to research group X are idle.
2. Researcher A decides that they want to use those idle GPUs but they aren't a member of research group X; however, they are happy to take the risk of their job being preempted by a member of research group X.
3. Researcher A submits a job and makes it preemptable (by adding submitting it to the ``preempt`` Partition using ``--partition=preempt``).
4. The job starts running on a node which is a member of the ``preempt`` and ``research-group-X`` Partitions.
5. Researcher B is a member of research group X and submits a job to the ``research-group-X`` Partition.  
6. This job can only start if the resources being used by the first job are reclaimed.
7. As a result, SLURM preempts the first job with this second job, as a result of which the first job is cancelled.
8. The second job runs to completion.

.. tip::

  Tips for using preemptable jobs:

  * Ensure that you're able to reliably re-submit your preemptable job if it is preempted before completion.  A common way of doing this is to write out state/progress information periodically whilst the job is running.
  * Select a sensible frequency for writing out state/progress information or you may cause poor performance due to storage write speed limits.


-----

Advanced workflow management tools
----------------------------------

Several advanced work flow management frameworks exist which make use of the 
Distributed Resource Management Application API (DRMAA). This is available on both clusters which 
can be used with advanced scripts or a Computational Pipeline manager.

For further detail on DRMAA see our guide to the :ref:`drmaa` API.

The links provided below document some of these DRMAA enabled frameworks.

* `Ruffus <http://www.ruffus.org.uk/>`_
* `Snakemake <https://snakemake.github.io/>`_
* `Dask <https://www.dask.org/>`_

