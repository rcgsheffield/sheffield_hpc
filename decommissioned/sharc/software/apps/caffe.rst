.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _caffe_sharc:

Caffe
=====

.. sidebar:: Caffe

   :URL: http://caffe.berkeleyvision.org/

`Caffe <http://caffe.berkeleyvision.org/>`_ is a Deep Learning framework made with expression, speed, and modularity in mind. It is developed by the Berkeley Vision and Learning Center (`BVLC <http://bvlc.eecs.berkeley.edu/>`_) and by community contributors.

About Caffe on ShARC
--------------------

.. note::

   The use of Caffe is no longer recommended; the last release of Caffe was in 2017.

A GPU-enabled worker node must be requested in order to use the GPU version of this software. See :ref:`GPUComputing_sharc` for more information.

Caffe is available on ShARC as both Apptainer/Singularity images and as a module.


Caffe Apptainer/Singularity Images
----------------------------------

Apptainer (previously known as Singularity) images are self-contained virtual machines similar to Docker. For more information on Apptainer and how to use the images, see :ref:`apptainer_sharc`.

A symlinked file is provided that always point to the latest image: ::

  #CPU Caffe
  /usr/local/packages/singularity/images/caffe/cpu.img

  #GPU Caffe
  /usr/local/packages/singularity/images/caffe/gpu.img

To get a bash terminal in to an image for example, use the command: ::

  apptainer exec --nv /usr/local/packages/singularity/images/caffe/gpu.img /bin/bash

The ``exec`` command can also be used to call any command/script inside the image e.g. ::

  apptainer exec --nv /usr/local/packages/singularity/images/caffe/gpu.img caffe train -solver=your_solver.prototxt

**The** ``--nv`` **flag enables the use of GPUs within the image and can be removed if the software you're using does not use the GPU.**

You may get a warning similar to ``groups: cannot find name for group ID ...``, this can be ignored and will not have an affect on running the image.

The paths ``/fastdata``, ``/data``, ``/home``, ``/scratch``, ``/shared`` are automatically mounted to your ShARC filestore directories. For GPU-enabled images the ``/nvlib`` and ``/nvbin`` is mounted to the correct Nvidia driver version for the node that you're using.

**To submit jobs that use an Apptainer image, see** :ref:`use_image_batch_apptainer_sharc` **for more detail.**


Image Index
^^^^^^^^^^^

Paths to the actual images and definition files are provided below for downloading and building of custom images.

* Shortcut to Latest Image
    * CPU
        * ``/usr/local/packages/singularity/images/caffe/cpu.img``
    * GPU
        * ``/usr/local/packages/singularity/images/caffe/gpu.img``
* CPU Images
    * Latest: 1.0.0-CPU-Ubuntu16.04 (Python 2.7)
        * Path: ``/usr/local/packages/singularity/images/caffe/1.0.0-cpu-ubuntu16.04.img``
    * rc3-CPU-Ubuntu16.04 (Python 2.7)
        * Path: ``/usr/local/packages/singularity/images/caffe/rc3-CPU-Ubuntu16.04.img``
    * Def file: :download:`/sharc/software/apps/apptainer/caffe_cpu.def </decommissioned/sharc/software/apps/apptainer/caffe_cpu.def>`
* GPU Images
    * Latest: 1.0.0-GPU-Ubuntu16.04-CUDA8-cudNN5.0 (Python 2.7)
        * Path: ``/usr/local/packages/singularity/images/caffe/1.0.0-gpu-ubuntu16.04-cuda8-cudnn6.0.img``
    * rc3-GPU-Ubuntu16.04-CUDA8-cudNN5.0 (Python 2.7)
        * Path: ``/usr/local/packages/singularity/images/caffe/rc3-GPU-Ubuntu16.04-CUDA8-cudNN5.0.img``
    * Def file: :download:`/sharc/software/apps/apptainer/caffe_gpu.def </decommissioned/sharc/software/apps/apptainer/caffe_gpu.def>`

Using the Caffe Module
----------------------

First request a GPU interactive session (see :ref:`GPUInteractive_sharc`).

The Caffe module can be loaded with the following command:   ::

  module load apps/caffe/rc5/gcc-4.9.4-cuda-8.0-cudnn-5.1

Installing Additional Python Modules (Optional)
-----------------------------------------------

The Caffe module is pre-installed with Anaconda version 3.4.2. You can install additional python packages by creating a virtual python environment in your home directory using conda. ::

  #Creates a conda environment named caffe
	conda create -n caffe python=3.5
  #Activates the caffe python environment
  source activate caffe


You will also need to install ``numpy`` which can be obtained from the conda repository. ::

	conda install numpy


Every Session Afterwards and in Your Job Scripts
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If you created a virtual python environment, you must activate it at every new session and within your job scripts: ::

	module load apps/caffe/rc5/gcc-4.9.4-cuda-8.0-cudnn-5.1

  #Activation below is only needed if you've installed your on python modules
  source activate caffe

Installation Notes
------------------

For the module: ::

  module load apps/caffe/rc5/gcc-4.9.4-cuda-8.0-cudnn-5.1

The following modules are automatically loaded:
  * GCC 4.9.4
  * CUDA 8
  * cuDNN 5.1

And comes with the following libraries:
  * Anaconda 4.2.0 (Python 3)
  * boost
  * protobuf
  * hdf5
  * snappy
  * glog
  * gflags
  * openblas
  * leveldb
  * lmdb
  * yasm
  * libx264
  * libx265
  * libfdk_acc
  * libopus
  * libogg
  * libvorbis
  * freetype
  * ffmpeg
  * libjpeg
  * libpng
  * libtiff
  * opencv 3.2.0

