.. _advanced_job_profiling_and_analysis:

Advanced Job Profiling and Analysis
===================================

.. tip::

    For majority of the users the :ref:`job_submission_control` page and the output log files you produce should suffice in analysing the perfomance of a batch job. This section is for users who want an even more granular view of the perfomance of their batch jobs by observing what is happening on the node their job is running. 

.. warning::

    Since your job has a fixed set of  memory and CPU resources, carrying out resource hungry operations might lead to the scheduler killing your batch job due to errors like ``out of memory``. 

    Abuse of this feature to carry out tasks that are not profiling and perfomance analysis of your running batch job might lead to your account being suspended.

Accessing a Running Single-Node Slurm Batch job
===============================================

In some cases, you might want to interact with a batch job in the ``RUNNING``  state (e.g. for fault-finding, debugging or profiling purposes).  You can start an interactive session within the resource allocation (memory and CPU cores on particular nodes) associated with the job with:

.. code-block:: shell

    srun --jobid=<JOBID> --pty /usr/bin/bash

The command creates a new Job Step in the batch job with ID ``<JOBID>`` and starts an interactive bash shell session within that Job Step, allowing you to interact with the resources allocated to that job.

If all the allocated CPU resources are already used, ``srun`` will prohibit the new Job Step access to those resources. However, the argument ``--overlap`` can be passed to ``srun`` to allow Job Steps to share access to those resources.

.. code-block:: shell

    srun --jobid=<JOBID> --overlap --pty /usr/bin/bash

Once you are in the interactive session you can see the process IDs associated with your job by typing:

.. code-block:: shell

    scontrol listpids |grep <JOBID>

    or

    ps -u $USER

Start profiling and analysing the perfomance of the node and the job by using commands such as:

.. code-block:: shell

    ps

    nvidia-smi

    top

    lsof


Accessing a Running Multi-Node Slurm Batch job
==============================================

In the scenario you are running a multi-node Slurm job you can use ``squeue`` to see the nodes your job is using:

.. code-block:: shell

    squeue --me

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

