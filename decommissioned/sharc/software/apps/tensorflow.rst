.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _tensorflow_sharc:

Tensorflow
==========

.. sidebar:: Tensorflow

   :URL: https://www.tensorflow.org/

TensorFlow is an open source software library for numerical computation using data flow graphs. Nodes in the graph represent mathematical operations, while the graph edges represent the multidimensional data arrays (tensors) communicated between them. The flexible architecture allows you to deploy computation to one or more CPUs or GPUs in a desktop, server, or mobile device with a single API. TensorFlow was originally developed by researchers and engineers working on the Google Brain Team within Google's Machine Intelligence research organization for the purposes of conducting machine learning and deep neural networks research, but the system is general enough to be applicable in a wide variety of other domains as well.

About Tensorflow on ShARC
-------------------------

**A GPU-enabled worker node must be requested in order to use the GPU version of this software. See** :ref:`GPUComputing_sharc` **for more information.**

Tensorflow is available on ShARC as both Apptainer (previously known as Singularity) images and by local installation.

As Tensorflow and all its dependencies are written in Python, it can be installed locally in your home directory. The use of Anaconda (:ref:`sharc-python-conda`) is recommended as it is able to create a virtual environment in your home directory, allowing the installation of new Python packages without admin permission.

Installation in Home Directory - CPU Version
--------------------------------------------

In order to to install to your home directory, Conda is used to create a virtual python environment for installing your local version of Tensorflow.

First request an interactive session with 4GB of memory via the :ref:`qrshx` command: ::

	qrshx -l rmem=4G

Then Tensorflow can be installed by the following ::

  #Load the conda module
  module load apps/python/conda

  #Create an conda virtual environment called 'tensorflow'
  conda create -n tensorflow python=3.6

  #Activate the 'tensorflow' environment
  source activate tensorflow

  pip install tensorflow


**Every Session Afterwards and in Your Job Scripts**

Every time you use a new session or within your job scripts, the modules must be loaded and conda must be activated again. Use the following command to activate the Conda environment with Tensorflow installed: ::

  module load apps/python/conda
  source activate tensorflow


Installation in Home Directory - GPU Version
--------------------------------------------

The GPU version of Tensorflow comes in a different PIP package and is also dependent on CUDA and cuDNN libraries making the installation procedure slightly different.

.. warning::
   You will need to ensure you load CUDA and cuDNN modules which are compatible with the version of TensorFlow used (see :ref:`table<tensorflow_cudnn_compat_sharc>`).


First request an interactive session, e.g. see :ref:`GPUInteractive_sharc`.

Then GPU version of Tensorflow can be installed by the following ::

  #Load the conda module
  module load apps/python/conda

  #Load the CUDA and cuDNN module
  module load libs/cudnn/7.5.0.56/binary-cuda-10.0.130

  #Create an conda virtual environment called 'tensorflow-gpu'
  conda create -n tensorflow-gpu python=3.6

  #Activate the 'tensorflow-gpu' environment
  source activate tensorflow-gpu

  #Install GPU version of Tensorflow 2.0
  pip install tensorflow-gpu==2.0

If you wish to use an older version of tensorflow-gpu, you can do so using :code:`pip install tensorflow-gpu==<version_number>`
   
**Every Session Afterwards and in Your Job Scripts**

Every time you use a new session or within your job scripts, the modules must be loaded and conda must be activated again. Use the following command to activate the Conda environment with Tensorflow installed: ::

  module load apps/python/conda
  module load libs/cudnn/7.5.0.56/binary-cuda-10.0.130
  source activate tensorflow-gpu


Testing your Tensorflow installation
------------------------------------

You can test that Tensorflow is running on the GPU with the following Python code
(requires TensorFlow >= 2): ::

   import tensorflow as tf

   tf.debugging.set_log_device_placement(True)

   # Creates a graph
   # (ensure tensors placed on the GPU)
   with tf.device('/device:GPU:0'):
       a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
       b = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[3, 2], name='b')
       c = tf.matmul(a, b)

   # Runs the op.
   print(c)

Which gives the following results ::

	[[ 22.  28.]
	 [ 49.  64.]]

CUDA and CUDNN Import Errors
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Tensorflow releases depend on specific versions of both CUDA and CUDNN. If the wrong CUDNN module is loaded, you may receive an :code:`ImportError` runtime errors such as: 

.. code-block:: python

   ImportError: libcublas.so.10.0: cannot open shared object file: No such file or directory


This indicates that Tensorflow was expecting to find CUDA 10.0 (and an appropriate version of CUDNN) but was unable to do so.

The following table shows which module to load for the various versions of Tensorflow, based on the `tested build configurations <https://www.tensorflow.org/install/source#linux>`_. 

.. _tensorflow_cudnn_compat_sharc:

+------------+------+--------+----------------------------------------------+
| Tensorflow | CUDA | CUDNN  | Module                                       |
+============+======+========+==============================================+
| 2.11.0     | 11.2 | >= 8.1 | ``libs/cudnn/8.1.1.33/binary-cuda-11.2.0``   |
+------------+------+--------+----------------------------------------------+
| 2.10.0     | 11.2 | >= 8.1 | ``libs/cudnn/8.1.1.33/binary-cuda-11.2.0``   |
+------------+------+--------+----------------------------------------------+
| 2.9.0      | 11.2 | >= 8.1 | ``libs/cudnn/8.1.1.33/binary-cuda-11.2.0``   |
+------------+------+--------+----------------------------------------------+
| 2.8.0      | 11.2 | >= 8.1 | ``libs/cudnn/8.1.1.33/binary-cuda-11.2.0``   |
+------------+------+--------+----------------------------------------------+
| 2.7.0      | 11.2 | >= 8.1 | ``libs/cudnn/8.1.1.33/binary-cuda-11.2.0``   |
+------------+------+--------+----------------------------------------------+
| 2.6.0      | 11.2 | >= 8.1 | ``libs/cudnn/8.1.1.33/binary-cuda-11.2.0``   |
+------------+------+--------+----------------------------------------------+
| 2.5.0      | 11.2 | >= 8.1 | ``libs/cudnn/8.1.1.33/binary-cuda-11.2.0``   |
+------------+------+--------+----------------------------------------------+
| 2.3.0      | 10.1 | >= 7.6 | ``libs/cudnn/7.6.5.32/binary-cuda-10.1.243`` |
+------------+------+--------+----------------------------------------------+
| 2.2.0      | 10.1 | >= 7.6 | ``libs/cudnn/7.6.5.32/binary-cuda-10.1.243`` |
+------------+------+--------+----------------------------------------------+
| 2.1.0      | 10.1 | >= 7.4 | ``libs/cudnn/7.6.5.32/binary-cuda-10.1.243`` |
+------------+------+--------+----------------------------------------------+
| 2.0.0      | 10.0 | >= 7.4 | ``libs/cudnn/7.5.0.56/binary-cuda-10.0.130`` |
+------------+------+--------+----------------------------------------------+
| 1.14.0     | 10.0 | >= 7.4 | ``libs/cudnn/7.5.0.56/binary-cuda-10.0.130`` |
+------------+------+--------+----------------------------------------------+
| 1.13.1     | 10.0 | >= 7.4 | ``libs/cudnn/7.5.0.56/binary-cuda-10.0.130`` |
+------------+------+--------+----------------------------------------------+
| >= 1.5.0   | 9.0  | 7      | ``libs/cudnn/7.3.1.20/binary-cuda-9.0.176``  |
+------------+------+--------+----------------------------------------------+
| >= 1.3.0   | 8.0  | 6      | ``libs/cudnn/6.0/binary-cuda-8.0.44``        |
+------------+------+--------+----------------------------------------------+
| >= 1.0.0   | 8.0  | 5.1    | ``libs/cudnn/5.1/binary-cuda-8.0.44``        |
+------------+------+--------+----------------------------------------------+

Training
--------

The Research Software Engineering team has an `introductory workshop on deep learning with the TensorFlow Keras framework <https://rses-dl-course.github.io/>__`.

Tensorflow Apptainer/Singularity Images
---------------------------------------

.. note::
 Tensorflow Apptainer image support is now discontinued as the use of conda virtual environments is deemed to be more customisable and simpler to use. Existing images will still be available but to use a newer version of tensorflow, please follow instructions above to install Tensorflow to your home directory.

Apptainer images are self-contained virtual machines similar to Docker. For more information on Apptainer and how to use the images, see :ref:`apptainer_sharc`.

A symlinked file is provided that always point to the latest image:  ::

 # CPU Tensorflow
 /usr/local/packages/singularity/images/tensorflow/cpu.img

 # GPU Tensorflow
 /usr/local/packages/singularity/images/tensorflow/gpu.img

To get a bash terminal in to an image for example, use the command: ::

 apptainer exec --nv /usr/local/packages/singularity/images/tensorflow/gpu.img /bin/bash

The ``exec`` command can also be used to call any command/script inside the image e.g. ::

 apptainer exec --nv /usr/local/packages/singularity/images/tensorflow/gpu.img python your_tensorflow_script.py

**The** ``--nv`` **flag enables the use of GPUs within the image and can be removed if the software you're using does not use the GPU.**

You may get a warning similar to ``groups: cannot find name for group ID ...``, this can be ignored and will not have an affect on running the image.

The paths ``/fastdata``, ``/data``, ``/home``, ``/scratch``, ``/shared`` are automatically mounted to your ShARC filestore directories. For GPU-enabled images the ``/nvlib`` and ``/nvbin`` is mounted to the correct Nvidia driver version for the node that you're using.

Tensorflow is installed as part of Anaconda and can be found inside the image at: ::

 /usr/local/anaconda3-4.2.0/lib/python3.5/site-packages/tensorflow


**To submit jobs that uses an Apptainer image, see** :ref:`use_image_batch_apptainer_sharc` **for more detail.**

Image Index
^^^^^^^^^^^

Paths to the actual images and definition files are provided below for downloading and building of custom images.

* Shortcut to Latest Image
   * CPU
       * ``/usr/local/packages/singularity/images/tensorflow/cpu.img``
   * GPU
       * ``/usr/local/packages/singularity/images/tensorflow/gpu.img``
* CPU Images
   * Latest: 1.9.0-CPU-Ubuntu16.04-Anaconda3.4.2.0.simg (GCC 5.4.0, Python 3.5)
       * Path: ``/usr/local/packages/singularity/images/tensorflow/1.9.0-CPU-Ubuntu16.04-Anaconda3.4.2.0.simg``
   * 1.5.0-CPU-Ubuntu16.04-Anaconda3.4.2.0.img (GCC 5.4.0, Python 3.5)
       * Path: ``/usr/local/packages/singularity/images/tensorflow/1.5.0-CPU-Ubuntu16.04-Anaconda3.4.2.0.img``
   * 1.0.1-CPU-Ubuntu16.04-Anaconda3.4.2.0.img (GCC 5.4.0, Python 3.5)
       * Path: ``/usr/local/packages/singularity/images/tensorflow/1.0.1-CPU-Ubuntu16.04-Anaconda3.4.2.0.img``
* GPU Images
   * Latest: 1.9.0-GPU-Ubuntu16.04-Anaconda3.4.2.0-CUDA9-cudNN7.simg (GCC 5.4.0, Python 3.5)
       * Path: ``/usr/local/packages/singularity/images/tensorflow/1.9.0-GPU-Ubuntu16.04-Anaconda3.4.2.0-CUDA9-cudNN7.simg``
   * 1.5.0-GPU-Ubuntu16.04-Anaconda3.4.2.0-CUDA9-cudNN7.img (GCC 5.4.0, Python 3.5)
       * Path: ``/usr/local/packages/singularity/images/tensorflow/1.5.0-GPU-Ubuntu16.04-Anaconda3.4.2.0-CUDA9-cudNN7.img``
   * 1.0.1-GPU-Ubuntu16.04-Anaconda3.4.2.0-CUDA8-cudNN5.0.img (GCC 5.4.0, Python 3.5)
       * Path: ``/usr/local/packages/singularity/images/tensorflow/1.0.1-GPU-Ubuntu16.04-Anaconda3.4.2.0-CUDA8-cudNN5.0.img``

