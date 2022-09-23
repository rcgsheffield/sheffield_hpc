.. _sharc-specs:

ShARC specifications
======================

Total capacity
--------------

* Worker nodes: 121
* CPU cores: 2024
* Total memory: 12160 GiB
* GPUs: 40
* Fast network filesystem (`Lustre <http://lustre.org/>`_): 669 TiB

Note that some of these resources have been purchased by research groups who have exclusive access to them.

.. _sharc-cpu-specs:

General CPU node specifications
-------------------------------

98 nodes are publicly available (not exclusive to research groups).

* Machine: `Dell PowerEdge C6320`_
* CPUs: 2 x `Intel Xeon E5-2630 v3`_

  * `Haswell`_ processor microarchitecture;
  * 2.40 GHz;
  * Support for `AVX2`_ vectorisation instructions (simultaneously apply the same operation to multiple values in hardware);
  * Support for `Fused Multiply-Add`_ instructions (expedites operations involving the accummulation of products e.g. matrix multiplication).
  * `Hyperthreading <https://en.wikipedia.org/wiki/Hyper-threading>`_ is disabled on all nodes bar four that are reserved for interactive jobs.

* RAM: 64 GB (i.e. 4 GiB / core)

  * 1866 MHz;
  * DDR4.

* Local storage: 1 TiB SATA III HDD

  * ``/scratch``: 836 GiB of temporary storage;
  * ``/tmp``: 16 GiB of temporary storage.

Large memory node specifications
--------------------------------

Ten nodes are publicly available (not exclusive to research groups).

These are similar to the general :ref:`CPU nodes <sharc-cpu-specs>` but with some differences in terms of CPU model, CPU core count and total RAM:

* 2x nodes with Intel Xeon E5-2630 v3 CPU (2.40GHz), 16 CPU cores total (8 per socket) and 256 GB RAM
* 7x nodes with 2x Intel Xeon E5-2640 v4 CPU (2.40GHz) processors, 20 CPU cores total (10 per socket) and 256 GB RAM
* 1x node with 2x Intel Gold 5120 CPU (2.20GHz) processors, 28 CPU cores total (14 per socket) and 384 GB RAM

.. _sharc-gpu-specs:

GPU node specifications
-----------------------

Two nodes are publicly available (not exclusive to research groups):

* Machine: `Dell PowerEdge C4130`_
* CPUs: 2 x Intel Xeon E5-2630 v3 (2.40GHz)
* RAM: 64 GB (i.e. 4 GiB / core); 1866 MHz; DDR4
* Local storage: 800 GiB SATA SSD
* GPUs: 8 x `NVIDIA Tesla K80`_ (4x dual-GPU accelerators)

  * 12 GiB of GDDR5 memory per GPU (24 GiB per accelerator; 96 GiB per node)
  * Up to 1.46 Teraflops of double precision performance with NVIDIA GPU Boost per GPU (2.91 TFLOPS per accelerator)
  * Up to 4.37 Teraflops of single precision performance with NVIDIA GPU Boost per GPU (8.74 TFLOPS per accelerator)

Hardware-accellerated visualisation nodes
-----------------------------------------

One node is publicly available:

* Machine: `Dell Precision Rack 7910`_
* CPUs: 2 x Intel Xeon E5-2630 v3 (2.40GHz)
* RAM: 128 GiB (i.e. 8 GiB / core); 1866 MHz; DDR4
* Local storage: 1 TiB
* Graphics cards: 2x Quadro K4200

  * Memory: 4 GiB GDDR5 SDRAM



Networking
----------

.. _sharc-network-specs:

* Intel OmniPath Architecture (OPA) (100 Gb/s) to all public nodes
* Gigabit Ethernet

Operating System and software
-----------------------------

* OS: Centos 7.x (binary compatible with RedHat Enterprise Linux 7.x) on all nodes
* Interactive and batch job scheduling software: Son of Grid Engine
* Many applications, compilers, libraries and parallel processing tools. See :ref:`sharc-software`

Non-worker nodes
----------------

* Two login nodes (for resilience)
* Other nodes to provide:

  * Lustre parallel filesystem
  * Son of Grid Engine scheduler 'head' nodes
  * Directory services

.. _AVX2: https://en.wikipedia.org/wiki/Advanced_Vector_Extensions#Advanced_Vector_Extensions_2
.. _Dell PowerEdge C4130: http://www.dell.com/uk/business/p/poweredge-c4130/pd
.. _Dell PowerEdge C6320: http://www.dell.com/uk/business/p/poweredge-c6320/pd
.. _Dell Precision Rack 7910: http://www.dell.com/uk/business/p/precision-r7910-workstation/pd?oc=cu000pr7910mufws_
.. _Fused Multiply-Add: https://en.wikipedia.org/wiki/Multiply%E2%80%93accumulate_operation#Fused_multiply.E2.80.93add
.. _Haswell: https://en.wikipedia.org/wiki/Haswell_(microarchitecture)
.. _Intel Xeon E5-2630 v3: http://ark.intel.com/products/83356/Intel-Xeon-Processor-E5-2630-v3-20M-Cache-2_40-GHz
.. _NVIDIA Tesla K80: http://www.nvidia.com/object/tesla-servers.html

.. nnodes ``qhost | grep -c 'sharc-'``
.. ncores ``qhost | awk 'FNR > 3 {sum += $3} END {print sum}'``
.. totmem ``for node in $(qhost | awk '/sharc-/ {print $1}'); do qconf -se $node | egrep -o 'h_vmem=[0-9]*[^MGT]'; done | awk -F '=' '{sum += $2} END {print sum}'``
.. ngpus ``for node in $(qhost -F gpu | grep 'gpu=' -B1 | awk '/sharc-/ {print $1}'); do qconf -se $node | egrep -o 'gpu=[0-9]*'; done | awk -F '=' '{sum += $2} END {print sum}'``
.. lustresize ``df -h --output=size /mnt/fastdata/ | tail -1``
