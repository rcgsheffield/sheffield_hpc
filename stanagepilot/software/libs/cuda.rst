.. _cuda_stanage:

CUDA
====

CUDA (*Compute Unified Device Architecture*)
is a parallel computing platform and application programming interface (API) model
created by NVIDIA.
It allows software developers to use a CUDA-enabled graphics processing unit (GPU)
for general purpose processing,
an approach known as *General Purpose GPU* (GPGPU) computing.

---------

Usage
-----

You need to first request one or more GPUs within an
:ref:`interactive session or batch job on a worker node <submit_interactive_stanage>`.

To request three of any available public GPUs for a batch job
you would include *all* the following in the header of your submission script:

.. code-block:: sh

   #SBATCH --partition=gpu
   #SBATCH --qos=gpu
   #SBATCH --nodes=1
   #SBATCH --gres=gpu:3

.. note::

   See :ref:`gpu_computing_stanage` for more information on how to request a
   GPU-enabled node for an interactive session or job submission.

You then need to ensure a version of the CUDA library (and compiler) is loaded.
As with much software installed on the cluster,
versions of CUDA are activated via the :ref:`'module load' command<env_modules>`.

To load one of the currently available CUDA versions you can run
one of the following commands:

.. code-block:: bash

   module load CUDA/11.8.0
   module load CUDA/11.7.0

Unlike with :ref:`older versions of CUDA on Bessemer <cuda_bessemer>`
you will also need to explicitly load a compiler e.g. `GCC <gcc_stanage>`.

Confirm which version of CUDA you are using via ``nvcc --version`` e.g.: ::

   $ nvcc --version
   nvcc: NVIDIA (R) Cuda compiler driver
   Copyright (c) 2005-2022 NVIDIA Corporation
   Built on Wed_Sep_21_10:33:58_PDT_2022
   Cuda compilation tools, release 11.8, V11.8.89
   Build cuda_11.8.r11.8/compiler.31833905_0

---------

Compiling a simple CUDA program
-------------------------------

An example of the use of ``nvcc`` (the CUDA compiler): ::

   nvcc filename.cu

This will compile the CUDA program contained in the file ``filename.cu``.  

.. TODO: incorporate the following if install CUDA < 11 at some point.

   "'nvcc filename.cu' is correct, but will only work with CUDA >= 11.0 which introdcued SM 80.

   CUDA 11.0 Release Notes: https://docs.nvidia.com/cuda/archive/11.0_GA/cuda-toolkit-release-notes/index.html#cuda-general-new-features

   So may need to add a condition around that (if CUDA 10.x is avialable as suggested in Compiling the sample programs), where embedding PTX for 70 via -gencode=arch=compute_70,code=compute_70 would be the closest fit (but ideally everyone should use CUDA 11.0+ on these nodes).

---------

Compiling the sample programs
-----------------------------

You do not need to be using a GPU-enabled node
to compile the sample programs
but you do need at least one GPU to run them.

In this demonstration, we create a batch job that

#. Request one GPU, a single CPU core and 8GB RAM
#. Loads a module to provide CUDA 11.8
#. Downloads compatible NVIDIA CUDA sample programs
#. Compiles and runs an example that performs a matrix multiplication

.. code-block:: sh

   #!/bin/bash
   #SBATCH --partition=gpu
   #SBATCH --qos=gpu
   #SBATCH --gres=gpu:1         # Number of GPUs
   #SBATCH --mem=8G
   #SBATCH --time=0-00:05       # time (DD-HH:MM)
   #SBATCH --job-name=gputest

   module load CUDA/11.8.0

   mkdir -p $HOME/examples
   cd $HOME/examples
   if ! [[ -f cuda-samples/.git ]]; then
       git clone https://github.com/NVIDIA/cuda-samples.git cuda-samples
   fi
   cd cuda-samples
   git checkout tags/v11.6  # use sample programs compatible with CUDA 11.7
   cd Samples/0_Introduction/matrixMul/
   make SMS="80"
   ./matrixMul

---------

.. _stanage_gpu_code_gen_opts:

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
For example, ``-gencode=arch=compute_70,code=sm_70`` specifies a virtual architecture of ``compute_70`` and real architecture ``sm_70``.

To support future hardware of higher compute capability,
an additional ``-gencode`` argument can be used to enable Just in Time (JIT) compilation of embedded intermediate PTX code.
This argument should use the highest virtual architecture specified in other gencode arguments
for both the ``arch`` and ``code``
i.e. ``-gencode=arch=compute_80,code=compute_80``.

The minimum specified virtual architecture must be less than or equal to the `Compute Capability <https://developer.nvidia.com/cuda-gpus>`_ of the GPU used to execute the code.

At present, all GPUs in Stanage are NVIDIA Tesla A100 GPUs, which are Compute Capability 80.
To build a CUDA application which targets just A100 GPUs, use the following ``-gencode`` arguments:

.. code-block:: sh

   nvcc filename.cu \
      -gencode=arch=compute_80,code=sm_80 \
      -gencode=arch=compute_80,code=compute_80

Further details of these compiler flags can be found in the `NVCC Documentation <https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#options-for-steering-gpu-code-generation>`_,
along with details of the supported `virtual architectures <https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#virtual-architecture-feature-list>`_ and `real architectures <https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#gpu-feature-list>`_.

---------

Documentation
-------------

* `CUDA Toolkit Documentation <https://docs.nvidia.com/cuda/index.html#axzz3uLoSltnh>`_
* `The power of C++11 in CUDA 7 <http://devblogs.nvidia.com/parallelforall/power-cpp11-cuda-7/>`_

---------

Nsight Systems
--------------

Nsight Systems is a system-wide performance analysis tool designed to visualize an application’s algorithms and identify the largest opportunities to optimize. It supports Pascal (SM 60) and newer GPUs.

A common use-case for Nsight Systems is to generate application timelines via the command line, which can later be visualised on a local computer using the GUI component. Nsight Systems, ``nsys``, is provided by the following modules. ::

    module load CUDA/11.7.0

You should use a version of nsys that is at least as new as the CUDA toolkit used to compile your application (if appropriate).

To generate an application timeline with Nsight Systems CLI (nsys): ::

    nsys profile -o timeline ./myapplication <arguments>

Nsight systems can trace mulitple APIs, such as CUDA and OpenACC. The ``--trace`` argument to specify which APIs should be traced. See the `nsys profiling command switch options <https://docs.nvidia.com/nsight-systems/profiling/index.html#cli-profile-command-switch-options>`_ for further information. ::

    nsys profile -o timeline --trace cuda,nvtx,osrt,openacc ./myapplication <arguments>

Once this file has been downloaded to your local machine, it can be opened in ``nsys-ui``/``nsight-sys`` via File > Open > timeline.qdrep


Nsight Compute
--------------

Nsight Compute is a kernel profiler for CUDA applications, which can also be used for API debugging. It supports Volta (SM 70) and newer GPUs.

A common use-case for using Nsight Compute is to capture all available profiling metrics via the command line, which can later be analysed on a local computer using the GUI component. Nsight Compute, ``ncu``, is provided by the following modules. ::

    module load CUDA/11.7.0

You should use a versions of ``ncu`` that is at least as new as the CUDA toolkit used to compile your application.

To generate the default set of profile metrics with Nsight Compute CLI (``ncu``): ::

    ncu -o metrics ./myapplication <arguments>

Nsight compute can capture many different metrics which are used to generate the different sections of the profiling report. The ``--set`` argument can be used to control which set of metrics and sections are captured. See the `Nsight Compute CLI Command Line Options <https://docs.nvidia.com/nsight-compute/NsightComputeCli/index.html#command-line-options-profile>`_ for further information. ::

    ncu -o metrics --set full ./myapplication <arguments>

Once this file has been downloaded to your local machine, it can be opened in ``ncu-ui``/``nv-nsight-cu`` via File > Open File > metrics.ncu-rep

Profiling using nvprof
----------------------

nvprof is not supported on the GPUs in Stanage
(it `does not support NVIDIA architectures >= SM80 <https://docs.nvidia.com/cuda/profiler-users-guide/#changelog>`__);
please use Nsight Systems and Nsight Compute instead.

---------

CUDA Training
-------------

`GPUComputing@sheffield <http://gpucomputing.shef.ac.uk>`_ provides
a self-paced `introduction to CUDA <http://gpucomputing.shef.ac.uk/education/cuda/>`_ training course.

---------

Determining the NVIDIA Driver version
-------------------------------------

Run the command:

.. code-block:: sh

   cat /proc/driver/nvidia/version

Example output is: ::

   NVRM version: NVIDIA UNIX x86_64 Kernel Module  525.85.12  Sat Jan 28 02:10:06 UTC 2023
   GCC version:  gcc version 4.8.5 20150623 (Red Hat 4.8.5-44) (GCC)

---------

Installation notes
------------------

These are primarily for system administrators.

CUDA 11.8.0
^^^^^^^^^^^

Installed as a dependency of the ``cuDNN-8.6.0.163-CUDA-11.8.0.eb`` easyconfig.

Single GPU and compiler testing was conducted as above in the ``matrixMul`` batch job.

CUDA 11.7.0
^^^^^^^^^^^

Installed as a dependency of the ``cuDNN-8.4.1.50-CUDA-11.7.0.eb`` easyconfig.

Single GPU and compiler testing was conducted as above in the ``matrixMul`` batch job.

Inter-GPU performance was tested on all 4x A100 devices in ``gpu01``
using the `NCCL <https://github.com/NVIDIA/nccl-tests>`__ ``all_reduce_perf`` benchmark test
(provided by the ``NCCL-tests/2.13.6-GCC-11.3.0-CUDA-11.7.0`` module), which was run using: ::

   all_reduce_perf -b 8 -e 128M -f 2 -g 4

Results: ::

   # nThread 1 nGpus 4 minBytes 8 maxBytes 134217728 step: 2(factor) warmup iters: 5 iters: 20 agg iters: 1 validation: 1 graph: 0
   #
   # Using devices
   #  Rank  0 Group  0 Pid  29697 on      gpu01 device  0 [0x01] NVIDIA A100-SXM4-80GB
   #  Rank  1 Group  0 Pid  29697 on      gpu01 device  1 [0x41] NVIDIA A100-SXM4-80GB
   #  Rank  2 Group  0 Pid  29697 on      gpu01 device  2 [0x81] NVIDIA A100-SXM4-80GB
   #  Rank  3 Group  0 Pid  29697 on      gpu01 device  3 [0xc1] NVIDIA A100-SXM4-80GB
   #
   #                                                              out-of-place                       in-place
   #       size         count      type   redop    root     time   algbw   busbw #wrong     time   algbw   busbw #wrong
   #        (B)    (elements)                               (us)  (GB/s)  (GB/s)            (us)  (GB/s)  (GB/s)
              8             2     float     sum      -1    15.29    0.00    0.00      0    14.64    0.00    0.00      0
             16             4     float     sum      -1    14.72    0.00    0.00      0    14.96    0.00    0.00      0
             32             8     float     sum      -1    14.48    0.00    0.00      0    14.67    0.00    0.00      0
             64            16     float     sum      -1    15.52    0.00    0.01      0    14.51    0.00    0.01      0
            128            32     float     sum      -1    14.73    0.01    0.01      0    14.81    0.01    0.01      0
            256            64     float     sum      -1    14.85    0.02    0.03      0    14.20    0.02    0.03      0
            512           128     float     sum      -1    14.89    0.03    0.05      0    14.91    0.03    0.05      0
           1024           256     float     sum      -1    14.50    0.07    0.11      0    14.58    0.07    0.11      0
           2048           512     float     sum      -1    15.01    0.14    0.20      0    14.43    0.14    0.21      0
           4096          1024     float     sum      -1    14.75    0.28    0.42      0    15.19    0.27    0.40      0
           8192          2048     float     sum      -1    14.93    0.55    0.82      0    14.81    0.55    0.83      0
          16384          4096     float     sum      -1    16.29    1.01    1.51      0    15.35    1.07    1.60      0
          32768          8192     float     sum      -1    19.80    1.66    2.48      0    19.43    1.69    2.53      0
          65536         16384     float     sum      -1    21.48    3.05    4.58      0    20.99    3.12    4.68      0
         131072         32768     float     sum      -1    25.64    5.11    7.67      0    25.36    5.17    7.75      0
         262144         65536     float     sum      -1    35.04    7.48   11.22      0    34.06    7.70   11.55      0
         524288        131072     float     sum      -1    44.89   11.68   17.52      0    44.45   11.80   17.69      0
        1048576        262144     float     sum      -1    63.16   16.60   24.90      0    63.08   16.62   24.94      0
        2097152        524288     float     sum      -1    69.09   30.35   45.53      0    69.25   30.28   45.42      0
        4194304       1048576     float     sum      -1    86.22   48.65   72.97      0    86.73   48.36   72.54      0
        8388608       2097152     float     sum      -1    132.7   63.21   94.81      0    130.3   64.40   96.60      0
       16777216       4194304     float     sum      -1    188.7   88.91  133.36      0    187.8   89.35  134.02      0
       33554432       8388608     float     sum      -1    284.9  117.76  176.64      0    282.3  118.85  178.28      0
       67108864      16777216     float     sum      -1    537.4  124.88  187.32      0    538.8  124.56  186.83      0
      134217728      33554432     float     sum      -1    974.9  137.67  206.51      0    962.4  139.46  209.20      0
   # Out of bounds values : 0 OK
   # Avg bus bandwidth    : 39.6794
