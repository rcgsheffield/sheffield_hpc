.. _cudnn_sharc:

cuDNN
=====

.. sidebar:: cuDNN


   :Dependencies: CUDA, gcc
   :URL: https://developer.nvidia.com/cudnn
   :Documentation: https://developer.nvidia.com/cudnn


The NVIDIA CUDA Deep Neural Network library (cuDNN) is a GPU-accelerated library of primitives for deep neural networks. cuDNN provides highly tuned implementations for standard routines such as forward and backward convolution, pooling, normalization, and activation layers. cuDNN is part of the NVIDIA Deep Learning SDK.

Usage
-----

**Only GPU-enabled nodes are able to run the library. See** :ref:`GPUComputing_sharc` **for more information on how to request a GPU-enabled node for an interactive session or job submission.**

Load the appropriate cuDNN version (**and implicitly load a specific CUDA version**) with one of the following commands: ::

    module load libs/cudnn/6.0/binary-cuda-8.0.44
    module load libs/cudnn/5.1/binary-cuda-8.0.44
    module load libs/cudnn/5.1/binary-cuda-7.5.18

Installation notes
------------------

This section is primarily for administrators of the system.

The cuDNN library is only available to download through the `developer portal <https://developer.nvidia.com/cudnn>`_.  Installation ``.tgz`` files are located in ``/usr/local/media/protected/cudnn``.

Version 6.0
^^^^^^^^^^^

- Install script: :download:`install_cudnn6.0_for_cuda8.0.sh </sharc/software/install_scripts/libs/cudnn/install_6.0_for_cuda_8.0.sh>`
- :download:`Module file </sharc/software/modulefiles/libs/cudnn/6.0/binary-cuda-8.0.44>`

Version 5.1
^^^^^^^^^^^

- Install script: :download:`install_cudnn5.1_for_cuda7.5_cuda8.0.sh </sharc/software/install_scripts/libs/cudnn/install_5.1_for_cuda_7.5_cuda_8.0.sh>`
- :download:`Module file for CUDA 8.0 </sharc/software/modulefiles/libs/cudnn/5.1/binary-cuda-8.0.44>`
- :download:`Module file for CUDA 7.5 </sharc/software/modulefiles/libs/cudnn/5.1/binary-cuda-7.5.18>`
