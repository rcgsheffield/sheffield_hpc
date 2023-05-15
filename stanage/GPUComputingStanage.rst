.. _gpu_computing_stanage:

Using GPUs on Stanage
=====================


.. _gpu_interactive_stanage:

Interactive use of the GPUs
---------------------------

.. note::

  See :ref:`requesting an interactive session on slurm <submit_interactive_stanage>` if you're not already familiar with the concept.

To start an interactive session with access to one GPU (``--gres=gpu:1``) on a GPU node (:ref:`Stanage hardware specifications <stanage-gpu-specs>`):

.. code-block:: sh

   srun --partition=gpu --qos=gpu --gres=gpu:1 --pty bash

By default you'll be allocated resources on an A100 node, or an H100 node if no A100 nodes are free.
To explicitly request a particular type of GPU architecture use one of the following instead:

* ``--gres=gpu:a100:1``
* ``--gres=gpu:h100:1``

Note it's not possible to request GPUs using ``--gpus=N`` on Stanage at this time (unlike on Bessemer).

Be aware that some GPU nodes have more GPUs per node than others and some have more inter-GPU bandwidth than others;
see :ref:`Stanage hardware specifications <stanage-gpu-specs>`.

Interactive sessions provide you with 2 GB of CPU RAM by default,
which is significantly less than the amount of GPU RAM available on a single GPU.
This can lead to issues where your session has insufficient CPU RAM to transfer data to and from the GPU.
As such, it is recommended that you request enough CPU memory to communicate properly with the GPU:

.. code-block:: sh

   # NB Each NVIDIA A100 and H100 GPU in Stanage has 80GB of GPU RAM
   srun --partition=gpu --qos=gpu --gres=gpu:1 --mem=82G --pty bash

The above will give you 2GB more CPU RAM than the 80GB of GPU RAM available on an NVIDIA A100/H100.

.. _gpu_jobs_stanage:

Submitting batch GPU jobs
-------------------------

.. note::

  See :ref:`submitting jobs on slurm <submit_job_stanage>` if you're not already familiar with the concept.

To run batch jobs on GPU nodes, ensure your job submission script includes a request for GPUs,
e.g. for a single GPU use ``--gres=gpu:1``:

.. code-block:: sh

    #!/bin/bash
    #SBATCH --partition=gpu
    #SBATCH --qos=gpu
    #SBATCH --gres=gpu:1

    #Your code below...


Requesting GPUs and multiple CPU cores from the scheduler
---------------------------------------------------------

To request four separate Slurm tasks within a job, each of which has four CPU cores and with four GPUs available to the entire job (shared between tasks):

.. code-block:: sh

    #!/bin/bash
    #SBATCH --partition=gpu
    #SBATCH --qos=gpu
    #SBATCH --nodes=1
    #SBATCH --ntasks=4
    #SBATCH --cpus-per-task=4
    #SBATCH --gres:gpu=4       # 4 GPUs for job

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
