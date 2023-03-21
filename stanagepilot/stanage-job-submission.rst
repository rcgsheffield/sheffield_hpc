.. _stanage-job-submission:

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

Job Submission
==============

.. tip::

    The Stanage cluster has been configured to have the same default resource request limits as the ShARC cluster. 
    Please see our :ref:`Choosing appropriate compute resources page <Choosing-appropriate-compute-resources>` for further information.


.. _submit_interactive_stanage:

Interactive Jobs
^^^^^^^^^^^^^^^^


SLURM uses a single command to launch interactive jobs:

* :ref:`srun` Standard SLURM command supporting graphical applications.

Usage of the command is as follows:

.. code-block:: console

    $ srun --pty bash -i

You can configure the resources available to the interactive session by adding command line options.
For example to start an interactive session with access to 16 GB of RAM:

.. code-block:: console

    $ srun --mem=16G --pty bash -i

To start a session with access to 2 cores, use **either**:

.. code-block:: console

    $ srun --cpus-per-task=2 --pty bash -i #2 cores per task, 1 task and 1 node per job default. Preferred!
    $ srun --ntasks-per-node=2 --pty bash -i #2 tasks per node, 1 core per task and 1 node per job default.

Please take care with your chosen options as usage in concert with other options
can be multiplicative.

A further explanation of why you may use the tasks options or cpus options can be found :ref:`here<slurm_tasks_vs_cpus_per_task>`.

A table of common interactive job options is given below; any of these can be
combined together to request more resources.

==================================== =======================================================================
Slurm Command                        Description
==================================== =======================================================================
``-t min`` or ``-t days-hh:mm:ss``   Specify the total maximum wall clock execution time for the job. 
                                     The upper limit is 08:00:00. **Note:** these limits may differ
                                     for reservations /projects.

``--mem=xxG``                        |br| 
                                     ``--mem=xxG`` is used to specify the maximum amount (``xx``)
                                     of real memory to be requested **per node**.
 
 
                                     |br| If the real memory usage of your job exceeds this value 
                                     multiplied by the number of cores / nodes you requested then your
                                     job will be killed.

``-c nn`` or ``--cpus-per-task=nn``
                                     |br| ``-c`` is cores per task, take care with your chosen
                                     number of tasks.

``--ntasks-per-node=nn``
                                     |br| ``--ntasks-per-node=`` is tasks per node, take care with your 
                                     chosen number of cores per node. The default is one task per node, 
                                     but note that other options can adjust the default of 1 core per task 
                                     e.g. ``--cpus-per-task``. 
==================================== =======================================================================

.. _submit_batch_stanage:

Batch Jobs
^^^^^^^^^^

.. tip::

    Batch jobs have larger resource limits than interactive jobs! For guidance on what these 
    limits are and how best to select resources please see our :ref:`Choosing appropriate compute resources <Choosing-appropriate-compute-resources>` page.

SLURM uses a single command to submit batch jobs:

* :ref:`sbatch` Standard SLURM command with no support for interactivity or graphical applications.

The `Slurm docs <https://slurm.schedmd.com/sbatch.html>`_ have a complete list of available ``sbatch`` options.

The batch submission scripts are executed for submission as below:

.. code-block:: sh

    sbatch submission.sh

Note the job submission number. For example:

.. code-block:: sh

    Submitted batch job 1226

You can check your output log or error log file as below:

.. code-block:: sh

    cat JOB_NAME-1226.out

There are numerous further options you can request in your batch submission files which are 
detailed below:

Name your job submission:

.. code-block:: sh

    #SBATCH --comment=JOB_NAME

Specify a number of nodes:

.. code-block:: sh

    #SBATCH --nodes=1

Specify a number of tasks per node:

.. code-block:: sh

    #SBATCH --ntasks-per-node=4

Specify a number of tasks:

.. code-block:: sh

    #SBATCH --ntasks=4

Specify a number of cores per task:

.. code-block:: sh

    #SBATCH --cpus-per-task=4

Request a specific amount of memory **per job**:

.. code-block:: sh

    #SBATCH --mem=16G

Specify the job output log file name:

.. code-block:: sh

    #SBATCH --output=output.%j.test.out

Request a specific amount of time:

.. code-block:: sh

    #SBATCH --time=00:30:00

Request job update email notifications:

.. code-block:: sh

    #SBATCH --mail-user=username@sheffield.ac.uk

For the full list of the available options please visit the SLURM manual webpage for 
sbatch here: https://slurm.schedmd.com/sbatch.html

Here is an example SLURM batch submission script that runs a fictitious program called ``foo``:

.. code-block:: bash

    #!/bin/bash
    # Request 5 gigabytes of real memory (mem)
    #SBATCH --mem=5G

    # load the module for the program we want to run
    module load apps/gcc/foo

    # Run the program foo with input foo.dat
    # and output foo.res
    foo foo.dat foo.res

.. _slurm_tasks_vs_cpus_per_task:

Some things to note:

* The first line always needs to be ``#!/bin/bash`` (to tell the scheduler that this is a bash batch script).
* Comments start with a ``#``.
* It is always best to fully specify job's resources with your submission script.
* All **Slurm** Scheduler options start with ``#SBATCH``
* You should use the SLURM option ``--ntasks=nn`` Number of "tasks", for programs using distributed 
  parallelism (:ref:`MPI<parallel_MPI>`).
* You should use the SLURM option ``--ntasks-per-node=nn`` Number of "tasks per node", for programs 
  using distributed parallelism (:ref:`MPI<parallel_MPI>`).
* You should use the SLURM option ``--cpus-per-task=nn`` Number of "cores per task", for programs using 
  shared memory parallelism (:ref:`SMP<parallel_SMP>` or :ref:`openmp<parallel_SMP>`).
* You will often require one or more ``module`` commands in your submission file to make programs and 
  libraries available to your scripts. 
