.. _dcs_acad_gpu_nodes_bessemer:

GPU nodes for specific Computer Science academics
=================================================

Four academics in the `Department of Computer Science <https://www.sheffield.ac.uk/dcs>`__ (DCS)
share two GPU nodes in :ref:`Bessemer <bessemer>`.

.. _dcs_acad_gpu_node_accounts:

.. list-table::
   :header-rows: 1

   * - Academic
     - Slurm Account name
   * - `Carolina Scarton`_
     - ``dcs-acad1``
   * - `Chenghua Lin`_
     - ``dcs-acad2``
   * - `Aditya Gilra`_
     -  ``dcs-acad3``
   * - `Po Yang`_
     - ``dcs-acad3``

.. _dcs_acad_gpu_nodes_hw:

Hardware specifications
-----------------------

``bessemer-node041`` and ``bessemer-node042`` each have:

.. list-table::
   :header-rows: 0

   * - Processors
     - 2x Intel Xeon Gold 6138 (2.00GHz; 40 cores per CPU)
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

.. note::

   Most other GPU nodes in Bessemer have 32GB of GPU memory per GPU.

Requesting access
-----------------

Users other than the :ref:`four listed academics <dcs_acad_gpu_node_accounts>`
should contact one of those academics should they want access to these nodes.

That academic can then grant users access to the relevant SLURM Account (e.g. ``dcs-acad1``)
via `this web interface <https://www.sheffield.ac.uk/storage/groups/>`__.

Using the nodes
---------------

There are several ways to access these nodes.
The type of access granted for a job depends on which SLURM *Account* and *Partition* are requested at job submission time.
Only certain users have access to a given Account.

.. _dcs_acad_gpu_nodes_non_prempt_access:

1. Non-pre-emptable access to half a node
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Each of the four academics (plus their collaborators) have ring-fenced, on-demand access to the resources of half a node.

To submit a job via this route, you need to :ref:`specify a *Partition* and *Account* <slurm_access_priv_nodes>` when submitting a batch job or starting an interactive session:

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

2. Pre-emptable access to both nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If any of the academics (or their collaborators) want to run a larger job that requires
up to *all* the resources available in *one* of these two nodes
then they can :ref:`specify a different Partition <slurm_access_priv_nodes>` when submitting a batch job or starting an interactive session:

* Partition: ``dcs-acad-pre``
* Account: ``dcs-acadX`` where ``X`` is 1, 2, 3 or 4 and :ref:`varies between the academics <dcs_acad_gpu_node_accounts>`).
* QoS: do not specify one i.e. do not use the ``--qos`` parameter.

*However*, to facilitate fair sharing of these GPU nodes jobs submitted via this route are *pre-emptable*:
they will be stopped mid-execution if a job is submitted to the ``dcs-acad`` partition (:ref:`see above <dcs_acad_gpu_nodes_non_prempt_access>`)
that requires those resources.

When a job submitted by this route is pre-empted by another job the pre-empted job is terminated and re-queued.

Resource limits per job:

* :ref:`Number of CPU cores, amount of RAM and number of GPUs in a single node <dcs_acad_gpu_nodes_hw>`
  i.e. multi-node jobs are not permitted.
* Same default and maximum run-time (:ref:`as above <dcs_acad_gpu_nodes_non_prempt_access>`).

.. todo::

   Re-add the following after setting it up:

   3. General pre-emptable access to both nodes

   Users other than the academics and their collaborators can make use of idle time on these nodes and other nodes by
   submitting batch jobs and starting interactive sessions using a :ref:`particular partition <slurm_access_priv_nodes>`:

   * Partition: ``preempt``

   These jobs can be pre-empted by jobs submitted to the ``dcs-acad-pre`` and ``dcs-acad`` partitions.


.. _Carolina Scarton: https://www.sheffield.ac.uk/dcs/people/academic/carolina-scarton
.. _Chenghua Lin: https://www.sheffield.ac.uk/dcs/people/academic/chenghua-lin
.. _Aditya Gilra: https://www.sheffield.ac.uk/dcs/people/academic/aditya-gilra
.. _Po Yang: https://www.sheffield.ac.uk/dcs/people/academic/po-yang
