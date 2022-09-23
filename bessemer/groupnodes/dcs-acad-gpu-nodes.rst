.. _dcs_acad_gpu_nodes_bessemer:

GPU nodes for specific Computer Science academics
=================================================

Four academics in the `Department of Computer Science <https://www.sheffield.ac.uk/dcs>`__ (DCS)
share two NVIDIA V100 GPU nodes in :ref:`Bessemer <bessemer>`:

.. _dcs_acad_gpu_node_accounts:

.. list-table::
   :header-rows: 1

   * - Academic
     - Node
     - Slurm Account name
     - Slurm Partition name
   * - `Carolina Scarton`_
     - ``bessemer-node041``
     - ``dcs-acad1``
     - (see notes below)
   * - `Chenghua Lin`_
     - ``bessemer-node041``
     - ``dcs-acad2``
     - (see notes below)
   * - `Matt Ellis`_
     - ``bessemer-node042``
     -  ``dcs-acad3``
     - (see notes below)
   * - `Po Yang`_
     - ``bessemer-node042``
     - ``dcs-acad4``
     - (see notes below)

Other academics in the department have **temporary** access to some NVIDIA A100 GPU nodes in Bessemer:

.. list-table::
   :header-rows: 1

   * - Academic(s)
     - Node
     - Slurm Account name
     - Slurm Partition name
   * - `Heidi Christensen`_ / `Jon Barker`_
     - ``gpu-node017``
     - ``dcs-acad5``
     - ``dcs-acad5``
   * - `Nafise Sadat Moosavi`_
     - ``gpu-node018``
     - ``dcs-acad6``
     - ``dcs-acad6``


.. _dcs_acad_gpu_nodes_hw:

Hardware specifications
-----------------------

``bessemer-node041`` and ``bessemer-node042``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 0

   * - Processors
     - 2x Intel Xeon Gold 6138 (2.00GHz; 20 cores per CPU)
   * - RAM
     - 192GB (DDR4 @ 2666 MHz)
   * - NUMA nodes
     - 2x
   * - GPUS
     - 4x NVIDIA Tesla V100 SXM2 (16GB RAM each; NVLINK interconnects between GPUs)
   * - Networking
     - 25 Gbps Ethernet
   * - Local storage
     - 140 GB of temporary storage under ``/scratch`` (2x SSD RAID1)

``gpu-node017`` and ``gpu-node018`` 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

See the 
:ref:`specifications of the NVIDIA A100 nodes listed here <GPUResources_bessemer_tmp_a100_nodes>`.

Requesting access
-----------------

Users other than the :ref:`listed academics <dcs_acad_gpu_node_accounts>`
should contact one of those academics should they want access to these nodes.

That academic can then grant users access to the relevant SLURM Account (e.g. ``dcs-acad1``)
via `this web interface <https://www.sheffield.ac.uk/storage/groups/>`__.

Using the nodes
---------------

There are several ways to access these nodes.
The type of access granted for a job depends on which SLURM *Account* and *Partition* are requested at job submission time.
Only certain users have access to a given Account.

.. _dcs_acad_gpu_nodes_non_prempt_access:

sharc-node041 and sharc-node042: non-preemptable access to half a node
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each of four academics (plus their collaborators) have ring-fenced, on-demand access to the resources of half a node.

To submit a job via this route, you need to :ref:`specify a Partition and an Account <slurm_access_priv_nodes>` when submitting a batch job or starting an interactive session:

* Partition: ``dcs-acad``
* Account: ``dcs-acadX`` where ``X`` is 1, 2, 3 or 4 and :ref:`varies between the academics <dcs_acad_gpu_node_accounts>`).
* QoS: do not specify one i.e. do not use the ``--qos`` parameter.

Resource limits per job:

* Default run-time: 8 hours
* Maximum run-time: 7 days
* CPU cores: 20
* GPUs: 2
* Memory: 96 GB

.. todo::
   If using cluster-wide values for default and max run time then link to central info re that rather than duplicating here.

sharc-node041 and sharc-node042: preemptable access to both nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If any of the four academics (or their collaborators) want to run a larger job that requires
up to *all* the resources available in *one* of these two nodes
then they can :ref:`specify a different Partition <slurm_access_priv_nodes>` when submitting a batch job or starting an interactive session:

* Partition: ``dcs-acad-pre``
* Account: ``dcs-acadX`` where ``X`` is 1, 2, 3 or 4 and :ref:`varies between the academics <dcs_acad_gpu_node_accounts>`).
* QoS: do not specify one i.e. do not use the ``--qos`` parameter.

*However*, to facilitate fair sharing of these GPU nodes jobs submitted via this route are *preemptable*:
they will be stopped mid-execution if a job is submitted to the ``dcs-acad`` partition (:ref:`see above <dcs_acad_gpu_nodes_non_prempt_access>`)
that requires those resources.

When a job submitted by this route is preempted by another job the preempted job is terminated and re-queued.

Resource limits per job:

* :ref:`Number of CPU cores, amount of RAM and number of GPUs in a single node <dcs_acad_gpu_nodes_hw>`
  i.e. multi-node jobs are not permitted.
* Same default and maximum run-time (:ref:`as above <dcs_acad_gpu_nodes_non_prempt_access>`).

gpu-node017 and gpu-node018: access to a node
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Two sets two academics (plus their collaborators) each have access to one node.

To submit a job via this route, you need to 
:ref:`specify a Partition and an Account <slurm_access_priv_nodes>` 
when submitting a batch job or starting an interactive session:

* Partition: ``dcs-acadX`` where ``X`` is 5 or 6 and :ref:`varies between the academics <dcs_acad_gpu_node_accounts>`).
* Account: ``dcs-acadX`` where again ``X`` is 5 or 6.
* QoS: do not specify one i.e. do not use the ``--qos`` parameter.

Resource limits per job:

* Default run-time: 8 hours
* Maximum run-time: 7 days
* CPU cores: 48
* GPUs: 4
* Memory: 512 GB

.. _Carolina Scarton: https://www.sheffield.ac.uk/dcs/people/academic/carolina-scarton
.. _Chenghua Lin: https://www.sheffield.ac.uk/dcs/people/academic/chenghua-lin
.. _Heidi Christensen: https://www.sheffield.ac.uk/dcs/people/academic/heidi-christensen
.. _Jon Barker: https://www.sheffield.ac.uk/dcs/people/academic/jon-barker
.. _Matt Ellis: https://www.sheffield.ac.uk/dcs/people/academic/matt-ellis
.. _Nafise Sadat Moosavi: https://www.sheffield.ac.uk/dcs/people/academic/nafise-sadat-moosavi
.. _Po Yang: https://www.sheffield.ac.uk/dcs/people/academic/po-yang
