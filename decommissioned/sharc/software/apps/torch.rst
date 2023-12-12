.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _torch_sharc:

Torch (Lua)
===========

.. sidebar:: Torch (Lua)

   :URL: http://torch.ch/

Torch is a scientific computing framework with wide support for machine learning algorithms that puts GPUs first. 
It is a wrapper written in the Lua language around the THNN library. 
Torch is easy to use and efficient, thanks to an easy and fast scripting language, LuaJIT, and an underlying C/CUDA implementation.

.. note::

   This version of Torch should not be confused with PyTorch, which is a Python wrapper around the THNN library.

   PyTorch provides similar functionality but is more actively maintained.
   We recommend most people use PyTorch instead of this version of Torch.

   See also the documentation for :ref:`PyTorch on ShARC <pytorch_sharc>`.

About Torch on ShARC
--------------------

**A GPU-enabled worker node must be requested in order to use the GPU version of this software. See** :ref:`GPUComputing_sharc` **for more information.**

Torch is available on ShARC as both Apptainer/Singularity images and as a module.

Torch Apptainer/Singularity Images
----------------------------------

Apptainer (previously known as Singularity) images are self-contained virtual machines similar to Docker. For more information on Apptainer and how to use the images, see :ref:`apptainer_sharc`.

A symlinked file is provided that always point to the latest image: ::

  /usr/local/packages/singularity/images/torch/gpu.img

To get a bash terminal in to an image for example, use the command: ::

  apptainer exec --nv /usr/local/packages/singularity/images/torch/gpu.img /bin/bash

The ``exec`` command can also be used to call any command/script inside the image e.g. ::

  apptainer exec --nv /usr/local/packages/singularity/images/torch/gpu.img th yourscript.lua

**The** ``--nv`` **flag enables the use of GPUs within the image and can be removed if the software you're using does not use the GPU.**

You may get a warning similar to ``groups: cannot find name for group ID ...``, this can be ignored and will not have an affect on running the image.

The paths ``/fastdata``, ``/data``, ``/home``, ``/scratch``, ``/shared`` are automatically mounted to your ShARC filestore directories. For GPU-enabled images the ``/nvlib`` and ``/nvbin`` is mounted to the correct Nvidia driver version for the node that you're using.

**To submit jobs that uses an Apptainer image, see** :ref:`use_image_batch_apptainer_sharc` **for more detail.**


Image Index
^^^^^^^^^^^

Paths to the actual images and definition files are provided below for downloading and building of custom images.

* Shortcut to Latest Image
    * ``/usr/local/packages/singularity/images/torch/gpu.img``
* GPU Images
    * Latest: v7-GPU-Ubuntu16.04-CUDA8-cudNN5.0 (GCC 5.4.0)
        * Path: ``/usr/local/packages/singularity/images/torch/v7-GPU-Ubuntu16.04-CUDA8-cudNN5.0.img``
        * Def file: :download:`/sharc/software/apps/apptainer/torch_gpu.def </decommissioned/sharc/software/apps/apptainer/torch_gpu.def>`

Using the Torch Module
----------------------

The following is an instruction on how to use the Torch module.

First request an interactive session, e.g. with :ref:`qrshx`. To use GPUs see :ref:`GPUInteractive_sharc`.

Load the Torch module which also loads anaconda 3.4, CUDA 8.0, cuDNN 5.1 and GCC 4.9.4. ::

	module load apps/torch/nvidia-7/gcc-4.9.4-cuda-8.0-cudnn-5.1-conda-3.4

On the DGX-1, load the NCCL library optimised for the hardware: ::

	moudle libs/nccl/dgx-1/binary-cuda-8.0

On any other node use a generic NCCL build: ::

	moudle load libs/nccl/generic/gcc-4.9.4-cuda-8.0


(Optional if you plan to interface with python) Create a conda environment to load relevant modules on your local user account and activate it ::

	conda create -n torch python=3.5
	source activate torch



Every Session Afterwards and in Your Job Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In the interactive session or your batch script, load the relevant modules and (optionally) activate your conda environment ::

	module load apps/torch/nvidia-7/gcc-4.9.4-cuda-8.0-cudnn-5.1-conda-3.4

	#Optional
	source activate torch

