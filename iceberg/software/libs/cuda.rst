.. _`cuda`:

CUDA
====
CUDA, which stands for Compute Unified Device Architecture, is a parallel computing platform and application programming interface (API) model created by NVIDIA. It allows software developers to use a CUDA-enabled graphics processing unit (GPU) for general purpose processing – an approach known as GPGPU

Usage
-----
There are several versions of the CUDA library available. As with many libraries installed on the system, CUDA libraries are made available via ``module`` commands which are only available once you have started a ``qrsh`` or ``qsh`` session.

The latest version CUDA is loaded with the command ::

    module load libs/cuda

Alternatively, you can load a specific version with one of the following ::

    module load libs/cuda/7.5.18
    module load libs/cuda/6.5.14
    module load libs/cuda/4.0.17
    module load libs/cuda/3.2.16

Compiling the sample programs
-----------------------------
You do not need to be using a GPU-enabled node to compile the sample programs but you do need a GPU to run them.

In a `qrsh` session ::

 #Load modules
 module load libs/cuda/7.5.18
 module load compilers/gcc/4.9.2

 #Copy CUDA samples to a local directory
 #It will create a directory called NVIDIA_CUDA-7.5_Samples/
 mkdir cuda_samples
 cd cuda_samples
 cp -r $CUDA_SDK .

 #Compile (This will take a while)
 cd NVIDIA_CUDA-7.5_Samples/
 make

A basic test is to run one of the resulting binaries, **deviceQuery**.

Documentation
-------------
* `CUDA Toolkit Documentation <http://docs.nvidia.com/cuda/index.html#axzz3uLoSltnh>`_
* `The power of C++11 in CUDA 7 <http://devblogs.nvidia.com/parallelforall/power-cpp11-cuda-7/>`_

Determining the NVIDIA Driver version
-------------------------------------
Run the command ::

  cat /proc/driver/nvidia/version

Example output is ::

  NVRM version: NVIDIA UNIX x86_64 Kernel Module  340.32  Tue Aug  5 20:58:26 PDT 2014
  GCC version:  gcc version 4.4.7 20120313 (Red Hat 4.4.7-16) (GCC

Installation notes
------------------
These are primarily for system administrators

**CUDA 7.5.18**

The device drivers were updated separately by one of the sysadmins.

A binary install was performed using a .run file ::

  mkdir -p /usr/local/packages6/libs/binlibs/CUDA/7.5.18/

  chmod +x ./cuda_7.5.18_linux.run
  ./cuda_7.5.18_linux.run --toolkit --toolkitpath=/usr/local/packages6/libs/binlibs/CUDA/7.5.18/cuda --samples --samplespath=/usr/local/packages6/libs/binlibs/CUDA/7.5.18/samples --no-opengl-libs  -silent

**Previous version**

No install notes are available

Module Files
------------
* The module file is on the system at ``/usr/local/modulefiles/libs/cuda/7.5.18``
* The module file is `on github <https://github.com/rcgsheffield/iceberg_software/blob/master/software/modulefiles/libs/binlibs/cuda/7.5.18>`_.
