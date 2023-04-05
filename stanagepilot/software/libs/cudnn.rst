.. _cudnn_stanage:

cuDNN
=====

.. sidebar:: cuDNN

   :Dependencies: CUDA, gcc
   :URL: https://developer.nvidia.com/cudnn
   :Documentation: https://developer.nvidia.com/cudnn


The NVIDIA CUDA Deep Neural Network library (cuDNN) is
a GPU-accelerated library of primitives for deep neural networks.
cuDNN provides highly tuned implementations for standard routines such
as forward and backward convolution, pooling, normalization, and activation layers.
cuDNN is part of the NVIDIA Deep Learning SDK.

Usage
-----

.. warning::

   **Only GPU-enabled nodes are able to run the cuDNN library.**

.. cssclass:: boldtext

See :ref:`gpu_computing_stanage` for more information on how to request a GPU-enabled node for an interactive session or job submission.

Load the appropriate cuDNN version
(and implicitly load a :ref:`specified CUDA version <cuda_stanage>`)
with one of the following commands:

.. code-block:: bash

   module load cuDNN/8.6.0.163-CUDA-11.8.0
   module load cuDNN/8.4.1.50-CUDA-11.7.0

Installation notes
------------------

This section is primarily for administrators of the system.

All cuDNN installs were installed using eponymous EasyBuild easyconfigs.

It's possible to download and compile some sample cuDNN programs from the nVIDIA Developer portal for the purposes of testing a cuDNN install,
but it's easier to build and test a program from a third party.

Save the C++_ program from `this blog post <https://medium.com/@rohitdwivedula/minimal-cudnn-c-hello-world-example-47d3c6b60b73>`__ as ``hw.cpp`` then
compile and execute it by running the following on a GPU node
(ideally from a batch job):

.. code-block:: bash

   module purge
   module load GCC/11.3.0
   module load cuDNN/8.6.0.163-CUDA-11.8.0

   g++ -o hw.o -c hw.cpp
   nvcc -ccbin g++ -m64 -gencode arch=compute_80,code=sm_80 -o hw hw.o -lcublasLt -lcudart -lcublas -lcudnn -lstdc++ -lm
   ./hw
