.. _big_mem_com_groupnodes_sharc:

Big memory nodes [COM]
======================

The Department of Computer Science have purchased three nodes in ShARC that each have 
much more than the standard amount of RAM per node. 

Specifications
--------------

* 2x Intel Xeon E5-2630 v3 processors (2.40GHz, 8 cores per processor i.e. 16 total)
* 768 GB RAM (48GB / CPU core)

Requesting Access
-----------------

The nodes are managed by the `RSE group <http://rse.shef.ac.uk>`_ and are available by request to all research groups belonging to the Computer Science Department.

To use the nodes you must join the ``rse`` Grid Engine (scheduler) *Access Control List* (ACL i.e. user group) and submit jobs using the ``rse`` Grid Engine Project.

To join this ACL please email `RSE enquiries <rse@shef.ac.uk>`_.

Requesting a node
-----------------

Once you have obtained permission to use the nodes you can request an interactive session on one of the nodes using:

.. code-block:: bash

	qrshx -P rse 

Here ``-P rse`` specifies that you want to use the ``rse`` project for your session, 
which gives you access these big memory nodes and 
ensures that your interactive session runs in the ``rse.q`` job queue 
(as can be seen if you subsequently run ``qstat -u $USER`` from within your session).

Submitting jobs
---------------

Jobs can be submitted to the nodes by adding the ``-P rse`` parameter. For example, create a job script named ``my_job_script.sh`` with the contents:

.. code-block:: bash

	#!/bin/bash
	#$ -P rse 

	echo "Hello world"

You can of course add more options to the script such as a request for additional RAM (e.g. `` $# -l rmem=10G``).

Run your script with the ``qsub`` command ::

	qsub my_job_script.sh

You can use ``qstat`` command to check the status of your current job. An output file is created in your home directory that captures your script's outputs.

See :ref:`sge-queue` for more information on job submission and the Sun Grid Engine scheduler.
