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

.. _GPUResources_bessemer_tmp_a100_nodes:

Temporary NVIDIA A100 GPU nodes
-------------------------------

Prior to May 2022 the Bessemer cluster only featured :ref:`one 'public' GPU node <bessemer-gpu-specs>` containing NVIDIA V100 GPUs
(although private GPU nodes could be accessed using :ref:`preemptable jobs, for those whose workflows could tolerate preemption<preemptable_jobs_bessemer>`).

As of May 2022, 16 addtional GPUs nodes are (temporarily) available to all users of Bessemer.  
These feature **NVIDIA A100 GPUs, which may be quite a bit faster than the (older generation) V100 GPUs** available elsewhere in Bessemer.

.. warning::
   These nodes are being made available to Bessemer's users on a temporary basis
   as they will be migrated to the University's new cluster
   when that comes online in summer 2022.

Specifications per A100 node:

* Chassis: Dell XE8545
* CPUs: 48 CPU cores from 2x AMD EPYC 7413 CPUs (*AMD Milan* aka *AMD Zen 3* microarchitecture; 2.65 GHz; 128MB L3 cache per CPU)
* RAM: 512 GB (3200 MT/s)
* Local storage: 460 GB boot device (SSD) plus 2.88 TB :ref:`'/scratch' temporary storage<scratch_dir>` (RAID 0 on SSDs)
* GPUs: 4x `NVIDIA Tesla A100 <https://www.nvidia.com/en-gb/data-center/a100/>`__, each with

  * High-bandwidth, low-latency `NVLink <https://www.nvidia.com/en-gb/design-visualization/nvlink-bridges/>`__ GPU interconnects
  * 80GB memory (HBM2e)

.. warning::

   Much of the :ref:`existing centrally-provided software on Bessemer <bessemer-software>` won't work on
   the AMD CPUs in these nodes as it has been heavily optimised for Intel CPUs.

   Attempts to run Intel-optimised software on these nodes
   will often result in *illegal instruction* errors.

   A limited number of software packages have been provided 
   for use on these nodes whilst they are temporarily available in Bessemer:

   * Some packages have been compiled and optimised for the AMD Milan CPUs in these nodes
   * Other software isn't overly optimised for AMD Milan or Intel 
     (typically as it's pre-compiled binaries provided by software vendors)

   See the example below where we change our modules source from the normal Bessemer software packages modules to
   AMD-compatible modules by 'unusing' the default modules area and 'using' the alternate ``eb-znver3`` area.
   Available modules can then be listed with the ``modules avail`` command."

   Note that if you've compiled any software in your :ref:`home, fastdata or shared areas <filestore>`
   using other nodes in Bessemer then this may or may not run on these AMD nodes
   depending on the extent to which the compilation process optimised the code for Intel CPUs.
   You may need to recompile.

   Many users of these nodes will want to use the 
   :ref:`Conda <python_conda_bessemer>` package manager 
   to install software; 
   most software installed via Conda will work fine on these AMD Milan CPUs *but*
   the default library used by numpy, pandas etc for linear algebra, the *Intel MKL*, 
   isn't particularly performant on these CPUs.
   If you can't offload your linear algebra onto the GPUs in these nodes then you 
   may want to switch to using an alternative library for linear algebra e.g. ::

      conda create -n my_non_intel_env1 -c anaconda python numpy scipy blas=*=*openblas openblas
      . activate my_non_intel_env1

   Or you can try using an older version of the Intel MKL instead,
   where there's a special trick for enabling better performance on AMD CPUs: ::

      conda create -n my_non_intel_env2 -c anaconda python numpy mkl=2019.* blas=*=*mkl
      . activate my_non_intel_env2
      conda env config vars set MKL_DEBUG_CPU_TYPE=5
      deactivate
      . activate my_non_intel_env2

Interactive usage/access
^^^^^^^^^^^^^^^^^^^^^^^^

Start an interactive session on the A100 nodes (in this case with just one A100 GPU): ::

   srun --pty --partition=gpu-a100-tmp --qos=gpu --gpus-per-node=1 /bin/bash -i
 
Activate software that has been optimised for the AMD Milan CPUs in these nodes: ::

   module unuse /usr/local/modulefiles/live/eb/all 
   module unuse /usr/local/modulefiles/live/noeb
   module use /usr/local/modulefiles/staging/eb-znver3/all/

List software available for use on these nodes: ::

   module avail

Batch job usage/access
^^^^^^^^^^^^^^^^^^^^^^

Within your job script(s):

* Ensure you include the ``#SBATCH`` lines in :ref:`GPUJobs_bessemer` but change ``--partition`` from ``gpu`` to ``gpu-a100-tmp``;
* Below that include the three ``module unuse`` / ``module use`` lines shown above before you run any software.

Compiling for A100 GPUs
^^^^^^^^^^^^^^^^^^^^^^^

See :ref:`here <bessemer_gpu_code_gen_opts>`.

More information on using AMD CPUs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

More detailed information on building and running software on AMD EPYC CPUs (e.g. AMD Milan):
`PRACE's Best Practice Guide - AMD EYPC <https://prace-ri.eu/wp-content/uploads/Best-Practice-Guide_AMD.pdf>`__.

Training materials
------------------

* `Introduction to CUDA by GPUComputing@Sheffield <https://gpucomputing.shef.ac.uk/education/cuda/>`_

