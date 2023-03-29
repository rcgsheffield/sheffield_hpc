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

This software and documentation is maintained by the `RSES group <https://rse.shef.ac.uk/>`_ and `GPUComputing@Sheffield <http://gpucomputing.shef.ac.uk/>`_. For feature requests or if you encounter any problems, please raise an issue on the `GPU Computing repository <https://github.com/RSE-Sheffield/GPUComputing/issues>`_.


Torch Apptainer/Singularity Images
----------------------------------

Apptainer (previously known as Singularity) images are self-contained virtual machines similar to Docker. For more information on Apptainer and how to use the images, see :ref:`apptainer_sharc`.

A symlinked file is provided that always point to the latest image: ::

  /usr/local/packages/singularity/images/torch/gpu.img

To get a bash terminal in to an image for example, use the command: ::

  apptainer exec --nv /usr/local/packages/singularity/images/torch/gpu.img /bin/bash

To get a torch console: ::

  singularity exec --nv /usr/local/packages/singularity/images/torch/gpu.img th

The ``exec`` command can also be used to call any command/script inside the image e.g. ::

  apptainer exec --nv /usr/local/packages/singularity/images/torch/gpu.img th yourscript.lua



**The** ``--nv`` **flag enables the use of GPUs within the image and can be removed if the software you're using does not use the GPU.**

You may get a warning similar to ``groups: cannot find name for group ID ...``, this can be ignored and will not have an affect on running the image.

The paths ``/fastdata``, ``/data``, ``/home``, ``/scratch``, ``/shared`` are automatically mounted to your ShARC filestore directories.

**To submit jobs that uses an Apptainer image, see** :ref:`use_image_batch_apptainer_sharc` **for more detail.**


Image Index
^^^^^^^^^^^

Paths to the actual images and definition files are provided below for downloading and building of custom images.

* Shortcut to Latest Image
    * ``/usr/local/packages/singularity/images/torch/gpu.img``
* GPU Images
    * Latest: v7-GPU-Ubuntu16.04-CUDA8-cudNN5.0 (GCC 5.4.0)
        * Path: ``/usr/local/packages/singularity/images/torch/v7-GPU-Ubuntu16.04-CUDA8-cudNN5.0.img``
        * Def file: :download:`/sharc/software/apps/apptainer/torch_gpu.def </sharc/software/apps/apptainer/torch_gpu.def>`


Loading Torch module
--------------------

A Torch module can be loaded with the folllowing command: ::

  module load apps/torch/7/gcc-4.9.4-cuda-8.0-cudnn-5.1


Torch can then be run using the ``th`` command for the console mode: ::

  th
   ______             __   |  Torch7
  /_  __/__  ________/ /   |  Scientific computing for Lua.
   / / / _ \/ __/ __/ _ \  |  Type ? for help
  /_/  \___/_/  \__/_//_/  |  https://github.com/torch
                           |  http://torch.ch

  th>

Or you can specify a lua script after the ``th`` command: ::

  th myscript.lua
