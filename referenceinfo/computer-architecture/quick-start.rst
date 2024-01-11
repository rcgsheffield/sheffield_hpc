.. _general_computer_architecture_quickstart:

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

General Computer Architecture Quick Start 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This page details the parts of a modern computer and their connectivity that 
we need to understand to apply to running jobs on a HPC cluster.

.. important::

    These descriptions are drastically simplified in order to give a basic 
    overview which users can use to better understand requesting cluster 
    resources.

-----

Computer architecture as a concept
**********************************

Before discussing aspects of "computer architecture" we must first define what this means. In short:

    Computer architecture refers to how a computer system is designed and what technologies 
    it is compatible with.

This can also be roughly subdivided into, system (physical) design, instruction set architecture and 
microarchitecture. 

.. tip::

    Further info on these subdivisions can be found at the following link: 
    https://online.sunderland.ac.uk/what-is-computer-architecture/

-----


Physical architecture
*********************

Physical architecture refers to the real physical components and structures used by computers.

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/cpu.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/cpu-cache.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/core.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/cpu-socket.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/motherboard.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/system-buses.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/memory-slot.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/memory.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/memory-bus.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/pcie-bus.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/pcie-slot.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/gpu.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/CPU-microarchitecture.rst
    
-----

Virtual architecture
********************

In this case, virtual architecture refers to the virtual components, concepts or structures used by computers.

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/threads-hyperthreading.rst

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/virtual-memory.rst

.. _instruction_sets:

.. raw:: html

    <hr class="hr-mid-section-separator-dashed">

.. include:: ../imports/computer-architecture/instruction-sets.rst
    

