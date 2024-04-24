.. _bede:

Bede (Tier 2 GPU cluster)
=========================

Bede is a `EPSRC-funded <https://gow.epsrc.ukri.org/NGBOViewGrant.aspx?GrantRef=EP/T022167/1>`__ 'Tier 2' (regional) GPU-equipped HPC cluster.  
The system is available for use by researchers from `N8 Research Partnership`_ institutions
(Durham, Lancaster, Leeds, Liverpool, Manchester, Newcastle, Sheffield and York).

NB the system was previously known as NICE-19.

Suitable workflows
------------------

This system is particularly well suited to supporting:
 
* **Jobs that benefit from distributing work between  multiple GPUs and possibly multiple nodes**.
* **Jobs that require much movement of data between CPU and GPU memory**.
* In particular **deep learning and machine learning workflows** that meet either of the above criteria.

Status
------

Academics/researchers can apply for access to the system (see `Further Information`_)
but note that some aspects of the system plus the registration and support mechanisms are still being refined.

Noteworthy features of the system
---------------------------------

* 32x GPU nodes (`IBM AC922`_ nodes) each with 

  * 2x IBM POWER9_ CPUs 
  * 2x `NVIDIA V100`_ GPUs per CPU
  * Each CPU is connected to its two GPUs via high-bandwidth, low-latency interconnects (NVLink), which helps if you need to move lots of data to/from GPU memory
  * 512 GB RAM

* 4x 'inference' nodes (`IBM IC922`_ nodes) each with

  * 2x IBM POWER9_ CPUs 
  * 4x `NVIDIA T4`_ GPUs
  * 256 GB RAM

* High-bandwidth, low-latency networking between nodes (100 Gb/s EDR Infiniband)
* High-performance parallel file system (Lustre)
* Slurm job scheduler
* Installed software

  * IBM Watson Machine Learning Community Edition

    * Includes Conda packages for helping transparently distribute Deep Learning training and inference tasks 
      over multiple GPUs and/or nodes 
      when using e.g. TensorFlow, IBM Caffe and Pytorch.
    * Includes conda packages for accelerating the training of generalized linear models 
      (e.g. in scikit-learn and Apache Spark) using GPUs and multiple nodes

  * Standard GNU toolkit via the IBM Advanced Toolchain for Linux

    * Inc. IBM-optimised GNU compilers, BLAS/LAPACK, glibc, gdb, valgrind, itrace, Boost, Python, Go and more

  * NVIDIA profilers and debuggers

Further information
-------------------

See the `N8 CIR's Bede site <https://n8cir.org.uk/supporting-research/facilities/bede/>`__ for:

* Documentation on how to use the system
* Information on per-institution RSE support (including the contact for Sheffield)
* How to register a project
* Hardware specifications
* Available software
* How to acknowledge Bede and the N8 CIR in publications
* Bede and N8 CIR logos 

Please contact ``tier-2-hpc-support-group@sheffield.ac.uk`` if you have any questions regarding Bede in general and the application process.

.. _IBM AC922: https://www.ibm.com/uk-en/marketplace/power-systems-ac922
.. _IBM IC922: https://www.ibm.com/uk-en/marketplace/power-system-ic922
.. _N8 CIR logo: https://n8cir.org.uk/about/n8-cir-logo/
.. _N8 Research Partnership: https://www.n8research.org.uk/
.. _NVIDIA T4: https://www.nvidia.com/en-gb/data-center/tesla-t4/
.. _NVIDIA V100: https://www.nvidia.com/en-us/data-center/v100/
.. _POWER9: https://www.ibm.com/uk-en/it-infrastructure/power/power9
