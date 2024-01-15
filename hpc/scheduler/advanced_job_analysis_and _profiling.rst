.. _advanced_job_profiling_and_analysis:

Advanced Job Profiling and Analysis
===================================

.. tip::

    For majority of the users the :ref:`job_submission_control` page and the output log files you produce should suffice in analysing the perfomance of a batch job. This section is for users who want an even more granular view of the perfomance of their batch jobs by observing what is happening on the node their job is running. 

.. warning::

    Since your job has a fixed set of  memory and CPU resources, carrying out resource hungry operations might lead to the scheduler killing your batch job due to errors like ``out of memory``. 

    Abuse of this feature to carry out tasks that are not profiling and perfomance analysis of your running batch job might lead to your account being suspended.

Accessing A Running Single-Node Slurm Batch job
===============================================

In some cases, you might want to access the resources of an existing scheduler allocation, for example a single node batch job that is in the running state. After allocating resources with ``sbatch`` you can access the resources (node) of this allocation with:

.. code-block:: shell

    srun --jobid=<JOBID> --pty /usr/bin/bash

The command creates a new job step and starts interactive bash shell session within a previously allocated job, allowing you to interact with the resources allocated to that job.

If all the allocated CPU resources are already used, srun will prohibit the new job step the access to the resources. However, the argument ``--overlap`` can be passed to srun to allow job steps to overlap on the resources.

.. code-block:: shell

    srun --jobid=<JOBID> --overlap --pty /usr/bin/bash

Once you are in the interactive session you can see the process IDs associated with your job by typing:

.. code-block:: shell

    scontrol listpids |grep <JOBID>

    or

    ps -u $USER

start profiling and analysing the perfomance of the node and the job by using commands such as:

.. code-block:: shell

    ps

    nvidia-smi

    top

    lsof


Accessing A Running Multi-Node Slurm Batch job
==============================================

In the scenario you are running a multi-node Slurm job you can use ``squeue`` to see the nodes your job is using:

.. code-block:: shell

    squeue --user=$USER

**Example output:**

.. code-block:: shell

    squeue --me

        JOBID   PARTITION   NAME      USER  ST       TIME NODES NODELIST(REASON)
        860638 sheffield job.sh    user123  R    1:28:01      1 node301
        830209 sheffield job.sh    user123  R 2-18:45:36      1 node087
        831510 sheffield job.sh    user123  R 2-02:08:04      4 node[075-078]

Once you have the list of nodes you can specify the nodes you want the interactive session to launch on by using ``--nodelist=<NODELIST>``.

.. code-block:: shell

    srun --jobid=<JOBID> --nodelist=<Node Name>  --overlap --pty /usr/bin/bash

