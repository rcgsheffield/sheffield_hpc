.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _pytorch_sharc:

PyTorch
=======

.. sidebar:: PyTorch

   :URL: https://pytorch.org

PyTorch is an open source machine learning library for Python, based on `Torch <http://torch.ch/>`_, used for applications such as natural language processing.

.. note::

   PyTorch should not be confused with the Lua version of Torch, which is a Lua wrapper around the THNN library.

   The Lua version provides similar functionality but is less actively maintained.
   We recommend most people use PyTorch instead of (Lua) Torch.

   See also the documentation for :ref:`(Lua) Torch on ShARC <torch_sharc>`.

About PyTorch on ShARC
----------------------

**A GPU-enabled worker node must be requested in order to enable GPU acceleration. See** :ref:`GPUComputing_sharc` **for more information.**

As PyTorch and all its dependencies are written in Python, it can be installed locally in your home directory. The use of Anaconda (:ref:`sharc-python-conda`) is recommended as it is able to create a virtual environment in your home directory, allowing the installation of new Python packages without admin permission.

Installation in Home Directory
------------------------------

Conda is used to create a virtual python enviroment for installing your local version of PyTorch.

.. warning::
  Torch requires more than 2GB of RAM for installation so you **must** use the ``-l rmem=8G`` flag to request more memory, ``8G`` means 8 GB of RAM.

First request an interactive session, e.g. with :ref:`qrshx`. or optionally with GPU :ref:`GPUInteractive_sharc`. ::

  #To request 8GB of ram for the session
  qrshx -l rmem=8G

  #OR To request a GPU node with 8GB RAM
  qrshx -l rmem=8G -l gpu=1

Then PyTorch can be installed by the following ::

  #Load the conda module
  module load apps/python/conda

  #*Only needed if we're using GPU* Load the CUDA and cuDNN module
  module load libs/cudnn/7.3.1.20/binary-cuda-9.0.176

  #Create an conda virtual environment called 'pytorch'
  conda create -n pytorch python=3.6

  #Activate the 'pytorch' environment
  source activate pytorch

  #Install PyTorch
  pip install torch torchvision


**Every Session Afterwards and in Your Job Scripts**

Every time you use a new session or within your job scripts, the modules must be loaded and conda must be activated again. Use the following command to activate the Conda environment with PyTorch installed: ::

  #Load the conda module
  module load apps/python/conda
  #*Only needed if we're using GPU* Load the CUDA and cuDNN module
  module load libs/cudnn/7.3.1.20/binary-cuda-9.0.176
  #Activate the 'pytorch' environment
  source activate pytorch

Testing your PyTorch installation
---------------------------------

.. note::
  Taken from the official `getting started <https://pytorch.org/get-started/locally/>`_ page.


To ensure that PyTorch was installed correctly, we can verify the installation by running sample PyTorch code. Here we will construct a randomly initialized tensor. ::

  import torch
  x = torch.rand(5, 3)
  print(x)

The output should be something similar to: ::

  tensor([[0.3380, 0.3845, 0.3217],
          [0.8337, 0.9050, 0.2650],
          [0.2979, 0.7141, 0.9069],
          [0.1449, 0.1132, 0.1375],
          [0.4675, 0.3947, 0.1426]])

Additionally, to check if your GPU driver and CUDA is enabled and accessible by PyTorch, run the following commands to return whether or not the CUDA driver is enabled: ::

  import torch
  torch.cuda.is_available()

