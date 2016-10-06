.. _GPUInteractive:

.. toctree::
    :maxdepth: 1
    :glob:

Interactive use of the GPUs
===========================
Once you are included in the GPU project group you may start using the GPU enabled nodes interactively by typing ::

        qsh -l gpu=1 -P gpu

the ``gpu=`` parameter determines how many GPUs you are requesting. Currently, the maximum number of GPUs allowed per job is set to 4, i.e. you cannot exceed ``gpu=4``. Most jobs will only make use of one GPU.

If your job requires selecting the type of GPU hardware, one of the following two optional parameters can be used to make that choice ::

	-l gpu_arch=nvidia-m2070
	-l gpu_arch=nvidia-k40m

Interactive sessions provide you with 2 Gigabytes of CPU RAM by default which is significantly less than the amount of GPU RAM available. This can lead to issues where your session has insufficient CPU RAM to transfer data to and from the GPU. As such, it is recommended that you request enough CPU memory to communicate properly with the GPU ::

        -l gpu_arch=nvidia-m2070 -l mem=7G
        -l gpu_arch=nvidia-k40m -l mem=13G

The above will give you 1Gb more CPU RAM than GPU RAM for each of the respective GPU architectures. 
