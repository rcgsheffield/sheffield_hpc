Checking Queue and Node Status
------------------------------

Using the ``squeue`` and ``sinfo`` :ref:`SLURM Commands<slurm_referenceinfo_common_commands>` it is possible to query the status of these nodes.
Knowing how many jobs are queued for these nodes, and the status of the nodes can be helpful when estimating when your jobs will run.

``squeue`` can be used to view running and queued jobs for specific partitions, using ``-p <partition_list>``.
Requesting non default format options such as the time limit for jobs can help estimate when your jobs may begin to run, using ``-o`` of ``-O``.

.. code-block:: bash
   :substitutions:

   squeue -p |partitions| -o "%.18i %.12j %.12u %.12b %.2t %.10M %.10l %R"

Which will produce output similar to:

.. code-block:: console

     JOBID         NAME         USER TRES_PER_NOD ST       TIME TIME_LIMIT NODELIST(REASON)
   XXXXXXX     job_name     USERNAME   gres:gpu:1 PD       0:00    1:00:00 (Resources)
   YYYYYYY     job_name     USERNAME   gres:gpu:1  R   12:34:56 7-00:00:00 bessemer-nodeNNN
   ...


``sinfo`` can be used to query the status of nodes within a partition.
For GPU nodes it is useful to also request ``Gres`` and ``GresUsed``:

.. code-block:: bash

   sinfo -p dcs-gpu -N -O "NodeList,Available,Gres,GresUsed,CPUsState"

When all GPUs in the partition are being used, the output will be similar to:

.. code-block:: console

   NODELIST            AVAIL               GRES                GRES_USED           CPUS(A/I/O/T)       
   bessemer-nodeNNN    up                  gpu:v100:4(S:0)     gpu:v100:4(IDX:0-3) 16/24/0/40
   ...