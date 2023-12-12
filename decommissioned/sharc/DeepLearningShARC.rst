.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _DeepLearning_sharc:

Deep Learning on ShARC
======================

The availability of large amount of data, exponential power in parallel computation hardware and new algorightms has sparked a revolution in the field of Neural Networks. In particular, the Deep Learning approach that uses Neural Network with many layers allowing it to learn highly abstract concepts have been successfully applied to image idenfification and segmentation, voice recognition, autonomous driving and machine translation.

Deep Learning Consultancy, Training & Support
---------------------------------------------

The `Research Software Engineering Sheffield (RSES) <https://rse.shef.ac.uk/>`_ group is responsible for supporting Deep Learning software on ShARC. Please file any Deep Learning related issues on our `GPU Computing Github respository <https://github.com/RSE-Sheffield/GPUComputing>`_.

**If you have a research project that requires Deep Learning expertise or support, members of the RSES team are available to be costed on your grants. Contact** `rse@shef.ac.uk <rse@shef.ac.uk>`_ **for more information.**

Available Software
------------------
The following are the list of currently supported Deep Learning frameworks available on ShARC:

* :ref:`caffe_sharc`
* :ref:`tensorflow_sharc`
* :ref:`theano_sharc`
* :ref:`torch_sharc`

Deep Learning frameworks often have a complex set of software requirements. With the introduction of Apptainer/Singularity on ShARC, a containerisation technology similar to Docker, it is now possible for you to create a software stack that exactly fits your needs and will run on both your local development machine and the ShARC cluster (see :ref:`apptainer_sharc`).

Use of GPUs for training Neural Networks
----------------------------------------

The ability for GPUs to perform massive amounts of floating point operations and matrix multiplications in parallel makes the hardware ideal for use in training Neural Network models and can often accelerate the process by at least an order of magnitude compared to the use of standard CPUs.

See :ref:`GPUResources_sharc` for more information on the GPU resources available on ShARC.

Nvidia DGX-1 Deep Learning Supercomputer
----------------------------------------

The Nvidia DGX-1 is the world's first Deep Learning supercomputer. It is available to use for research groups within the Computer Science deparment. See :ref:`dgx1_dcs_groupnodes_sharc` for more information.

Training Materials
------------------

The Research Software Engineering team has an `introductory workshop on deep learning with the TensorFlow Keras framework <https://rses-dl-course.github.io/>__`.

