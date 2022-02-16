.. _cudnn_bessemer:

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

.. See** :ref:`GPUComputing_bessemer` **for more information on how to request a GPU-enabled node for an interactive session or job submission.**

Load the appropriate cuDNN version
(and implicitly load a :ref:`specified CUDA version <cuda_bessemer>`)
with one of the following commands:

.. code-block:: bash

   module load cuDNN/7.6.4.38-gcccuda-2019b
   module load cuDNN/7.6.4.38-gcccuda-2019a
   module load cuDNN/7.6.4.38-CUDA-10.0.130
   module load cuDNN/7.4.2.24-gcccuda-2019a
   module load cuDNN/7.4.2.24-CUDA-10.0.130
   module load cuDNN/8.0.4.30-CUDA-11.0.2
   module load cuDNN/8.0.4.30-CUDA-11.1.1

Installation notes
------------------

This section is primarily for administrators of the system.

All cuDNN installs were installed using eponymous EasyBuild easyconfigs. 

cuDNN installation ``.tgz`` files must be located in ``/usr/local/media/eb-srcs/c/cuDNN/`` before cuDNN can be installed via EasyBuild.
The cuDNN library is *only* available to download through the `NVIDIA Developer portal <https://developer.nvidia.com/cudnn>`_.

cuDNN can be tested by logging in to the Developer Portal and downloading the *cuDNN Code Samples and User Guide for Ubuntu18.04 (Deb)* for the versions of CUDA and cuDNN you want to test.
You can then extract some sample programs from this file using something like the following: ::

   pushd ${TMPDIR-tmp}
   ar x path/to/libcudnn7-doc_7.6.4.38-1+cuda10.1_amd64.deb
   tar -Jxf data.tar.xz
   cd ./usr/src/cudnn_samples_v7/mnistCUDNN/

Then build and run the ``mnistCUDNN`` sample program using: ::

   make
   ./mnistCUDNN
