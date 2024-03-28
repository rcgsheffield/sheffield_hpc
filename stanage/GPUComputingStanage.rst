.. _gpu_computing_stanage:

Using GPUs on Stanage
=====================

There are two types of GPU node in Stanage which differ in terms of 
GPU architecture (NVIDIA A100 and H100), 
the number of GPUs per node and 
GPU interconnect technologies (inc bandwidth)
(see :ref:`Stanage hardware specifications <stanage-gpu-specs>`).  
At present you need to decide which node type to target when 
submitting a batch job or 
starting an interactive session on a worker node.

.. _gpu_interactive_stanage:

Interactive use of the GPUs
---------------------------

.. note::

  See :ref:`requesting an interactive session on slurm <submit_interactive_stanage>` if you're not already familiar with the concept.

To start an interactive session with access to one GPU on a GPU node (:ref:`Stanage hardware specifications <stanage-gpu-specs>`):



.. tabs::

   .. group-tab:: A100 GPU node(s)

      .. code-block:: sh

         srun --partition=gpu --qos=gpu --gres=gpu:1 --pty bash

   .. group-tab:: H100 GPU node(s)

      .. code-block:: sh

         srun --partition=gpu-h100 --qos=gpu --gres=gpu:1 --pty bash


Note it's not possible to request GPUs using ``--gpus=N`` on Stanage at this time (unlike on Bessemer).

.. include:: /referenceinfo/imports/stanage/h100-gpu-opt-in-warning.rst

Interactive sessions provide you with 2 GB of CPU RAM by default,
which is significantly less than the amount of GPU RAM available on a single GPU.
This can lead to issues where your session has insufficient CPU RAM to transfer data to and from the GPU.
As such, it is recommended that you request enough CPU memory to communicate properly with the GPU e.g.

.. code-block:: sh

   # NB Each NVIDIA A100 (and H100) GPU in Stanage has 80GB of GPU RAM
   srun --partition=gpu --qos=gpu --gres=gpu:1 --mem=82G --pty bash

The above will give you 2GB more CPU RAM than the 80GB of GPU RAM available on an NVIDIA A100 (and H100).

.. _gpu_jobs_stanage:

Submitting GPU batch jobs
-------------------------

.. note::

  See :ref:`submitting jobs on slurm <submit_job_stanage>` if you're not already familiar with the concept.

To run batch jobs on GPU nodes, ensure your job submission script includes a request for GPUs,
e.g. for two GPUs use ``--gres=gpu:2``:

.. tabs::

   .. group-tab:: A100 node(s)

      .. code-block:: sh

         #!/bin/bash
         #SBATCH --partition=gpu
         #SBATCH --qos=gpu
         #SBATCH --gres=gpu:2
         #SBATCH --mem=82G

         # Your code below...

   .. group-tab:: H100 node(s)

      .. code-block:: sh

         #!/bin/bash
         #SBATCH --partition=gpu-h100
         #SBATCH --qos=gpu
         #SBATCH --gres=gpu:2
         #SBATCH --mem=82G

         # Your code below...

Requesting GPUs and multiple CPU cores from the scheduler
---------------------------------------------------------

To request four separate Slurm tasks within a job, each of which has four CPU cores and with four (A100) GPUs available to the entire job (shared between tasks):

.. code-block:: sh

    #!/bin/bash
    #SBATCH --partition=gpu
    #SBATCH --qos=gpu
    #SBATCH --nodes=1
    #SBATCH --ntasks=4
    #SBATCH --cpus-per-task=4
    #SBATCH --gres=gpu:4       # 4 GPUs for job

Note that:

* The GPUs are (unintuitively) shared between the Slurm tasks.
* It's not possible to request ``--gpus-per-node``, ``--gpus-per-task`` or ``--gpus-per-socket`` on Stanage at this time (unlike on Bessemer).
* Not all nodes have four GPUs (:ref:`Stanage hardware specifications <stanage-gpu-specs>`).

.. _gpu_resources_stanage:

Stanage GPU Resources
---------------------

GPU-enabled Software
^^^^^^^^^^^^^^^^^^^^

* Applications

  * None yet

* Libraries

  * :ref:`cuda_stanage`
  * :ref:`cudnn_stanage`

* Development Tools

  * :ref:`nvidia_compiler_stanage`

Training materials
------------------

* The Research Software Engineering team have developed an undergraduate teaching module on CUDA;
  `lecture notes and lecture recordings for that module are accessible here <https://rse.shef.ac.uk/training/com4521>`_ for anyone with a University account.
