.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

.. _stanage-specs:

Stanage Specifications
======================


.. _stanage-os-software-specs:

Operating System and software
-----------------------------

* OS: CentOS 7.x (binary compatible with RedHat Enterprise Linux 7.x) on all nodes.
* Interactive and batch job scheduling software: Slurm.
* Many applications, compilers, libraries and parallel processing tools. See :ref:`stanage-software`.


.. _stanage-network-specs:

Networking
----------

* Intel OmniPath Architecture (OPA) (100 Gb/s) to all public nodes.
* Gigabit Ethernet.

.. _stanage-cpu-specs:

General CPU node specifications
-------------------------------

152 nodes are publicly available (not exclusive to research groups).

.. include:: /referenceinfo/imports/stanage/R650_spec.rst

* RAM: 256 GB (i.e. 4.0 GiB / core):

  * 3200 MT/s;
  * DDR4.


.. include::/referenceinfo/imports/stanage/stanage_generic_node_local_storage.rst


Large memory node specifications
--------------------------------

To complement the standard nodes with 256GB of memory per node (4GB/core), there are 12 large memory 
nodes with 1TB  (16GB/core), and a further 12 very large nodes with 2TB (32GB/core).

Large memory nodes
^^^^^^^^^^^^^^^^^^

12 nodes are publicly available (not exclusive to research groups).

.. include:: /referenceinfo/imports/stanage/R650_spec.rst

* RAM: 1024 GB (i.e. 16.0 GiB / core):

  * 3200 MT/s;
  * DDR4.


.. include::/referenceinfo/imports/stanage/stanage_generic_node_local_storage.rst


Very large memory nodes
^^^^^^^^^^^^^^^^^^^^^^^

12 nodes are publicly available (not exclusive to research groups).


.. include:: /referenceinfo/imports/stanage/R650_spec.rst


* RAM: 2048 GB (i.e. 32.0 GiB / core):

  * 3200 MT/s;
  * DDR4.

.. include::/referenceinfo/imports/stanage/stanage_generic_node_local_storage.rst

.. _stanage-gpu-specs:

GPU nodes
---------

A100 GPU node specifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

15 nodes are publicly available (not exclusive to research groups).
Prior to December 2022 these were temporarily available in the Bessemer cluster.

* Machine: `Dell PowerEdge XE8545`_.
* CPUs: 2 x 24 core `AMD EPYC 7413`_:

  * `Zen 3`_ processor microarchitecture;
  * Base clock 2.65 GHz; Boost clock 3.60 GHz;
  * `Hyperthreading`_ is disabled on all nodes.

* RAM: 512 GB (i.e. 32.0 GiB / core):

  * 3200 MHz;
  * DDR4.

* Local storage: 460 GB boot device (SSD) plus 2.88 TB :ref:`'/scratch' temporary storage<scratch_dir>` (RAID 0 on SSDs).
* GPUs: 4x `NVIDIA A100 <https://www.nvidia.com/en-gb/data-center/a100/>`__, each with:

  * High-bandwidth, low-latency `NVLink <https://www.nvidia.com/en-gb/design-visualization/nvlink-bridges/>`__ GPU interconnects (3-4x the bandwidth of PCIe for inter-GPU comms)
  * 80GB memory (HBM2e).

H100 GPU node specifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

6 nodes are publicly available (not exclusive to research groups).

* Machine: `Dell PowerEdge R7525`_.
* CPUs: 2 x 24 core `AMD EPYC 7413`_:

  * `Zen 3`_ processor microarchitecture;
  * Base clock 2.65 GHz; Boost clock 3.60 GHz;
  * `Hyperthreading`_ is disabled on all nodes.

* RAM: 512 GB (i.e. 32.0 GiB / core):

  * 3200 MHz;
  * DDR4.

* Local storage: 460 GB boot device (SSD) plus 960 GB :ref:`'/scratch' temporary storage<scratch_dir>` (SSD).
* GPUs: 2x `NVIDIA H100 <https://www.nvidia.com/en-gb/data-center/h100/>`__, each with:

  * PCIe connectivity (NB 3-4x *less* bandwidth than NVLink for inter-GPU comms)
  * 80GB memory (HBM2e).

.. _Dell PowerEdge XE8545: https://www.delltechnologies.com/asset/en-id/products/servers/technical-support/dell-emc-poweredge-xe8545-spec-sheet.pdf
.. _Dell PowerEdge R7525: https://i.dell.com/sites/csdocuments/Product_Docs/en/PowerEdge-R7525-Spec-Sheet.pdf
.. _Hyperthreading:  https://en.wikipedia.org/wiki/Hyper-threading
.. _AMD EPYC 7413: https://www.amd.com/en/products/cpu/amd-epyc-7413
.. _NVIDIA A100: https://www.nvidia.com/en-gb/data-center/a100/
.. _Zen 3: https://en.wikipedia.org/wiki/Zen_3

Non-worker nodes
----------------

* Two login nodes (for resilience).
* Other nodes to provide:

  * Lustre parallel filesystem.
  * Slurm scheduler 'head' nodes.

Total capacity
--------------

With all workers including GPU and large memory nodes:

* Worker nodes: 204.
* CPU cores: 12608.

  * Intel Cores: 11264.
  * AMD Cores: 1344.
  
* Total memory:  90112 GiB.
* GPUs: 76.
* Fast network filesystem (`Lustre`_):  2 PiB.

.. _Lustre:  http://lustre.org/
