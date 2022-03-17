.. _GPUComputing_bessemer:

Using GPUs on Bessemer
======================


.. _GPUInteractive_bessemer:

Interactive use of the GPUs
---------------------------

.. note::

  See :ref:`requesting an interactive session on slurm <submit_interactive_bessemer>` if you're not already familiar with the concept.

To start using the GPU enabled nodes interactively, type:

.. code-block:: sh

   srun --partition=gpu --qos=gpu --nodes=1 --gpus-per-node=1 --pty bash

The ``--gpus-per-node=1`` parameter determines how many GPUs you are requesting
(just one in this case).
Don't forget to specify ``--nodes=1`` too.
Currently, the maximum number of GPUs allowed per job is set to 4,
as Bessemer is configured to only permit single-node jobs
and GPU nodes contain up to 4 GPUs.
If you think you would benefit from using >4 GPUs in a single job
then consider requesting access to :ref:`jade`.

Interactive sessions provide you with 2 GB of CPU RAM by default,
which is significantly less than the amount of GPU RAM available on a single GPU.
This can lead to issues where your session has insufficient CPU RAM to transfer data to and from the GPU.
As such, it is recommended that you request enough CPU memory to communicate properly with the GPU:

.. code-block:: sh

   # NB Each NVIDIA V100 GPU has 32GB of RAM
   srun --partition=gpu --qos=gpu --nodes=1 --gpus-per-node=1 --mem=34G --pty bash

The above will give you 2GB more CPU RAM than the 32GB of GPU RAM available on the NVIDIA V100.

.. note::

   Some private GPU nodes have only 16GB of GPU RAM per GPU; the users of private GPU nodes should check and be aware of how much GPU memory is available.

.. _GPUJobs_bessemer:

Submitting batch GPU jobs
-------------------------

.. note::

  See :ref:`submitting jobs on slurm <submit_job_bessemer>` if you're not already familiar with the concept.

To run batch jobs on GPU nodes, ensure your job submission script includes a request for GPUs,
e.g. for a single GPU ``--nodes=1 --gpus-per-node=1``:

.. code-block:: sh

    #!/bin/bash
    #SBATCH --partition=gpu
    #SBATCH --qos=gpu
    #SBATCH --nodes=1
    #SBATCH --gpus-per-node=1

    #Your code below...


Requesting GPUs and multiple CPU cores from the scheduler
---------------------------------------------------------

There are two ways of requesting multiple CPUs in conjunction with GPU requests.

* To request multiple CPUs independent of number of GPUs requested, the ``-c`` option is used:

  .. code-block:: sh

      #!/bin/bash
      #SBATCH --partition=gpu
      #SBATCH --qos=gpu
      #SBATCH --nodes=1
      #SBATCH --gpus-per-node=2  # Requests 2 GPUs
      #SBATCH -c=2               # Requests 2 CPUs

  The script above requests 2 CPUs and 2 GPUs.

* To request multiple CPUs based on the number of GPUs requested, the ``--cpus-per-gpu`` option is used:

  .. code-block:: sh

      #!/bin/bash
      #SBATCH --partition=gpu
      #SBATCH --qos=gpu
      #SBATCH --nodes=1
      #SBATCH --gpus-per-node=2  # Requests 2 GPUs
      #SBATCH --cpus-per-gpu=2   # Requests 2 CPUs per GPU requested

  The script above requests 2 GPUs and 2 CPUs **per** GPU for a total of 4 CPUs.

.. _GPUResources_bessemer:

Bessemer GPU Resources
----------------------

GPU-enabled Software
^^^^^^^^^^^^^^^^^^^^

* Applications

  * :ref:`matlab_bessemer`
  * :ref:`tensorflow_bessemer`
  * :ref:`pytorch_bessemer`

* Libraries

  * :ref:`cuda_bessemer`
  * :ref:`cudnn_bessemer`

* Development Tools

  * :ref:`PGI Compilers_bessemer`
  * :ref:`nvidia_compiler_bessemer`

Training materials
^^^^^^^^^^^^^^^^^^

* `Introduction to CUDA by GPUComputing@Sheffield <http://gpucomputing.shef.ac.uk/education/cuda/>`_

