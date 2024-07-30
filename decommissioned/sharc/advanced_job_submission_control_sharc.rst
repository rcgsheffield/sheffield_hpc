.. _advanced_job_submission_control_sharc:

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


.. tip::

  Tips for using preemptable jobs:

  * Ensure that you're able to reliably re-submit your preemptable job if it is preempted before completion.  A common way of doing this is to write out state/progress information periodically whilst the job is running.
  * Select a sensible frequency for writing out state/progress information or you may cause poor performance due to storage write speed limits.



