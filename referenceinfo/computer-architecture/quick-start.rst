.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

Quick Start on general computer architecture
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This page details the parts of a modern computer and their connectivity that 
we need to understand to apply to running jobs on a HPC cluster.

.. important::

    These descriptions are drastically simplified in order to give a basic 
    overview which users can use to better understand requesting cluster 
    resources.

-----

Physical architecture
***************************

``CPU``

A central processing unit (CPU), the most common processing device in a computer which performs calculations in order to run applications and coordinate work with other components. Also known as a microprocessor.

``Core``

A CPU core or processor core is a single subprocessing unit capable of one task at a time. Modern CPUs are made of multiple processor cores which share system memory.

``Socket``

A physical socket on a motherboard in which a CPU is inserted. Physical sockets are usually connected to their own groups of memory slots.

``Motherboard``

A motherboard is the main electronic board in which computer components reside and connect to one another. They contain one or more sockets, memory slots, PCIe slots and buses.

``System bus / buses``

A system bus or motherboard bus is a physical pathway of electronic circuits which enable discrete components within a computer to communicate with one another via the motherboard.

``Memory slot``

A memory slot is a physical slot in which physical memory sticks are inserted to provide the system memory.

``Memory``

Memory or system memory is a computer's low latency, extremely high bandwidth short term data storage. It is used to store the data which the CPU currently requires to perform the computations to run applications.

``Memory Bus``

This is the communication bus between system memory and a Socket/CPU.

``PCI or PCIe slot``

A physical slot on the motherboard in which additional compatible components like a GPU can be inserted to connect with the PCIe Bus.

``PCI or PCIe Bus``

A communication bus between a Socket/CPU and input/output controllers connected to storage such as hard drives or solid state disks, network adaptors, GPUs or other compatible devices.

``GPU``

A graphical processing unit (GPU) is the second most common processing unit in a computer which is designed to perform specific graphical calculations very quickly and is normally used to drive a computer's displays. 
These are commonly connected via a PCIe slot and bus. More recently GPUs have been used to perform the same kinda of graphical calculations but for other purposes such as AI or machine learning.

-----

Virtual architecture
***************************

``Threads / Hyperthreading``

A modern CPU core can normally execute 2 threads, or conceptually, 2 flows of instructions at the same time for additional performance. This is called hyperthreading. 
Performance improvements are usually modest but hyperthreading can decrease performance for some programs. Hyperthreading is disabled on the University of Sheffield HPC clusters.

.. tip::

    Multiple threads running on one core can be thought of like a single human (core) using both hands (two threads) to complete tasks. Simple tasks like carrying and moving items can be completed quicker by moving more items at 
    once. More complex tasks like throwing darts accurately could be detrimentally affected by attempting to do so with both hands at the same time.

``Virtual memory``
    


