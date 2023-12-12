.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _cuda_sharc:

CUDA
====

CUDA (*Compute Unified Device Architecture*) 
is a parallel computing platform and application programming interface (API) model created by NVIDIA.
It allows software developers to use a CUDA-enabled graphics processing unit (GPU) for general purpose processing, 
an approach known as *General Purpose GPU* (GPGPU) computing.

Usage
-----

You need to first request one or more GPUs within an :ref:`interactive session or batch job on a worker node <submit_batch_sharc>`.  
For example, to request a single GPU for an interactive session on a worker node: ::

   qrshx -l gpu=1

.. note:: See :ref:`GPUComputing_sharc` for more information on how to request a GPU-enabled node for an interactive session or job submission. 

You then need to load a version of the CUDA library (and compiler).
There are several versions of the CUDA library available. 
As with much software installed on the cluster, 
versions of CUDA are activated via the :ref:`'module load' command<env_modules>`: ::

   module load libs/CUDA/11.3.0/binary
   module load libs/CUDA/11.2.0/binary
   module load libs/CUDA/11.1.1/binary
   module load libs/CUDA/11.0.2/binary
   module load libs/CUDA/10.2.89/binary
   module load libs/CUDA/10.1.243/binary
   module load libs/CUDA/10.0.130/binary
   module load libs/CUDA/9.1.85/binary
   module load libs/CUDA/9.0.176/binary
   module load libs/CUDA/8.0.44/binary
   module load libs/CUDA/7.5.18/binary

To then confirm which version of CUDA you are using:

.. code-block:: console

   nvcc: NVIDIA (R) Cuda compiler driver
   Copyright (c) 2005-2020 NVIDIA Corporation
   Built on Mon_Oct_12_20:09:46_PDT_2020
   Cuda compilation tools, release 11.1, V11.1.105
   Build cuda_11.1.TC455_06.29190527_0

**Important** To compile CUDA programs you also need a compatible version of the :ref:`GCC compiler <gcc_sharc>`:

* CUDA 7.x and 8.x: GCC >= 4.7.0 (to allow for the use of c++11 features) and < 5.0.0
* CUDA 9.x: GCC < 7.0.0

Compiling a simple CUDA program
-------------------------------

An example of the use of ``nvcc`` (the CUDA compiler): ::

   nvcc filename.cu

will compile the CUDA program contained in the file ``filename.cu``.

Compiling the sample programs
-----------------------------

You do not need to be using a GPU-enabled node to compile the sample programs but you do need a GPU to run them.

In a ``qrshx`` session:

.. code-block:: sh

   # Load modules
   module load libs/CUDA/11.3.0/binary

   # Copy CUDA samples to a local directory
   # It will create a directory called NVIDIA_CUDA-11.3_Samples/
   mkdir cuda_samples
   cd cuda_samples
   cp -r $CUDA_SDK .

   # Compile
   cd NVIDIA_CUDA-11.3_Samples/1_Utilities/deviceQuery
   make

The ``make`` command then runs the ``nvcc`` CUDA compiler and
generates a binary executable that you can then run on a node with
an NVIDIA GPU installed.

A basic test is to run the resulting binary, ``deviceQuery`` on a GPU equipped node to show the GPU 
characteristics.

GPU Code Generation Options
---------------------------

To achieve the best possible performance whilst being portable, 
GPU code should be generated for the architecture(s) it will be executed upon.

This is controlled by specifying ``-gencode`` arguments to NVCC which, 
unlike the ``-arch`` and ``-code`` arguments, 
allows for 'fatbinary' executables that are optimised for multiple device architectures.

Each ``-gencode`` argument requires two values, 
the *virtual architecture* and *real architecture*, 
for use in NVCC's `two-stage compilation <https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#virtual-architectures>`_.
I.e. ``-gencode=arch=compute_60,code=sm_60`` specifies a virtual architecture of ``compute_60`` and real architecture ``sm_60``.

To support future hardware of higher compute capability, 
an additional ``-gencode`` argument can be used to enable Just in Time (JIT) compilation of embedded intermediate PTX code. 
This argument should use the highest virtual architecture specified in other gencode arguments 
for both the ``arch`` and ``code``
i.e. ``-gencode=arch=compute_60,code=compute_60``.

The minimum specified virtual architecture must be less than or equal to the `Compute Capability <https://developer.nvidia.com/cuda-gpus>`_ of the GPU used to execute the code.

Public GPU nodes in ShARC contain Tesla K80 GPUs, which are compute capability 37.
To build a CUDA application which targets the public GPUS nodes, use the following ``-gencode`` arguments: ::

   nvcc filename.cu \
      -gencode=arch=compute_37,code=sm_37 \
      -gencode=arch=compute_37,code=compute_37

ShARC also contains Tesla P100 GPUs and Tesla V100 GPUs in private nodes,
which are compute capability 60 and 70 respectively.
To build a CUDA application which targets any GPU on ShARC (either public or private), 
use the following ``-gencode`` arguments (for CUDA 9.0 and above): ::

   nvcc filename.cu \
      -gencode=arch=compute_37,code=sm_37 \
      -gencode=arch=compute_60,code=sm_60 \
      -gencode=arch=compute_70,code=sm_70 \
      -gencode=arch=compute_70,code=compute_70


Further details of these compiler flags can be found in the `NVCC Documentation <https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#options-for-steering-gpu-code-generation>`_, 
along with details of the supported `virtual architectures <https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#virtual-architecture-feature-list>`_ and `real architectures <https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#gpu-feature-list>`_.

.. note:: SM 60 for Pascal GPUs is only available for CUDA 8.0 and above.

.. note:: SM 70 for Volta GPUs is only available for CUDA 9.0 and above.

Documentation
-------------

* `CUDA Toolkit Documentation <https://docs.nvidia.com/cuda/index.html#axzz3uLoSltnh>`_
* `The power of C++11 in CUDA 7 <http://devblogs.nvidia.com/parallelforall/power-cpp11-cuda-7/>`_

Profiling using nvprof
----------------------

Prior to September 2020 ``nvprof``, NVIDIA's CUDA profiler, could write its `SQLite <https://www.sqlite.org/>`__ database outputs to the ``/fastdata`` filesystem.
This was because SQLite requires a filesystem that supports file locking
but file locking was not previously enabled on the (`Lustre <http://lustre.org/>`__) filesystem mounted on ``/fastdata``.

``nvprof`` can now write output data to any user-accessible filesystem including ``/fastdata``.

CUDA Training
-------------

The Research Software Engineering team have developed an undergraduate teaching module on CUDA;
`lecture notes and lecture recordings for that module are accessible here <https://rse.shef.ac.uk/training/com4521>`_ for anyone with a University account. 

Determining the NVIDIA Driver version
-------------------------------------

Run the command: ::

   cat /proc/driver/nvidia/version

Example output is: ::

   NVRM version: NVIDIA UNIX x86_64 Kernel Module  460.32.03  Sun Dec 27 19:00:34 UTC 2020
   GCC version:  gcc version 4.8.5 20150623 (Red Hat 4.8.5-44) (GCC) 

Installation notes
------------------

These are primarily for system administrators.

Device driver
^^^^^^^^^^^^^

The NVIDIA device driver is installed and configured using the ``gpu-nvidia-driver`` systemd service (managed by Puppet).
This service runs ``/usr/local/scripts/gpu-nvidia-driver.sh`` at boot time to:

- Check the device driver version and uninstall it then reinstall the target version if required;
- Load the ``nvidia`` kernel module;
- Create several *device nodes* in ``/dev/``.

CUDA 11.3.0
^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``11.3.0_465.19.01`` as the sole argument. 
#. :download:`Modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/11.3.0/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/11.3.0/binary``


CUDA 11.2.0
^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``11.2.0_460.27.04`` as the sole argument. 
#. :download:`Modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/11.2.0/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/11.2.0/binary``

CUDA 11.1.1
^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``11.1.1_455.32.00`` as the sole argument. 
#. :download:`Modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/11.1.1/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/11.1.1/binary``

CUDA 11.0.2
^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``11.0.2_450.51.05`` as the sole argument. 
#. :download:`Modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/11.0.2/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/11.0.2/binary``

CUDA 10.2.89
^^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``10.2.89_440.33.01`` as the sole argument. 
#. :download:`Modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/10.2.89/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/10.2.89/binary``

CUDA 10.1.243
^^^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``10.1.243_418.87.00`` as the sole argument. 
#. :download:`Modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/10.1.243/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/10.1.243/binary``

CUDA 10.0.130
^^^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``10.0.130_410.48`` as the sole argument. 
   This installs the toolkit and three NVIDIA-recommended patches.
#. :download:`Modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/10.0.130/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/10.0.130/binary``

CUDA 9.1.85
^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``9.1.85_387.26`` as the sole argument. 
   This installs the toolkit and three NVIDIA-recommended patches.
#. :download:`Modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/9.1.85/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/9.1.85/binary``

CUDA 9.0.176
^^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``9.0.176_384.81`` as the sole argument. 
   This installs the toolkit and four NVIDIA-recommended patches.
#. :download:`Modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/9.0.176/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/9.0.176/binary``

CUDA 8.0.44
^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``8.0.44`` as the sole argument.
#. :download:`This modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/8.0.44/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/8.0.44/binary``

CUDA 7.5.18
^^^^^^^^^^^

#. Installed with :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/CUDA/install.sh>` with ``7.5.18`` as the sole argument.
#. :download:`This modulefile </decommissioned/sharc/software/modulefiles/libs/CUDA/7.5.18/binary>` was installed as ``/usr/local/modulefiles/libs/CUDA/7.5.18/binary``

