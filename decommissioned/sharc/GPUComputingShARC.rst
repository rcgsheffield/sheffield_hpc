.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _GPUComputing_sharc:

Using GPUs on ShARC
===================

Requesting access to GPU facilities
-----------------------------------

Research groups also have an option to purchase and add nodes to the cluster to be managed by IT Services. 
For these nodes (e.g. :ref:`dgx1_dcs_groupnodes_sharc`), 
permission from the group leader is required for access.

The node owner always has highest priority on the job queue but 
as a condition for the management of additional nodes on the cluster, 
the nodes are expected to be used as a resource for running short jobs during idle time. 
If you would like more information about having IT Services add and manage custom nodes, 
please contact ``research-it@sheffield.ac.uk``.

.. _GPUInteractive_sharc:

Interactive use of the GPUs
---------------------------

If you need to use GPUs interactively for e.g. debugging or exploratory data analysis
you can start an interactive session on a GPU node with:

.. code-block:: sh

   qrshx -l gpu=1

The ``-l gpu=`` parameter determines how many GPUs you are requesting. 
Currently, the maximum number of GPUs allowed per job is set to 8.
Most jobs will only make use of one GPU.

Interactive sessions provide you with 2 GB of CPU RAM by default 
which is significantly less than the amount of GPU RAM available. 
This can lead to issues where your session has insufficient CPU RAM to transfer data to and from the GPU. 
As such, it is recommended that you request enough CPU memory to communicate properly with the GPU:

.. code-block:: sh

   # NB Each NVIDIA K80 GPU has 12GB of onboard memory
   qrshx -l gpu=1 -l rmem=13G

The above command will give you 13GB of main memory, which is 1GB more than the 12GB of GPU memory available onboard the NVIDIA K80.


.. _GPUJobs_sharc:

Submitting batch GPU jobs
-------------------------

To run batch jobs on GPU nodes, ensure your job submission script includes a request for GPUs, e.g. for a single GPU:

.. code-block:: sh

   #!/bin/bash
   #$ -l gpu=1

Requesting GPUs and multiple CPU cores from the scheduler
---------------------------------------------------------

You may want to request multiple CPU cores on a single node with a certain number of GPUs per CPU core.  
Here is how to request four CPU cores on a node with two GPU *per CPU core*: ::

  #!/bin/bash
  #$ -pe smp 4
  #$ -l gpu=2

It is **not currently possible** to request:

* more CPU cores than GPUs

  * e.g. a heterogeneous application which could use all 40 CPU cores in a given node whilst using all 8 GPUs;

* non-multiple ratios of GPUs to CPUs

  * e.g. a heterogeneous application which uses 4 GPUs, 
    with 1 CPU core per GPU 
    and can additionally use CPU cores for asynchronous host work 
    i.e. an extra 16 cores, totalling 20 CPUs.

However, such scheduler requests may be supported in future.

.. _GPUResources_sharc:

ShARC GPU Resources
-------------------

Hardware
^^^^^^^^

**Publicly-available GPU nodes**

* :ref:`sharc-gpu-specs`

**Research-group-specific GPU nodes:**

* :ref:`dgx1_dcs_groupnodes_sharc`


GPU-enabled Software
^^^^^^^^^^^^^^^^^^^^

* Applications

  * :ref:`caffe_sharc`
  * :ref:`matlab_sharc`
  * :ref:`theano_sharc`
  * :ref:`tensorflow_sharc`
  * :ref:`torch_sharc`

* Libraries

  * :ref:`cuda_sharc`
  * :ref:`cudnn_sharc`

* Development Tools

  * :ref:`PGI Compilers_sharc`
  * :ref:`nvidia_compiler_sharc`

Training materials
^^^^^^^^^^^^^^^^^^

* The Research Software Engineering team have developed an undergraduate teaching module on CUDA;
  `lecture notes and lecture recordings for that module are accessible here <https://rse.shef.ac.uk/training/com4521>`_ for anyone with a University account.

