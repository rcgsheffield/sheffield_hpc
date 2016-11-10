.. _cudnn:

cuDNN
=====

.. sidebar:: cudNN

  
   :Dependencies: CUDA, gcc
   :URL: https://developer.nvidia.com/cudnn
   :Documentation: https://developer.nvidia.com/cudnn


The NVIDIA CUDA Deep Neural Network library (cuDNN) is a GPU-accelerated library of primitives for deep neural networks. cuDNN provides highly tuned implementations for standard routines such as forward and backward convolution, pooling, normalization, and activation layers. cuDNN is part of the NVIDIA Deep Learning SDK.

Usage
-----

Currently only cuDNN 5.0 is supported for CUDA versions 8.0.x and 7.5.x. An appropriate CUDA module is loaded automatically so there's no need for a separate CUDA module load call.

Load the appropriate version with the following commands ::

    module load libs/binlibs/cudnn/cuda8.0/cudnn5.0
    module load libs/binlibs/cudnn/cuda7.5/cudnn5.0    


Installation notes
------------------

This section is primarily for administrators of the system.

The cuDNN library is only available to download through the developer portal at https://developer.nvidia.com/cudnn.

