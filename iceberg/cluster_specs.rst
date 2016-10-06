.. _cluster-specs:

Iceberg specifications
======================

+ Total CPUs: 3440 cores
+ Total GPUs: 16 units
+ Total Memory: 31.8 TBytes
+ Permanent Filestore: 45 TBytes
+ Temporary Filestore: 260 TBytes
+ Physical size: 8 Racks
+ Maximum Power Consumption: 83.7 KWatts
+ All nodes are connected via fast infiniband.

For reliability, there are two iceberg head-nodes
'for logging in' configured to take over from each other
in case of hardware failure.

Worker Nodes CPU Specifications
-------------------------------

Intel Ivybridge based nodes


+ 92 nodes, each with 16 cores and 64 GB of total memory (i.e. 4 GB
  per core).
+ 4 nodes, each with 16 cores and 256 GB of total memory (i.e. 16GB
  per core).
+ Each node uses2 of Intel E5 2650V2 8-core processors (hence 2*8=16
  cores).
+ Scratch space on local disk of on each node is 400 GB


Intel Westmere based nodes


+ 103 nodes, each with 12 cores and 24 GB of total memory ( i.e. 2 GB
  per core )
+ 4 nodes with 12 cores and 48 GB of total memory ( i.e. 4GB per core
  )
+ Each node uses 2 of Intel X5650 6-core processors ( hence 2*6=12
  cores )


GPU Units Specifications
------------------------

8 Nvidia Tesla Kepler K40Ms GPU units


* Each GPU unit contains 2880 thread processor cores
* Each GPU unit has 12GB of GDR memory. Hence total GPU memory is
  8*12=96 GB
* Each GPU unit is capable of about 4.3TFlop of single precision
  floating point performance, or 1.4TFlops at double precision.

8 Nvidia Tesla Fermi M2070s GPU units

* Each GPU unit contains 448 thread processor cores
* Each GPU unit contains 6GB of GDR memory. Hence total GPU memory is
  8*6=48 GB
* Each GPU unit is capable of about 1TFlop of single precision
  floating point performance, or 0.5TFlops at double precision.

Software and Operating System
-----------------------------

Users normally log into a head node and then use one (or more) of the
worker nodes to run their jobs on. Scheduling of users' jobs on the
worker nodes are managed by the 'Sun Grid Engine' software. Jobs can
be run interactively ( qsh ) or submitted as batch jobs ( qsub ).


+ The operating system is 64-bit Scientific Linux (which is Redhat
  based) on all nodes
+ The Sun Grid Engine for batch and interactive job scheduling
+ Many Applications, Compilers, Libraries and Parallel Processing
  Tools. See :ref:`iceberg-software`
