.. _sge_info:

SGE Workload Manager
===================================

Son of Grid Engine or SGE is a highly scalable cluster management and job scheduling system, used in ShARC. As a cluster workload manager, SGE has three key functions:

* it allocates exclusive and/or non-exclusive access to resources (compute nodes) to users for some duration of time so they can perform work,
* it provides a framework for starting, executing, and monitoring work on the set of allocated nodes,
* it arbitrates contention for resources by managing a queue of pending work.

.. _sge_interactive:

Request an Interactive Shell
----------------------------

Launch an interactive session on a worker node using the command:

.. code-block:: sh

    qrshx

You can request an interactive node with multiple CPU cores by using the command:

.. code-block:: sh

    qrshx -pe smp N

The parameter "N" represents the number of CPU cores upto 4 per interactive job. Please note that requesting multiple cores in an interactive node depends on the availability. During peak times, it is unlikely that you can successfully request a large number of cpu cores interactively.  Therefore, it may be a better approach to submit your job non-interactively.

You can request additional memory (parameter "nn" represents the amount of memory):

.. code-block:: sh

    qrshx -l rmem=nnG


.. _sge_job:

Submitting Non-Interactive Jobs
-------------------------------

Write a job-submission shell script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You can submit your job, using a shell script. A general job-submission shell script contains the "shebang-line" in the first row.

.. code-block:: sh

    #!/bin/bash

Next you may specify some additional options, such as memory, CPU or time limit.

.. code-block:: sh

    #$ -"OPTION"="VALUE"

Load the appropriate modules if necessary.

.. code-block:: sh

    module use "PATH"
    module use "MODULE NAME"

Finally, run your program **foo** by with input **foo.dat** and output **foo.res**.

.. code-block:: sh

    foo foo.dat foo.res

The next example script requests 16 CPU cores in the OpenMP parallel environment with a total of 64GB memory. Notifications will be sent to an email address.

.. code-block:: sh

    #!/bin/bash
    # Request 16 cores in an OpenMP environment
    #$ -pe openmp 16
    # Request 64 gigabytes of real memory (RAM) 16 cores *4G = 16
    #$ -l rmem=4G
    # Email notifications to me@somedomain.com
    #$ -M me@somedomain.com
    # Email notifications at the beginning, end or an abort.
    #$ -m abe

    # Load the modules required by our program
    module load compilers/gcc/8.2
    module load apps/gcc/foo

    # Set the OPENMP_NUM_THREADS environment variable to 4
    export OMP_NUM_THREADS=4

    # Run the program foo with input foo.dat
    # and output foo.res
    foo foo.dat foo.res

A maximum of 16 cores can be requested in the OpenMP parallel environment. More cores can be used by choosing an alternative MPI parallel environment.

An example of an MPI batch job is shown below:

.. code-block:: sh

    #!/bin/bash
    # Request 4 MPI 'slots' (cores)
    #$ -pe mpi 4
    # Request 8GB of RAM per slot
    #$ -l rmem=8G

    # Load a MPI library
    module load mpi/openmpi/1.10.4/gcc-6.2

    # Run a program previously compiled using that specific MPI library
    mpirun ./executable


Job Submission
^^^^^^^^^^^^^^

Save the shell script (let's say "submission.sh") and use the command

.. code-block:: sh

    qsub submission.sh

Note the job submission number. For example:

.. code-block:: sh

    Your job 12345678 ("submission.sh") has been submitted

Check your output log or error log file when the job is finished.

.. code-block:: sh

    cat job.sh.o12345678
    cat job.sh.e12345678

Additional options for job submission
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Pass through current shell environment (sometimes important):

.. code-block:: sh

    #$ -V

Name your submission:

.. code-block:: sh

    #$ -N test_job

Specify parallel environment for MPI jobs where N is a number of cores:

.. code-block:: sh

    #$ -pe mpi N

Memory allocation where N is a number of gigabytes:

.. code-block:: sh

    #$ -l rmem=NG

Request time:

.. code-block:: sh

    #$ -l h_rt=hh:mm:ss

Email notifications on start, end and abort:

.. code-block:: sh


    #$ -M me@somedomain.com
    #$ -m abe

For the full list of the available options please visit the SGE manual webpage for qsub here: http://gridscheduler.sourceforge.net/htmlman/htmlman1/qsub.html

Key SGE Scheduler Commands
----------------------------

Display the job queue. Jobs typically pass through several states in the course of their execution. The typical states are q (queuing), r (running), w (waiting), e (error) and d (deleting) .

.. code-block:: sh

    qstat

Shows a specific running or queueing job's details:

.. code-block:: sh

    qstat -j jobid


Shows a specific finished job's details:

.. code-block:: sh

    qacct -j jobid

Details the HPC nodes:

.. code-block:: sh

    qhost

Deletes job from queue:

.. code-block:: sh

    qdel jobid



Reference information
---------------------

Commands that allow you to interact with the scheduler:

    * :ref:`qhost` - Show's the status of Sun Grid Engine hosts.
    * :ref:`qrsh` - Requests an interactive session on a worker node. No support for graphical applications.
    * :ref:`qrshx` - Requests an interactive session on a worker node. Supports graphical applications. Superior to :ref:`qsh` in most cases.
    * :ref:`qsh` - Requests an interactive session on a worker node. Supports graphical applications.
    * :ref:`qstat` - Displays the status of jobs and queues.
    * :ref:`qsub` - Submits a batch job to the system.
