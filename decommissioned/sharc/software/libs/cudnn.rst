.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _cudnn_sharc:

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

**Only GPU-enabled nodes are able to run the library. See** :ref:`GPUComputing_sharc` **for more information on how to request a GPU-enabled node for an interactive session or job submission.**

Load the appropriate cuDNN version (**and implicitly load a specific CUDA version**) with one of the following commands:

.. code-block:: bash

   module load libs/cudnn/8.2.1.32/binary-cuda-11.3.0
   module load libs/cudnn/8.2.1.32/binary-cuda-11.2.0
   module load libs/cudnn/8.1.1.33/binary-cuda-11.2.0
   module load libs/cudnn/8.0.5.39/binary-cuda-11.1.1
   module load libs/cudnn/7.6.5.32/binary-cuda-10.2.89
   module load libs/cudnn/7.6.5.32/binary-cuda-10.1.243
   module load libs/cudnn/7.6.5.32/binary-cuda-10.0.130
   module load libs/cudnn/7.6.5.32/binary-cuda-9.0.176
   module load libs/cudnn/7.5.0.56/binary-cuda-10.0.130
   module load libs/cudnn/7.5.0.56/binary-cuda-9.0.176
   module load libs/cudnn/7.3.1.20/binary-cuda-9.0.176
   module load libs/cudnn/7.0/binary-cuda-9.1.85
   module load libs/cudnn/7.0/binary-cuda-8.0.44
   module load libs/cudnn/6.0/binary-cuda-8.0.44
   module load libs/cudnn/5.1/binary-cuda-8.0.44
   module load libs/cudnn/5.1/binary-cuda-7.5.18
   module load libs/cudnn/4.0/binary-cuda-7.5.18

Note that for ``libs/cudnn/4.0/binary-cuda-7.5.18`` the ``mnistCUDNN`` test program succeeds on K80 GPUs but fails on P100 and V100 GPUs.

Examples
--------

Examples are provided for the following versions 

 * ``libs/cudnn/8.2.1.32/binary-cuda-11.3.0``
 * ``libs/cudnn/8.2.1.32/binary-cuda-11.2.0``
 * ``libs/cudnn/8.1.1.33/binary-cuda-11.2.0``
 * ``libs/cudnn/8.0.5.39/binary-cuda-11.1.1``
 * ``libs/cudnn/7.6.5.32/binary-cuda-10.2.89``
 * ``libs/cudnn/7.6.5.32/binary-cuda-10.1.243``
 * ``libs/cudnn/7.6.5.32/binary-cuda-10.0.130``
 * ``libs/cudnn/7.6.5.32/binary-cuda-9.0.176``
 * ``libs/cudnn/7.5.0.56/binary-cuda-10.0.130``
 * ``libs/cudnn/7.5.0.56/binary-cuda-9.0.176``
 * ``libs/cudnn/7.3.1.20/binary-cuda-9.0.176``
 * ``libs/cudnn/4.0/binary-cuda-7.5.18``

Usage with ``libs/cudnn/8.0.5.39/binary-cuda-11.1.1``:

.. code-block:: bash

   # start an interactive session on a GPU node
   qrshx -l gpu=1  
   module load libs/cudnn/8.0.5.39/binary-cuda-11.1.1
   # Copy the cuDNN 8 examples to a temporary directory
   cp -r "$CUDNN_HOME/src/cudnn_samples_v8" "${TMPDIR-/tmp}"
   # Compile an example
   cd "${TMPDIR-/tmp}/cudnn_samples_v8/mnistCUDNN"
   make
   # Run the example
   ./mnistCUDNN

Installation notes
------------------

This section is primarily for administrators of the system.

The cuDNN library is only available to download through the `developer portal <https://developer.nvidia.com/cudnn>`_.  
Installation ``.tgz`` files and ``.deb`` files containing samples are located in ``/usr/local/media/protected/cudnn``.


Version 8.2.1.32
^^^^^^^^^^^^^^^^
- Install script: :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/cudnn/install.sh>`
- :download:`Module file for CUDA 11.3 </decommissioned/sharc/software/modulefiles/libs/cudnn/8.2.1.32/binary-cuda-11.3.0>`
- :download:`Module file for CUDA 11.2 </decommissioned/sharc/software/modulefiles/libs/cudnn/8.2.1.32/binary-cuda-11.2.0>`
- Testing: ran the ``mnistCUDNN`` example (see *Examples* above) with CUDA 11.2 & 11.3 on a K80 GPU. 

Note that FreeImage is no longer distributed with CUDA version 11.2 or higher thus the 
``libs/FreeImage/3.18.0/gcc-8.2`` module must be loaded during testing with the ``mnistCUDNN`` example.

Version 8.1.1.33
^^^^^^^^^^^^^^^^
- Install script: :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/cudnn/install.sh>`
- :download:`Module file for CUDA 11.2 </decommissioned/sharc/software/modulefiles/libs/cudnn/8.1.1.33/binary-cuda-11.2.0>`
- Testing: ran the ``mnistCUDNN`` example (see *Examples* above) with CUDA 11.2 on a K80 GPU. Note that

Note that FreeImage is no longer distributed with CUDA version 11.2 or higher thus the 
``libs/FreeImage/3.18.0/gcc-8.2`` module must be loaded during testing with the ``mnistCUDNN`` example.

Version 8.0.5.39
^^^^^^^^^^^^^^^^
- Install script: :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/cudnn/install.sh>`
- :download:`Module file for CUDA 11.1 </decommissioned/sharc/software/modulefiles/libs/cudnn/8.0.5.39/binary-cuda-11.1.1>`
- Testing: ran the ``mnistCUDNN`` example (see *Examples* above) with CUDA 11.1 on a V100 GPU.

Version 7.6.5.32
^^^^^^^^^^^^^^^^

- Install script: :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/cudnn/install.sh>`
- :download:`Module file for CUDA 10.2 </decommissioned/sharc/software/modulefiles/libs/cudnn/7.6.5.32/binary-cuda-10.2.89>`
- :download:`Module file for CUDA 10.1 </decommissioned/sharc/software/modulefiles/libs/cudnn/7.6.5.32/binary-cuda-10.1.243>`
- :download:`Module file for CUDA 10.0 </decommissioned/sharc/software/modulefiles/libs/cudnn/7.6.5.32/binary-cuda-10.0.130>`
- :download:`Module file for CUDA 9.0 </decommissioned/sharc/software/modulefiles/libs/cudnn/7.6.5.32/binary-cuda-9.0.176>`
- Testing: ran the ``mnistCUDNN`` example (see *Examples* above) with CUDA 10.0 on a V100 GPU; results: ::

   [te1st mnistCUDNN]$ ./mnistCUDNN
   cudnnGetVersion() : 7605 , CUDNN_VERSION from cudnn.h : 7605 (7.6.5)
   Host compiler version : GCC 4.8.5                                                                                                                                                             
   There are 1 CUDA capable devices on your machine :
   device 0 : sms 80  Capabilities 7.0, SmClock 1380.0 Mhz, MemSize (Mb) 16130, MemClock 877.0 Mhz, Ecc=1, boardGroupID=0
   Using device 0

   Testing single precision
   Loading image data/one_28x28.pgm
   Performing forward propagation ...
   Testing cudnnGetConvolutionForwardAlgorithm ...
   Fastest algorithm is Algo 0
   Testing cudnnFindConvolutionForwardAlgorithm ...
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 0: 0.030688 time requiring 0 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 7: 0.128000 time requiring 2057744 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 2: 0.148448 time requiring 57600 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 1: 0.196640 time requiring 3464 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 5: 0.231456 time requiring 203008 memory
   Resulting weights from Softmax:
   0.0000000 0.9999399 0.0000000 0.0000000 0.0000561 0.0000000 0.0000012 0.0000017 0.0000010 0.0000000 
   Loading image data/three_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000000 0.0000000 0.9999288 0.0000000 0.0000711 0.0000000 0.0000000 0.0000000 0.0000000 
   Loading image data/five_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000008 0.0000000 0.0000002 0.0000000 0.9999820 0.0000154 0.0000000 0.0000012 0.0000006 

   Result of classification: 1 3 5

   Test passed!

   Testing half precision (math in single precision)
   Loading image data/one_28x28.pgm
   Performing forward propagation ...
   Testing cudnnGetConvolutionForwardAlgorithm ...
   Fastest algorithm is Algo 0
   Testing cudnnFindConvolutionForwardAlgorithm ...
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 0: 0.016384 time requiring 0 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 2: 0.051200 time requiring 28800 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 7: 0.055328 time requiring 2057744 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 1: 0.065536 time requiring 3464 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 5: 0.079904 time requiring 203008 memory
   Resulting weights from Softmax:
   0.0000001 1.0000000 0.0000001 0.0000000 0.0000563 0.0000001 0.0000012 0.0000017 0.0000010 0.0000001 
   Loading image data/three_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000000 0.0000000 1.0000000 0.0000000 0.0000720 0.0000000 0.0000000 0.0000000 0.0000000 
   Loading image data/five_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000008 0.0000000 0.0000002 0.0000000 1.0000000 0.0000154 0.0000000 0.0000012 0.0000006 

   Result of classification: 1 3 5

   Test passed!

Version 7.5.0.56
^^^^^^^^^^^^^^^^

- Install script: :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/cudnn/install.sh>`
- :download:`Module file for CUDA 10.0 </decommissioned/sharc/software/modulefiles/libs/cudnn/7.5.0.56/binary-cuda-10.0.130>`
- :download:`Module file for CUDA 9.0 </decommissioned/sharc/software/modulefiles/libs/cudnn/7.5.0.56/binary-cuda-9.0.176>`
- Testing: ran the ``mnistCUDNN`` example (see *Examples* above) with CUDA 10.0 on a V100 GPU; results: ::

   [te1st@sharc-node168 mnistCUDNN]$ ./mnistCUDNN 
   cudnnGetVersion() : 7500 , CUDNN_VERSION from cudnn.h : 7500 (7.5.0)
   Host compiler version : GCC 4.8.5
   There are 1 CUDA capable devices on your machine :
   device 0 : sms 80  Capabilities 7.0, SmClock 1380.0 Mhz, MemSize (Mb) 16130, MemClock 877.0 Mhz, Ecc=1, boardGroupID=0
   Using device 0

   Testing single precision
   Loading image data/one_28x28.pgm
   Performing forward propagation ...
   Testing cudnnGetConvolutionForwardAlgorithm ...
   Fastest algorithm is Algo 0
   Testing cudnnFindConvolutionForwardAlgorithm ...
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 0: 0.019424 time requiring 0 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 2: 0.053248 time requiring 57600 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 1: 0.078848 time requiring 3464 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 7: 0.086016 time requiring 2057744 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 5: 0.094208 time requiring 203008 memory
   Resulting weights from Softmax:
   0.0000000 0.9999399 0.0000000 0.0000000 0.0000561 0.0000000 0.0000012 0.0000017 0.0000010 0.0000000 
   Loading image data/three_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000000 0.0000000 0.9999288 0.0000000 0.0000711 0.0000000 0.0000000 0.0000000 0.0000000 
   Loading image data/five_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000008 0.0000000 0.0000002 0.0000000 0.9999820 0.0000154 0.0000000 0.0000012 0.0000006 

   Result of classification: 1 3 5

   Test passed!

   Testing half precision (math in single precision)
   Loading image data/one_28x28.pgm
   Performing forward propagation ...
   Testing cudnnGetConvolutionForwardAlgorithm ...
   Fastest algorithm is Algo 0
   Testing cudnnFindConvolutionForwardAlgorithm ...
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 0: 0.016384 time requiring 0 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 2: 0.051200 time requiring 28800 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 1: 0.052224 time requiring 3464 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 7: 0.065568 time requiring 2057744 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 4: 0.068608 time requiring 207360 memory
   Resulting weights from Softmax:
   0.0000001 1.0000000 0.0000001 0.0000000 0.0000563 0.0000001 0.0000012 0.0000017 0.0000010 0.0000001 
   Loading image data/three_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000000 0.0000000 1.0000000 0.0000000 0.0000720 0.0000000 0.0000000 0.0000000 0.0000000 
   Loading image data/five_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000008 0.0000000 0.0000002 0.0000000 1.0000000 0.0000154 0.0000000 0.0000012 0.0000006 

   Result of classification: 1 3 5

   Test passed!


Version 7.3.1.20
^^^^^^^^^^^^^^^^

- Install script: :download:`install.sh </decommissioned/sharc/software/install_scripts/libs/cudnn/install.sh>`
- :download:`Module file for CUDA 9.0 </decommissioned/sharc/software/modulefiles/libs/cudnn/7.3.1.20/binary-cuda-9.0.176>`
- Testing: ran the ``mnistCUDNN`` example (see *Examples* above) with CUDA 9.0 on a V100 GPU; results: ::

   [te1st@sharc-node168 mnistCUDNN]$ ./mnistCUDNN 
   cudnnGetVersion() : 7301 , CUDNN_VERSION from cudnn.h : 7301 (7.3.1)
   Host compiler version : GCC 4.8.5
   There are 2 CUDA capable devices on your machine :
   device 0 : sms 80  Capabilities 7.0, SmClock 1380.0 Mhz, MemSize (Mb) 16160, MemClock 877.0 Mhz, Ecc=1, boardGroupID=0
   device 1 : sms 80  Capabilities 7.0, SmClock 1380.0 Mhz, MemSize (Mb) 16160, MemClock 877.0 Mhz, Ecc=1, boardGroupID=1
   Using device 0
   
   Testing single precision
   Loading image data/one_28x28.pgm
   Performing forward propagation ...
   Testing cudnnGetConvolutionForwardAlgorithm ...
   Fastest algorithm is Algo 0
   Testing cudnnFindConvolutionForwardAlgorithm ...
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 0: 0.109600 time requiring 0 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 2: 0.161792 time requiring 57600 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 1: 0.183296 time requiring 3464 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 5: 0.198656 time requiring 203008 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 7: 0.200704 time requiring 2057744 memory
   Resulting weights from Softmax:
   0.0000000 0.9999399 0.0000000 0.0000000 0.0000561 0.0000000 0.0000012 0.0000017 0.0000010 0.0000000 
   Loading image data/three_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000000 0.0000000 0.9999288 0.0000000 0.0000711 0.0000000 0.0000000 0.0000000 0.0000000 
   Loading image data/five_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000008 0.0000000 0.0000002 0.0000000 0.9999820 0.0000154 0.0000000 0.0000012 0.0000006 
   
   Result of classification: 1 3 5
   
   Test passed!
   
   Testing half precision (math in single precision)
   Loading image data/one_28x28.pgm
   Performing forward propagation ...
   Testing cudnnGetConvolutionForwardAlgorithm ...
   Fastest algorithm is Algo 0
   Testing cudnnFindConvolutionForwardAlgorithm ...
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 0: 0.048128 time requiring 0 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 1: 0.089088 time requiring 3464 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 7: 0.097280 time requiring 2057744 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 2: 0.098272 time requiring 28800 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 4: 0.132096 time requiring 207360 memory
   Resulting weights from Softmax:
   0.0000001 1.0000000 0.0000001 0.0000000 0.0000563 0.0000001 0.0000012 0.0000017 0.0000010 0.0000001 
   Loading image data/three_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000000 0.0000000 1.0000000 0.0000000 0.0000720 0.0000000 0.0000000 0.0000000 0.0000000 
   Loading image data/five_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000008 0.0000000 0.0000002 0.0000000 1.0000000 0.0000154 0.0000000 0.0000012 0.0000006 
   
   Result of classification: 1 3 5
   
   Test passed!

Version 7.0
^^^^^^^^^^^

- Install script: :download:`install_cudnn7.0_for_cuda8.0_cuda9.1.sh </decommissioned/sharc/software/install_scripts/libs/cudnn/install_7.0_for_cuda_8.0_cuda_9.1.sh>`
- :download:`Module file for CUDA 9.1 </decommissioned/sharc/software/modulefiles/libs/cudnn/7.0/binary-cuda-9.1.85>`
- :download:`Module file for CUDA 8.0 </decommissioned/sharc/software/modulefiles/libs/cudnn/7.0/binary-cuda-8.0.44>`

Version 6.0
^^^^^^^^^^^

- Install script: :download:`install_cudnn6.0_for_cuda8.0.sh </decommissioned/sharc/software/install_scripts/libs/cudnn/install_6.0_for_cuda_8.0.sh>`
- :download:`Module file </decommissioned/sharc/software/modulefiles/libs/cudnn/6.0/binary-cuda-8.0.44>`

Version 5.1
^^^^^^^^^^^

- Install script: :download:`install_cudnn5.1_for_cuda7.5_cuda8.0.sh </decommissioned/sharc/software/install_scripts/libs/cudnn/install_5.1_for_cuda_7.5_cuda_8.0.sh>`
- :download:`Module file for CUDA 8.0 </decommissioned/sharc/software/modulefiles/libs/cudnn/5.1/binary-cuda-8.0.44>`
- :download:`Module file for CUDA 7.5 </decommissioned/sharc/software/modulefiles/libs/cudnn/5.1/binary-cuda-7.5.18>`

Version 4.0
^^^^^^^^^^^

- Install script: :download:`install_4.0_for_cuda_7.0.sh </decommissioned/sharc/software/install_scripts/libs/cudnn/install_4.0_for_cuda_7.0.sh>`
- :download:`Module file for CUDA 7.5 </decommissioned/sharc/software/modulefiles/libs/cudnn/4.0/binary-cuda-7.5.18>` 
  (this cuDNN was built for CUDA 7.0 but should be compatible with CUDA 7.5)
- Testing: ran the ``mnistCUDNN`` example (see *Examples* above) with CUDA 7.5 on a K80 GPU (NB tests failed on P100 and V100 GPUs): ::

   $ make
   /usr/local/packages/libs/CUDA/7.5.18/binary/cuda/bin/nvcc -ccbin g++ -I/usr/local/packages/libs/CUDA/7.5.18/binary/cuda/include -IFreeImage/include -IUtilNPP  -m64    -gencode arch=compute_30,code=sm_30 -gencode arch=compute_35,code=sm_35 -gencode arch=compute_37,code=sm_37 -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_52,code=compute_52 -o fp16_dev.o -c fp16_dev.cu
   g++ -I/usr/local/packages/libs/CUDA/7.5.18/binary/cuda/include -IFreeImage/include -IUtilNPP   -o fp16_emu.o -c fp16_emu.cpp
   g++ -I/usr/local/packages/libs/CUDA/7.5.18/binary/cuda/include -IFreeImage/include -IUtilNPP   -o mnistCUDNN.o -c mnistCUDNN.cpp
   /usr/local/packages/libs/CUDA/7.5.18/binary/cuda/bin/nvcc -ccbin g++   -m64      -gencode arch=compute_30,code=sm_30 -gencode arch=compute_35,code=sm_35 -gencode arch=compute_37,code=sm_37 -gencode arch=compute_50,code=sm_50 -gencode arch=compute_52,code=sm_52 -gencode arch=compute_52,code=compute_52 -o mnistCUDNN fp16_dev.o fp16_emu.o mnistCUDNN.o  -LFreeImage/lib/linux/x86_64 -LFreeImage/lib/linux -lcudart -lnppi -lnppc -lcublas -lcudnn -lfreeimage -lstdc++ -lm
   $ ./mnistCUDNN
   cudnnGetVersion() : 4007 , CUDNN_VERSION from cudnn.h : 4007 (4.0.7)
   Host compiler version : GCC 4.8.5
   There are 8 CUDA capable devices on your machine :
   device 0 : sms 13  Capabilities 3.7, SmClock 823.5 Mhz, MemSize (Mb) 11441, MemClock 2505.0 Mhz, Ecc=1, boardGroupID=0
   device 1 : sms 13  Capabilities 3.7, SmClock 823.5 Mhz, MemSize (Mb) 11441, MemClock 2505.0 Mhz, Ecc=1, boardGroupID=0
   device 2 : sms 13  Capabilities 3.7, SmClock 823.5 Mhz, MemSize (Mb) 11441, MemClock 2505.0 Mhz, Ecc=1, boardGroupID=2
   device 3 : sms 13  Capabilities 3.7, SmClock 823.5 Mhz, MemSize (Mb) 11441, MemClock 2505.0 Mhz, Ecc=1, boardGroupID=2
   device 4 : sms 13  Capabilities 3.7, SmClock 823.5 Mhz, MemSize (Mb) 11441, MemClock 2505.0 Mhz, Ecc=1, boardGroupID=4
   device 5 : sms 13  Capabilities 3.7, SmClock 823.5 Mhz, MemSize (Mb) 11441, MemClock 2505.0 Mhz, Ecc=1, boardGroupID=4
   device 6 : sms 13  Capabilities 3.7, SmClock 823.5 Mhz, MemSize (Mb) 11441, MemClock 2505.0 Mhz, Ecc=1, boardGroupID=6
   device 7 : sms 13  Capabilities 3.7, SmClock 823.5 Mhz, MemSize (Mb) 11441, MemClock 2505.0 Mhz, Ecc=1, boardGroupID=6
   Using device 0

   Testing single precision
   Loading image data/one_28x28.pgm
   Performing forward propagation ...
   Testing cudnnGetConvolutionForwardAlgorithm ...
   Fastest algorithm is Algo 1
   Testing cudnnFindConvolutionForwardAlgorithm ...
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 0: 0.024928 time requiring 0 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 1: 0.033504 time requiring 100 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 2: 0.046816 time requiring 57600 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 4: 0.128416 time requiring 207360 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 5: 0.143424 time requiring 209360 memory
   Resulting weights from Softmax:
   0.0000000 0.9999399 0.0000000 0.0000000 0.0000561 0.0000000 0.0000012 0.0000017 0.0000010 0.0000000 
   Loading image data/three_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000000 0.0000000 0.9999288 0.0000000 0.0000711 0.0000000 0.0000000 0.0000000 0.0000000 
   Loading image data/five_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000008 0.0000000 0.0000002 0.0000000 0.9999820 0.0000154 0.0000000 0.0000012 0.0000006 

   Result of classification: 1 3 5

   Test passed!

   Testing half precision (math in single precision)
   Loading image data/one_28x28.pgm
   Performing forward propagation ...
   Testing cudnnGetConvolutionForwardAlgorithm ...
   Fastest algorithm is Algo 1
   Testing cudnnFindConvolutionForwardAlgorithm ...
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 0: 0.026144 time requiring 0 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 1: 0.033696 time requiring 100 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 2: 0.047136 time requiring 28800 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 4: 0.133760 time requiring 207360 memory
   ^^^^ CUDNN_STATUS_SUCCESS for Algo 5: 0.144096 time requiring 209360 memory
   Resulting weights from Softmax:
   0.0000001 1.0000000 0.0000001 0.0000000 0.0000563 0.0000001 0.0000012 0.0000017 0.0000010 0.0000001 
   Loading image data/three_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000000 0.0000000 1.0000000 0.0000000 0.0000714 0.0000000 0.0000000 0.0000000 0.0000000 
   Loading image data/five_28x28.pgm
   Performing forward propagation ...
   Resulting weights from Softmax:
   0.0000000 0.0000008 0.0000000 0.0000002 0.0000000 1.0000000 0.0000154 0.0000000 0.0000012 0.0000006 

   Result of classification: 1 3 5

   Test passed!

