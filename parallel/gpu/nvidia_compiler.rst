Compiling on the GPU using the NVIDIA Compiler
==============================================
To compile GPU code using the NVIDIA compiler, nvcc, first start an :ref:`interactive GPU session <GPUjobs>`. Next, you need to set up the compiler environment via one of the following module statements ::

        module load libs/cuda/8.0.44
        module load libs/cuda/7.5.18
        module load libs/cuda/6.5.14
        module load libs/cuda/4.0.17
        module load libs/cuda/3.2.16

depending on the version of CUDA you intend to use. This makes the ``nvcc`` CUDA compiler available. For example ::

        nvcc filename.cu -arch sm_20

will compile the CUDA program contained in the file ``filename.cu``.  The ``-arch`` flag above signifies the compute capability of the intended GPU hardware, which is 20 for our current GPU modules. If you are intending to generate code for older architectures you may have to specify ``sm_10`` or ``sm_13`` for example.
