.. _GPUJobs:

.. toctree::
    :maxdepth: 1
    :glob:

Submitting GPU jobs
===================

Interactive use of the GPUs
---------------------------
You can access GPU enabled nodes interactively by typing ::

        qsh -l gpu=1 

the ``gpu=`` parameter determines how many GPUs you are requesting. 
Currently, the maximum number of GPUs allowed per job is set to 4, i.e. you cannot exceed ``gpu=4``. 
Most jobs will only make use of one GPU.

If your job requires selecting the type of GPU hardware, one of the following two optional parameters can be used to make that choice ::

	-l gpu_arch=nvidia-m2070
	-l gpu_arch=nvidia-k40m

Interactive sessions provide you with 2GB of CPU RAM by default which is significantly less than the amount of GPU RAM available. 
This can lead to issues where your session has insufficient CPU RAM to transfer data to and from the GPU. 
As such, it is recommended that you request enough CPU memory to communicate properly with the GPU ::

        -l gpu_arch=nvidia-m2070 -l mem=7G
        -l gpu_arch=nvidia-k40m -l mem=13G

The above will give you 1GB more CPU RAM than GPU RAM for each of the respective GPU architectures. 

Submitting batch GPU jobs
-------------------------

To run batch jobs on gpu nodes, edit your jobfile to include a request for GPUs, e.g. for a single GPU ::

	#$ -l gpu=1

You can also use the the ``gpu_arch`` discussed aboved to target a specific GPU model ::

	#$ -l gpu_arch=nvidia-m2070

