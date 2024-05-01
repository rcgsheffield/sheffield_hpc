.. _pytorch_stanage:

PyTorch
=======

.. sidebar:: PyTorch

   :URL: https://pytorch.org

PyTorch is an open source machine learning library for Python, based on `Torch <http://torch.ch/>`_.
It is used for applications such as natural language processing.

About PyTorch on Stanage
-------------------------

.. note::
   A GPU-enabled worker node must be requested in order to enable GPU acceleration.
   See :ref:`gpu_computing_stanage` for more information.

As PyTorch and all its dependencies are written in Python, it can be installed locally in your home directory.
The use of Conda (:ref:`python_stanage`) is recommended as
it is able to create virtual environment(s) in your home directory,
allowing for the installation of new Python packages without needing admin permission.

.. note::
   All 'stable' releases of PyTorch to date (up to and including 2.0.1) are not compatible with Stanage nodes with H100 GPUs (see :ref:`Stanage specs <stanage-gpu-specs>`).

   To use PyTorch on the H100 nodes you must install and use a 'nightly' build of PyTorch (see installation instructions below).

Installation in Home Directory
------------------------------

Conda is used to create a virtual python environment for installing your local version of PyTorch.

.. warning::
   Torch requires more than 2GB of CPU RAM for installation
   so you **must** use the ``--mem=8G`` flag to request more memory.
   ``8G`` means 8 GB of CPU RAM.

First request an interactive session, e.g. with :ref:`submit_interactive_stanage` or optionally with GPU :ref:`gpu_interactive_stanage`. 

.. code-block::

   # To request 8GB of CPU RAM for the session
   srun --mem=8G --pty bash

   # NB Each NVIDIA A100 (and H100) GPU in Stanage has 80GB of GPU RAM
   srun --partition=gpu --qos=gpu --gres=gpu:1 --mem=82G --pty bash

.. include:: /referenceinfo/imports/stanage/h100-gpu-opt-in-warning.rst

Then PyTorch can be installed by the following ::

   # Load the conda module
   module load Anaconda3/2022.05

   # (Only needed if we're using GPU) Load a cuDNN module
   # (which in this case implicitly loads CUDA 12.1.1)
   module load cuDNN/8.9.2.26-CUDA-12.1.1

   # Create an conda virtual environment called 'pytorch'
   conda create -n pytorch python=3.10

   # Activate the 'pytorch' environment
   source activate pytorch

   # Install the latest stable PyTorch release if you only want to run PyTorch using A100 GPUs
   python -m pip install torch torchvision
   # Or use a nightly PyTorch build instead if you want to be able to use H100 GPUs also / as well.
   # python -m pip install --pre torch torchvision --index-url https://download.pytorch.org/whl/nightly/cu118


**Every Session Afterwards and in Your Job Scripts**

Every time you use a new session or within your job scripts,
the modules must be loaded and conda must be activated again.
Use the following command to activate the Conda environment with PyTorch installed: ::

   # Load the conda module
   module load Anaconda3/2022.10
   # *Only needed if we're using GPU* Load the CUDA and cuDNN module
   module load cuDNN/8.9.2.26-CUDA-12.1.1
   # Activate the 'pytorch' environment
   source activate pytorch

Testing your PyTorch installation
---------------------------------

To ensure that PyTorch was installed correctly, we can verify the installation by running sample PyTorch code
e.g. an example from the official PyTorch `getting started <https://pytorch.org/get-started/locally/>`_ guide
(replicated below).

Here we construct a randomly-initialized tensor: ::

  import torch
  x = torch.rand(5, 3)
  print(x)

The output should be something similar to: ::

   tensor([[0.3380, 0.3845, 0.3217],
           [0.8337, 0.9050, 0.2650],
           [0.2979, 0.7141, 0.9069],
           [0.1449, 0.1132, 0.1375],
           [0.4675, 0.3947, 0.1426]])

Additionally, to check if your GPU driver and CUDA is enabled and accessible by PyTorch,
run the following commands to return whether or not the CUDA driver is enabled: ::

   import torch
   torch.cuda.is_available()

The output should be: ::

   True
