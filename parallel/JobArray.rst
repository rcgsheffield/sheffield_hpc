.. _parallel_jobarray:

SGE Array Jobs
==============

The simplest way of exploiting parallelism on the clusters is to use **Array Jobs**.

An Array Job is a set of tasks run from a single batch job submission script. For example: ::

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

Advantages of Array Jobs:

* You only need to submit one job to run a series of very similar tasks;
* These tasks are independent and do not all need to run at once so
  the job scheduler can efficiently run one or more queued tasks as the requested computational resources become available;
* They are particularly useful for `Embarrassingly Parallel <https://en.wikipedia.org/wiki/Embarrassingly_parallel>`_ problems such as:

  * Monte Carlo simulations (where ``$SGE_TASK_ID`` might correspond to random number seed);
  * Parameter sensitivity analysis;
  * Batch file processing (where ``$SGE_TASK_ID`` might refer to a file in a list of files to be processed).

Array Jobs on ShARC can have a maximum of 75000 tasks.

Limiting number of concurrent tasks for GPU array jobs
------------------------------------------------------

The job scheduler has means for ensuring fair use of the cluster if a user submits an array comprised of many CPU-only tasks. However, if a user submits an array of GPU jobs then this could result in unfair usage as at present the job scheduler has mechanisms for lowering the priorities of pending tasks based on the user's recent CPU and memory usage but does not penalise for recent GPU usage.

Therefore, if you want to submit GPU array jobs you may want (or be asked) to explicitly limit the number of GPU tasks that can run concurrently.

Use the flag ``-tc 5`` to specify the maximum number of concurrent tasks (five tasks in this example). As per the ``-t`` flag, it can either be included on the command line: ::

  #Running 100 jobs with maximum of 5 running concurrently
  qsub -t 1-100 -tc 5 my_array_job.sh

or in the batch file itself: ::

  #$ -t 1-100
  #$ -tc 5



Examples
--------

* `MATLAB SGE Job Array example <https://github.com/mikecroucher/HPC_Examples/tree/master/languages/MATLAB/SGE_array>`_

Managing output and error files
-------------------------------

By default, when you run a Job Array
a separate output and error file will be written *per task*
to the directory the Job Array was submitted from.
This may not be convenient:
you may not want to be generating tens, hundreds or thousands of log files
in your project's directories on ShARC.

A more sensible approach could be to
tell the scheduler to write output and error log files per task to
a folder in your home directory called ``logs``,
also ensuring that the names of these files contain the job name: ::

    #!/bin/bash
    #
    #$ -N MyProjectX
    #$ -t 1-100
    #$ -o /home/$USER/logs
    #$ -e /home/$USER/logs
    #
    echo "Task id is $SGE_TASK_ID"

    ./myprog $SGE_TASK_ID

This will generate output files of the form: ::

    MyProjectX.o$JOB_ID.$SGE_TASK_ID

and error files of the form: ::

    MyProjectX.e$JOB_ID.$SGE_TASK_ID

where ``$SGE_TASK_ID`` is the task ID and ``$JOB_ID`` is the ID of the entire Array Job.

Grouping tasks for efficiency
-----------------------------

If you know that each of your workflow's tasks takes only a few seconds to run then
making each of these a separate task in your Job Array may not be particularly efficient as
it takes a few seconds to schedule each job.

A better approach may be to batch up tasks into groups that you know will run for a few minutes each.
This can be achieved by specifying a **step size** for the range of task IDs and then
doing multiple things per task.

In the example below, the submitted Array Job that consists of ten tasks
which have ``SGE_TASK_ID`` values of 1, 11, 21...91 (and therefore a step size of 10).
This step size only needs to be specified once;
later on in the script it can be determined using the ``$SGE_TASK_STEPSIZE`` variable.
In the example, ``myprog`` is run ten times per task: ::

    #!/bin/bash
    #
    #$ -N MyProjectX
    #$ -t 1-100:10
    #$ -o /home/$USER/logs/
    #$ -e /home/$USER/logs/

    echo "Startinng task $SGE_TASK_ID"
    for subtask_id in $(seq $SGE_TASK_ID $(( $SGE_TASK_ID + $SGE_TASK_STEPSIZE - 1 )) ); do
        echo "Subtask $subtask_id of task $SGE_TASK_ID"
        ./myprog $subtask_id
    done

Email notifications
-------------------

If you :ref:`enable email notifications <submit_batch_sharc>` in your batch job submission script then
you will receive emails for *every* task in your Array Job.
This helps you determine if any tasks in the Array Job failed but
doesn't help you determine if the entire Array Job has finished running.
Here's a sensible approach to managing email notifications:

1. Edit your Array Job submission script so you are *only* notified of aborted (``a``) tasks i.e. ::

        #$ -M me@sheffield.ac.uk
        #$ -m a

2. Then submit your Array Job like so: ::

        [te1st@sharc-login1 ~]$ qsub my_array_job.sge
        Your job-array 2035587.1-3:1 ("my_array_job.sge") has been submitted

3. Next, submit a very simple job that will only run when Array Job ``2035587`` has completed and emails you when it finishes: ::

        [te1st@sharc-login1 ~]$ qsub -o /dev/null -e /dev/null -M me@sheffield.ac.uk -m ea -b y -l h_rt=00:00:15 -hold_jid 2035587 -N 'Array_Job_finished' true
        Your job 2035588 ("Job_array_finished") has been submitted

You will therefore receive:

* An email for every failed task in the Array Job;
* An email shortly after the entire Array Job finishes.
