.. _cuda_bessemer:

CUDA
====

CUDA (*Compute Unified Device Architecture*)
is a parallel computing platform and application programming interface (API) model
created by NVIDIA.
It allows software developers to use a CUDA-enabled graphics processing unit (GPU)
for general purpose processing,
an approach known as *General Purpose GPU* (GPGPU) computing.

Usage
-----

You need to first request one or more GPUs within an
:ref:`interactive session or batch job on a worker node <submit_interactive_bessemer>`.

To request say three unspecified public GPUs for a batch job
you would include *all* the following in the header of your submission script: ::

   #SBATCH --partition=gpu
   #SBATCH --qos=gpu
   #SBATCH --nodes=1
   #SBATCH --gpus-per-node=3

.. .. note:: See :ref:`GPUComputing_bessemer` for more information on how to request a GPU-enabled node for an interactive session or job submission.

You then need to ensure a version of the CUDA library (and compiler) is loaded.
As with much software installed on the cluster,
versions of CUDA are activated via the :ref:`'module load' command<env_modules>`.

To load *just* CUDA 10.2 plus the :ref:`GCC <gcc_bessemer>` 8.3 compiler: ::

   module load CUDA/10.2.89-GCC-8.3.0

To load CUDA 10.1 plus 
the :ref:`GCC <gcc_bessemer>` 8.x compiler, OpenMPI, OpenBLAS, SCALAPACK and FFTW: ::

   module load fosscuda/2019b  # includes GCC 8.3
   module load fosscuda/2019a   # includes GCC 8.2 

To load *just* CUDA 10.1 and :ref:`GCC <gcc_bessemer>` 8.x: ::

   module load CUDA/10.1.243-GCC-8.3.0  # subset of the fosscuda-2019b toolchain
   module load CUDA/10.1.105-GCC-8.2.0-2.31.1  # subset of the fosscuda-2019a toolchain

To load *just* CUDA 10.0: ::

    module load CUDA/10.0.130

Confirm which version of CUDA you are using via ``nvcc --version`` e.g.: ::

   $ nvcc --version
   nvcc: NVIDIA (R) Cuda compiler driver
   Copyright (c) 2005-2019 NVIDIA Corporation
   Built on Fri_Feb__8_19:08:17_PST_2019
   Cuda compilation tools, release 10.1, V10.1.105

Compiling a simple CUDA program
-------------------------------

An example of the use of ``nvcc`` (the CUDA compiler): ::

   nvcc filename.cu

will compile the CUDA program contained in the file ``filename.cu``.

Compiling the sample programs
-----------------------------

You do not need to be using a GPU-enabled node
to compile the sample programs
but you do need at least one GPU to run them.

In this demonstration, we create a batch job that

#. Requests two GPUs, a single CPU core and 8GB RAM
#. Loads a module to provide CUDA 10.1
#. Downloads compatible NVIDIA CUDA sample programs
#. Compiles and runs an example that performs a matrix multiplication

.. code-block:: sh

   #!/bin/bash
   #SBATCH --partition=gpu
   #SBATCH --qos=gpu
   #SBATCH --nodes=1
   #SBATCH --gpus-per-node=2     # Number of GPUs (per node)
   #SBATCH --mem=8G
   #SBATCH --time=0-00:05        # time (DD-HH:MM)
   #SBATCH --job-name=gputest

   module load fosscuda/2019a  # provides CUDA 10.1

   mkdir -p $HOME/examples
   cd $HOME/examples
   if ! [[ -f cuda-samples/.git ]]; then
       git clone https://github.com/NVIDIA/cuda-samples.git cuda-samples
   fi
   cd cuda-samples
   git checkout tags/10.1.1  # use sample programs compatible with CUDA 10.1
   cd Samples/matrixMul
   make
   ./matrixMul

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
I.e. ``-gencode=arch=compute_70,code=sm_70`` specifies a virtual architecture of ``compute_70`` and real architecture ``sm_70``.

To support future hardware of higher compute capability,
an additional ``-gencode`` argument can be used to enable Just in Time (JIT) compilation of embedded intermediate PTX code.
This argument should use the highest virtual architecture specified in other gencode arguments
for both the ``arch`` and ``code``
i.e. ``-gencode=arch=compute_70,code=compute_70``.

The minimum specified virtual architecture must be less than or equal to the `Compute Capability <https://developer.nvidia.com/cuda-gpus>`_ of the GPU used to execute the code.

Public and private GPU nodes in Bessemer contain Tesla V100 GPUs, which are compute capability 70.
To build a CUDA application which targets just the public GPUS nodes, use the following ``-gencode`` arguments:

.. code-block:: sh

   nvcc filename.cu \
      -gencode=arch=compute_70,code=sm_70 \
      -gencode=arch=compute_70,code=compute_70 \

Further details of these compiler flags can be found in the `NVCC Documentation <https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#options-for-steering-gpu-code-generation>`_,
along with details of the supported `virtual architectures <https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#virtual-architecture-feature-list>`_ and `real architectures <https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#gpu-feature-list>`_.

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

`GPUComputing@sheffield <http://gpucomputing.shef.ac.uk>`_ provides
a self-paced `introduction to CUDA <http://gpucomputing.shef.ac.uk/education/cuda/>`_ training course.

Determining the NVIDIA Driver version
-------------------------------------

Run the command:

.. code-block:: sh

   cat /proc/driver/nvidia/version

Example output is: ::

   NVRM version: NVIDIA UNIX x86_64 Kernel Module  418.67  Sat Apr  6 03:07:24 CDT 2019
   GCC version:  gcc version 4.8.5 20150623 (Red Hat 4.8.5-36) (GCC)

Installation notes
------------------

These are primarily for system administrators.

Device driver
^^^^^^^^^^^^^

The NVIDIA device driver is installed and configured using the ``gpu-nvidia-driver`` systemd service (managed by puppet).
This service runs ``/usr/local/scripts/gpu-nvidia-driver.sh`` at boot time to:

- Check the device driver version and uninstall it then reinstall the target version if required;
- Load the ``nvidia`` kernel module;
- Create several *device nodes* in ``/dev/``.

CUDA 10.1
^^^^^^^^^

Installed as a dependency of the ``fosscuda-2019a`` easyconfig.

Inter-GPU performance was tested on all 4x V100 devices in ``bessemer-node026`` (no NVLINK)
using `nccl-tests <https://github.com/NVIDIA/nccl-tests>`__ and ``NCCL/2.4.2-gcccuda-2019a``.
``nccl-tests`` was run using ``./build/all_reduce_perf -b 8 -e 128M -f 2 -g 4``

Results: ::


   # nThread 1 nGpus 4 minBytes 8 maxBytes 134217728 step: 2(factor) warmup iters: 5 iters: 20 validation: 1
   #
   # Using devices
   #   Rank  0 Pid  31823 on bessemer-node026 device  0 [0x3d] Tesla V100-PCIE-32GB
   #   Rank  1 Pid  31823 on bessemer-node026 device  1 [0x3e] Tesla V100-PCIE-32GB
   #   Rank  2 Pid  31823 on bessemer-node026 device  2 [0x3f] Tesla V100-PCIE-32GB
   #   Rank  3 Pid  31823 on bessemer-node026 device  3 [0x40] Tesla V100-PCIE-32GB
   #
   #                                                     out-of-place                       in-place
   #       size         count    type   redop     time   algbw   busbw  error     time   algbw   busbw  error
   #        (B)    (elements)                     (us)  (GB/s)  (GB/s)            (us)  (GB/s)  (GB/s)
              8             2   float     sum    16.36    0.00    0.00  1e-07    15.99    0.00    0.00  0e+00
             16             4   float     sum    183.5    0.00    0.00  3e-08    16.04    0.00    0.00  3e-08
             32             8   float     sum    15.99    0.00    0.00  3e-08    15.93    0.00    0.00  3e-08
             64            16   float     sum    16.13    0.00    0.01  3e-08    16.12    0.00    0.01  3e-08
            128            32   float     sum    255.5    0.00    0.00  3e-08    16.10    0.01    0.01  3e-08
            256            64   float     sum    16.23    0.02    0.02  3e-08    16.15    0.02    0.02  3e-08
            512           128   float     sum    16.13    0.03    0.05  3e-08    16.08    0.03    0.05  1e-08
           1024           256   float     sum    16.08    0.06    0.10  1e-07    16.28    0.06    0.09  1e-07
           2048           512   float     sum    16.44    0.12    0.19  1e-07    16.15    0.13    0.19  1e-07
           4096          1024   float     sum    16.41    0.25    0.37  2e-07    16.38    0.25    0.37  2e-07
           8192          2048   float     sum    16.56    0.49    0.74  2e-07    16.22    0.51    0.76  2e-07
          16384          4096   float     sum    19.62    0.84    1.25  2e-07    18.78    0.87    1.31  2e-07
          32768          8192   float     sum    29.21    1.12    1.68  2e-07    27.23    1.20    1.80  2e-07
          65536         16384   float     sum    46.77    1.40    2.10  2e-07    43.66    1.50    2.25  2e-07
         131072         32768   float     sum    51.53    2.54    3.82  2e-07    50.77    2.58    3.87  2e-07
         262144         65536   float     sum    67.61    3.88    5.82  2e-07    67.61    3.88    5.82  2e-07
         524288        131072   float     sum    100.3    5.23    7.84  2e-07    100.3    5.23    7.84  2e-07
        1048576        262144   float     sum    165.5    6.33    9.50  2e-07    165.1    6.35    9.52  2e-07
        2097152        524288   float     sum    301.1    6.96   10.45  2e-07    299.6    7.00   10.50  2e-07
        4194304       1048576   float     sum    588.3    7.13   10.69  2e-07    583.7    7.19   10.78  2e-07
        8388608       2097152   float     sum   1141.4    7.35   11.02  2e-07   1133.3    7.40   11.10  2e-07
       16777216       4194304   float     sum   2269.2    7.39   11.09  2e-07   2256.6    7.43   11.15  2e-07
       33554432       8388608   float     sum   4510.3    7.44   11.16  2e-07   4497.0    7.46   11.19  2e-07
       67108864      16777216   float     sum   9013.1    7.45   11.17  2e-07   8998.9    7.46   11.19  2e-07
      134217728      33554432   float     sum    18003    7.46   11.18  2e-07    17974    7.47   11.20  2e-07
   # Out of bounds values : 0 OK
   # Avg bus bandwidth    : 4.42606
   #

CUDA 10.0
^^^^^^^^^

Explicitly installed via the EasyBuild-provided ``CUDA/10.0.130`` easyconfig.
