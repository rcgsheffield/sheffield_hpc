.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sge_info:

SGE Scheduler Job Submission info
=================================

.. _submit_job_sharc:

Job Submission / Control on ShARC
---------------------------------

.. _submit_interactive_sharc:

Interactive Jobs
^^^^^^^^^^^^^^^^

There are three commands for requesting an interactive shell using SGE:

* :ref:`qrsh` - No support for graphical applications.  Standard SGE command.
* :ref:`qsh` - Supports graphical applications.  Standard SGE command.
* :ref:`qrshx` - Supports graphical applications. Superior to :ref:`qsh` and is unique to Sheffield's clusters.

Usage of these commands is as follows:

.. code-block:: console

    $ qrshx

You can configure the resources available to the interactive session by adding command line options.
For example to start an interactive session with access to 16 GB of RAM:

.. code-block:: console

    $ qrshx -l rmem=16G

To start a session with access to 2 cores in the SMP parallel environment:

.. code-block:: console

    $ qrshx -pe smp 2



A table of common interactive job options is given below; any of these can be
combined together to request more resources.

======================  =========================================================================================
SGE Command             Description
======================  =========================================================================================
``-l h_rt=hh:mm:ss``    Specify the total maximum wall clock execution time for the job. The upper limit is
                        08:00:00. **Note:** these limits may differ for reservations /projects.

``-l rmem=xxG``         ``-l rmem=xxG`` is used to specify the maximum amount (``xx``) of real 
                        memory to be requested **per
                        CPU core**.

                        |br| If the real memory usage of your job exceeds this value multiplied by the number
                        of cores / nodes you requested then your job will be killed.

``-pe env nn``          Specify a parallel, ``env``, environment and a number of processor cores ``nn``. 
                        e.g. SMP jobs ``-pe smp 4`` or MPI jobs ``-pe mpi 4``.    
======================  =========================================================================================

Note that ShARC has multiple :ref:`parallel environments <parallel_sharc>`, the current parallel environments can 
be found on the :ref:`ShARC Parallel Environments <sge_parrallel_envs>` page.

.. _submit_batch_sharc:

Batch Jobs
^^^^^^^^^^

.. tip::

    Batch jobs have larger resource limits than interactive jobs! For guidance on what these 
    limits are and how best to select resources please see our :ref:`Choosing appropriate compute resources <Choosing-appropriate-compute-resources>` page.

There is a single command to submit jobs via SGE:

* :ref:`qsub` - Standard SGE command with no support for interactivity or graphical applications.

The batch submission scripts are executed for submission as below:

.. code-block:: sh

    qsub submission.sh

Note the job submission number. For example:

.. code-block:: sh

    Your job 12345678 ("submission.sh") has been submitted

You can check your output log or error log file when the job is finished.

.. code-block:: sh

    cat job.sh.o12345678
    cat job.sh.e12345678

There are numerous further options you can request in your batch submission files which are 
detailed below:

Pass through current shell environment (sometimes important):

.. code-block:: sh

    #$ -V

Name your job submission:

.. code-block:: sh

    #$ -N test_job

Specify a parallel environment for SMP jobs where ``N`` is a number of cores:

.. code-block:: sh

    #$ -pe smp N

Specify a parallel environment for MPI jobs where ``N`` is a number of cores:

.. code-block:: sh

    #$ -pe mpi N

Request a specific amount of memory where ``N`` is a number of gigabytes **per core**:

.. code-block:: sh

    #$ -l rmem=NG

Request a specific amount of time in hours, minutes and seconds:

.. code-block:: sh

    #$ -l h_rt=hh:mm:ss

Request email notifications on start, end and abort:

.. code-block:: sh


    #$ -M me@somedomain.com
    #$ -m abe

For the full list of the available options please visit the SGE manual webpage for qsub here: http://gridscheduler.sourceforge.net/htmlman/htmlman1/qsub.html

Here is an example SGE batch submission script that runs a fictitious program called ``foo``:

.. code-block:: bash

    #!/bin/bash
    # Request 5 gigabytes of real memory (mem)
    #$ -l rmem=5G

    # load the module for the program we want to run
    module load apps/gcc/foo

    # Run the program foo with input foo.dat
    # and output foo.res
    foo foo.dat foo.res

Some things to note:

* The first line always needs to be ``#!/bin/bash`` (to tell the scheduler that this is a bash batch script).
* Comments start with a ``#``.
* It is always best to fully specify job's resources with your submission script.
* All **SGE** Scheduler options, such as the amount of memory requested, start with ``#$``


* You will often require one or more ``module`` commands in your submission file.
  These make programs and libraries available to your scripts.
  Many applications and libraries are available as modules on
  :ref:`ShARC <sharc-software>`.

Here is a more complex example that requests more resources:

.. code-block:: bash

    #!/bin/bash
    # Request 16 gigabytes of real memory (RAM) 4 cores *4G = 16
    #$ -l rmem=4G
    # Request 4 cores in an OpenMP environment
    #$ -pe openmp 4
    # Email notifications to me@somedomain.com
    #$ -M me@somedomain.com
    # Email notifications if the job aborts
    #$ -m a
    # Name the job
    #$ -N my_job
    # Request 24 hours of time
    #$ -l h_rt=24:00:00

    # Load the modules required by our program
    module load compilers/gcc/5.2
    module load apps/gcc/foo

    # Set the OPENMP_NUM_THREADS environment variable to 4
    # This is needed to ensure efficient core usage.
    export OMP_NUM_THREADS=$NSLOTS

    # Run the program foo with input foo.dat
    # and output foo.res
    foo foo.dat foo.res

Monitoring running Jobs
^^^^^^^^^^^^^^^^^^^^^^^

There is a single command to monitor running and queued jobs via the ``qstat`` command:

* :ref:`qstat` 

.. include:: ../../referenceinfo/imports/scheduler/SGE/common-commands/qstat_examples_import.rst

Stopping or cancelling Jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Jobs can be stopped or cancelled using the ``qdel`` command:

* :ref:`qdel` 

.. include:: ../../referenceinfo/imports/scheduler/SGE/common-commands/qdel_example_import.rst

Investigating finished Jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Jobs which have already finished can be investigated using the ``qacct`` command:

* :ref:`qacct` 

.. include:: ../../referenceinfo/imports/scheduler/SGE/common-commands/qacct_usage_import.rst

By default the ``qacct`` command will only bring up summary info about the user's jobs from the 
current accounting file (which rotates monthly). Further detail about the output metrics and how 
to query jobs older than a month can be found on the dedicated :ref:`qacct` page.

.. _job_debugging_sharc:

Debugging failed Jobs
^^^^^^^^^^^^^^^^^^^^^

.. note::

    One common form of job failure on ShARC is caused by Windows style line endings. If you see
    an error reported by ``qacct`` of the form: ::

        failed searching requested shell because:

    Or by ``qstat`` of the form: ::

        failed: No such file or directory

    You must replace these line endings as detailed in the :ref:`FAQ <windows_eol_issues>`.


If one of your jobs has failed and you need to debug why this has occured you should consult the 
job records held by the scheduler with the :ref:`qacct` referenced above as well as the generated 
job logs.
 
These output and error log files will be generated in the job working directory 
with the structure ``$JOBNAME.o$JOBID`` and ``$JOBNAME.e$JOBID`` where ``$JOBNAME`` is 
the user chosen name of the job and ``$JOBID`` is the scheduler provided job id. 
Looking at these logs should indicate the source of any issues.

The ``qacct`` info will contain two important metrics, the **exit code** and **failure code**.

The **exit code** is the return value of the exiting program/script. It can be a user defined value if the 
job is finished with a call to 'exit(number)'. For abnormally terminated jobs it is the signal 
number + 128. 

As an example: 137-128 = 9, therefore: signal 9 ( SIGKILL), it was sent the KILL signal 
and was killed, likely by the scheduler.

The **failure code**  indicates why a job was abnormally terminated (by the scheduler). 
An incomplete table of common failure codes is shown below:

.. include:: ../../referenceinfo/imports/scheduler/SGE/failure_codes_import.rst


