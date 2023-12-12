.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _cryoem_dcs_groupnodes_sharc:

Cryo-EM Facility nodes (School of Biosciences)
==============================================

The School of Biosciences' Cryo-Electron Microscopy Facility has purchased 3 nodes in ShARC.




that each have more than the standard number of cores for ShARC nodes (16).

Specifications
--------------

Three nodes (``sharc-node135``, ``sharc-node136``, ``sharc-node138``) each have:

.. list-table::
   :header-rows: 0

   * - Processors
     - 2x Intel Xeon E5-2640 v4 processors (2.40 GHz, 10 cores per processor i.e. 20 total)
   * - RAM
     - 256 GB RAM (12.8 GB / CPU core)
   * - NUMA nodes
     - 2x
   * - Networking
     - 100 Gbps Omni-Path
   * - Local storage
     - 839 GB under ``/scratch`` (HDD)

Requesting Access
-----------------

Access to the node is managed by Svet Tzokov (``s.b.tzokov@sheffield.ac.uk``; Electron Microscopy Facility Manager).

To use the nodes you must:

#. Be made a member of the  ``cryoem`` Grid Engine (scheduler) *Access Control List* (ACL i.e. user group) by Svet Tzokov;
#. Submit jobs using the ``cryoem`` Grid Engine *Project*;
#. Start interactive jobs and batch jobs in ``cryoem.q`` Grid Engine *Cluster Queue*;

Running an interactive session
------------------------------

Once you have obtained permission to use the nodes you can request an interactive session on one of the nodes using:

.. code-block:: bash

   qrshx -P cryoem -q cryoem.q

Here ``-P cryoem`` specifies that you want to use the ``cryoem`` project for your session, 
which gives you access to these big memory nodes and 
ensures that your interactive session can run in the ``cryoem.q`` job queue 
(as can be seen if you subsequently run ``qstat -u $USER`` from within your session).

The ``cryoem.q`` job queue has a maximum job runtime (``h_rt``) of 96 hours for interactive sessions (and batch jobs),
which is much greater than is standard for interactive jobs on SHARC.

Submitting batch jobs
---------------------

Jobs can be submitted to the nodes by adding the ``-P cryoem`` and ``-q cryoem.q`` parameters. 
For example, create a job script named ``my_job_script.sh`` with the contents:

.. code-block:: bash

   #!/bin/bash
   #$ -P cryoem 
   #$ -q cryoem.q

   echo "Hello world"

You can of course add more options to the script such as a request for additional RAM
(e.g. ``$# -l rmem=10G``).

Run your script with the ``qsub`` command:

.. code-block:: bash

   qsub my_job_script.sh

You can use the ``qstat`` command to check the status of your current job. 
An output file is created in your home directory that captures your script's outputs.

See :ref:`submit_batch_sharc` for more information on job submission and the Sun Grid Engine scheduler.

