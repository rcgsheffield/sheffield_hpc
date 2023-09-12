.. _tensorflow_stanage:

TensorFlow
==========

.. sidebar:: TensorFlow

   :URL: https://www.tensorflow.org/

TensorFlow is an open source software library for numerical computation using data flow graphs.
Nodes in the graph represent mathematical operations,
while the graph edges represent the multidimensional data arrays (tensors) communicated between them.
The flexible architecture allows you to deploy computation to
one or more CPUs or GPUs in a desktop, server, or mobile device
with a single API.
TensorFlow was originally developed by researchers and engineers working on the Google Brain Team
within Google's Machine Intelligence research organization
for the purposes of conducting machine learning and deep neural networks research,
but the system is general enough to be applicable in a wide variety of other domains as well.

About TensorFlow on Stanage
----------------------------

.. note::
   A GPU-enabled worker node must be requested in order to use the GPU version of this software.
   See :ref:`gpu_computing_stanage` for more information.

As TensorFlow and all its dependencies are written in Python,
it can be installed locally in your home directory.
The use of Anaconda (:ref:`python_stanage`) is recommended as
it is able to create a virtual environment in your home directory,
allowing the installation of new Python packages without needing admin permissions.

.. 
.. note::
   If you are wanting to use TensorFlow with GPUs on Stanage:
   
   Be aware that official TensorFlow releases don't (yet) come with CUDA code compiled to target the ``sm_90`` NVIDIA Compute Capability (required by H100 GPUs - see :ref:`Stanage specs <stanage-gpu-specs>`).
   Attempts to run TensorFlow on H100 nodes will result in GPU-architecture-independent 'PTX' code that is bundled with TensorFlow being compiled on the fly to target the ``sm_90`` NVIDIA Compute Capability.
   Be warned that this process can take up to ~30 minutes.

.. include:: /referenceinfo/imports/stanage/h100-gpu-opt-in-warning.rst

Installation in Home Directory - CPU Version
--------------------------------------------

In order to to install to your home directory,
Conda is used to create a virtual python environment for installing your local version of TensorFlow.

First request an interactive session, e.g. with :ref:`submit_interactive_stanage`.

Then TensorFlow can be installed by the following: ::

   # Load the conda module
   module load Anaconda3/2022.10

   # Create an conda virtual environment called 'tensorflow'
   conda create -n tensorflow python=3.10

   # Activate the 'tensorflow' environment
   source activate tensorflow

   pip install tensorflow

**Every Session Afterwards and in Your Job Scripts**

Every time you use a new session or within your job scripts, the modules must be loaded and Conda must be activated again.
Use the following command to activate the Conda environment with TensorFlow installed: ::

   module load Anaconda3/2022.10
   source activate tensorflow

Installation in Home Directory - GPU Version
--------------------------------------------

The GPU version of TensorFlow is a distinct Pip package and
is also dependent on CUDA and cuDNN libraries,
making the installation procedure slightly different.

.. warning::
   You will need to ensure you load CUDA and cuDNN modules which are compatible with the version of TensorFlow used (see :ref:`table<tensorflow_cudnn_compat_stanage>`).

First request an interactive session, e.g. see :ref:`gpu_interactive_stanage`.

Then GPU version of TensorFlow can be installed by the following ::

   # Load the conda module
   module load Anaconda3/2022.10

   # Load the CUDA and cuDNN module
   module load cuDNN/8.7.0.84-CUDA-11.8.0

   # Create an conda virtual environment called 'tensorflow-gpu'
   conda create -n tensorflow-gpu python=3.6

   # Activate the 'tensorflow-gpu' environment
   source activate tensorflow-gpu

   # Install GPU version of TensorFlow
   pip install tensorflow==2.12.0

To install a different version of ``tensorflow`` other than the latest version
you should specify a version number when running ``pip install`` i.e. ::

   pip install tensorflow==<version_number>

**Every Session Afterwards and in Your Job Scripts**

Every time you use a new session or within your job scripts, the modules must be loaded and Conda must be activated again.
Use the following command to activate the Conda environment with TensorFlow installed: ::

   module load Anaconda3/2022.10
   module load cuDNN/8.7.0.84-CUDA-11.8.0
   source activate tensorflow-gpu

Testing your TensorFlow installation
------------------------------------

You can test that TensorFlow is running on the GPU with the following Python code
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

Which when run should give the following results: ::

	[[ 22.  28.]
	 [ 49.  64.]]

CUDA and cuDNN Import Errors
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TensorFlow releases depend on specific versions of both CUDA and cuDNN.
If the wrong cuDNN module is loaded, you may receive ``ImportError`` runtime errors such as: ::

   ImportError: libcublas.so.10.0: cannot open shared object file: No such file or directory

This indicates that TensorFlow was expecting to find CUDA 10.0 (and an appropriate version of cuDNN) but was unable to do so.

The following table shows the which module to load for the various versions of TensorFlow,
based on the `tested build configurations <https://www.tensorflow.org/install/source#linux>`_.

.. _tensorflow_cudnn_compat_stanage:

.. include:: /referenceinfo/imports/software/tensorflow/compat-table-import.rst

Training
--------

The Research Software Engineering team has an `introductory workshop on deep learning with the TensorFlow Keras framework <https://rses-dl-course.github.io/>__`.
