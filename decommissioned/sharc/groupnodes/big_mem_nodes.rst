.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _big_mem_dcs_groupnodes_sharc:

Big memory nodes (Computer Science)
===================================

The Department of Computer Science (DCS) have purchased 8 nodes in :ref:`ShARC <sharc>` 
that each have much more than the standard amount of RAM per node. 

Specifications
--------------

Three nodes (``sharc-node121`` to ``sharc-node123``) each have:

.. list-table::
   :header-rows: 0

   * - Processors
     - 2x Intel Xeon E5-2630 v3 processors (2.40 GHz, 8 cores per socket i.e. 16 total)
   * - RAM
     - 768 GB RAM (48 GB / CPU core)
   * - NUMA nodes
     - 2x
   * - Networking
     - 100 Gbps Omni-Path
   * - Local storage
     - 1.5 TB under ``/scratch`` (HDD)

Five nodes (``sharc-node173`` to ``sharc-node177``) each have:

.. list-table::
   :header-rows: 0

   * - Processors
     - 2x Intel Xeon Gold 6138 processors (2.00GHz, 20 cores per socket i.e. 40 total)
   * - RAM
     - 768 GB RAM (19.2 GB / CPU core)
   * - NUMA nodes
     - 2x
   * - Networking
     - 100 Gbps Omni-Path
   * - Local storage
     - 1TB SSD

Requesting Access
-----------------

Access to the node is managed by the `RSE team <https://rse.shef.ac.uk>`_. Access policy:

* PhD students, researchers and staff in Computer Science can all request access to the nodes.
* Access to others who are collaborating on projects with some Computer Science / RSE involvement
  can be made on a case-by-case basis.
* Access to Computer Science MSc and BSc students
  can be made on a case-by-case basis.

A number of other users were granted access before this policy was developed.

To request access complete `this Google Form <https://docs.google.com/forms/d/19j8enPCALohamEWk-jkjnwYRiLbI2DMMWMqSJhAbE_I/edit>`__
and someone within the RSE team will then respond with further information.

To use the nodes you must:

#. Be made a member of one of the ``dcs-res`` ``dcs-collab`` Grid Engine (scheduler) *Access Control Lists* (ACL i.e. user groups);
#. Submit jobs using the ``rse`` Grid Engine *Project*;
#. Start interactive jobs in ``rse-interactive.q`` Grid Engine *Cluster Queue*;
#. Start batch jobs in the ``rse.q`` Grid Engine *Cluster Queue*;
   
Running an interactive session
------------------------------

Once you have obtained permission to use the nodes you can request an interactive session on one of the nodes using:

.. code-block:: bash

   qrshx -P rse -q rse-interactive.q

Here ``-P rse`` specifies that you want to use the ``rse`` project for your session, 
which gives you access to these big memory nodes and 
ensures that your interactive session can run in the ``rse-interactive.q`` job queue 
(as can be seen if you subsequently run ``qstat -u $USER`` from within your session).

The ``rse-interactive.q`` job queue has a maximum job runtime (``h_rt``) of four hours, 
as is standard for interactive jobs on SHARC.

Submitting batch jobs
---------------------

Jobs can be submitted to the nodes by adding the ``-P rse`` and ``-q rse.q`` parameters. 
For example, create a job script named ``my_job_script.sh`` with the contents:

.. code-block:: bash

   #!/bin/bash
   #$ -P rse 
   #$ -q rse.q

   echo "Hello world"

You can of course add more options to the script such as a request for additional RAM
(e.g. ``$# -l rmem=10G``).

Run your script with the ``qsub`` command:

.. code-block:: bash

   qsub my_job_script.sh

You can use the ``qstat`` command to check the status of your current job. 
An output file is created in your home directory that captures your script's outputs.

See :ref:`submit_batch_sharc` for more information on job submission and the Sun Grid Engine scheduler.

