.. _Choosing-appropriate-compute-resources:

*****************************************
Choosing appropriate compute resources
*****************************************

==============
Introduction
==============

Choosing appropriate resources for your jobs is essential to ensuring your jobs will be scheduled as quickly as possible while wasting as little resources as possible.

The key resources you need to optimise for are:


* :ref:`Cluster-choice <Cluster-choice>`
* :ref:`Time-allocation <Time-allocation>`
* :ref:`Cores-allocation <Cores-allocation>`
* :ref:`Memory-allocation <Memory-allocation>`
* :ref:`Filestore-limits <Filestore-limits>`



It is important to be aware that the resource requests that you make are not flexible: if your job exceeds what you have requested for it the scheduler will terminate your job abruptly and without any warning. This means that it is safest to over estimate your job's requirements if they cannot be accurately and precisely known in advance.

This does not mean that you can set extremely large values for these resource requests for several reasons, the most important being:

* Large allocations will take longer to queue and start.
* Allocations larger than the scheduler can ever satisfy with the available resources **will never start.**

.. _Cluster-choice:

==============================
Cluster choice
==============================

We have three cluster choices listed below for you to choose from:

* Stanage (Our newest and most powerful yet, launched in March 2023)
* Bessemer (Launched in 2018)
* ShARC (Launched in 2017)

It is also important to note that the Sheffield HPC clusters have been designed to fulfil different purposes. Stanage and ShARC are for the most part a *capability* cluster designed to run larger compute jobs that will use multiple nodes. Bessemer is a *capacity* cluster designed to run smaller compute jobs which will fit on a single node. In addition, Stanage and Bessemer have newer CPUs with more modern features. Bessemer but does not have a /data filestore.


You should prioritize putting smaller core count jobs onto Bessemer and massively parallel jobs onto Stanage or ShARC (while utilizing a form of :ref:`MPI <parallel_MPI>`).

The specifications for each cluster are detailed for Stanage here :ref:`stanage-specs` , Bessemer here :ref:`bessemer-specs` and ShARC here :ref:`sharc-specs` .

-----------------

.. _Time-allocation:

.. include:: ../referenceinfo/scheduler/TimeAllocationLimits.rst


The time allocation limits will differ between job types and by cluster - a summary of these differences can be seen above. Time requirements are highly dependent on how many CPU cores your job is using - using more cores may significantly decrease the amount of time the job spends running, depending on how optimally the software you are using supports parallelisation. Further details on CPU cores selection can be found in the `CPU cores allocation <#cpu-allocation-limits>`_ section.


Determining time requirements using timing commands in your script
--------------------------------------------------------------------

A way of deducing the "wall clock" time used by a job is to use the date or the timeused command within the script file. The date command is part of the Linux operating system whereas the timeused command is specific to our clusters and provides the usage figures directly rather than having to manually calculate it from two subsequent date commands. Here are some examples -


Using the **date** command: ::

        #$ -l h_rt=10:00:00
        date
        my_program < my_input
        date

When the above script is submitted (via qsub), the job output file will contain the date and time at each invocation of the date command. You can then calculate the difference between these date/times to determine the actual time taken.


Using the **timeused** command: ::

       #$ -l h_rt=10:00:00
       export TIMECOUNTER=0
       source timeused
       my_program < my_input
       source timeused

When the above script is submitted the first invocation of the timeused command will initialise the timer counter due to the fact that TIMECOUNTER variable is set to 0. The subsequent invocations will report the time in hours,minutes and seconds since the first invocation.


-----------------

.. _Cores-allocation:

.. include:: ../referenceinfo/scheduler/CpuAllocationLimits.rst

The CPU allocation limits will differ between job types and by cluster - a summary of these differences can be seen above. It is important to note that SLURM and SGE will request CPU on a different basis as detailed above.



.. include:: ../referenceinfo/scheduler/SGE/sge_parallel_environments.rst

Determining CPU requirements:
----------------------------------

In order to determine your CPU requirements, you should investigate if your program / job supports parallel execution. If the program only supports serial processing, then you can only use 1 CPU core and should be using Bessemer (faster CPUs) to do so.

If your job / program supports multiple cores, you need to assess whether it supports SMP (symmetric multiprocessing) where you can only use CPUs on 1 node or MPI (message passing interface) where you can access as many nodes, CPUs and cores as are available.

For SMP only type parallel processing jobs: you can use a maximum of 64 0n stannage, 40 cores on Bessemer and 16 cores on ShARC. Ideally you should use Stanage or Bessemer as you can not only access more cores, you are using more modern cores.

For multiple node MPI type parallel processing jobs: these can run on both Stanage and ShARC and although you can access as many cores as are available you must consider how long a job will take to queue waiting for resources compared the the decrease in time for the job to complete computation.

Single node MPI type parallel jobs can run on ShARC (when running in the SMP parallel environment), Stanage and Bessemer.

For both parallel processing methods you should run several test jobs using the tips from the `Time allocation <#time-allocation-limits>`_ section with various numbers of cores to assess what factor of speedup/slowdown is attained for queuing and computation / the total time for job completion.

Remember, the larger your request, the longer it will take for the resources to become available and the time taken to queue is highly dependent on other cluster jobs.

Some additional important considerations to make are:

* `Amdahl's law <https://en.wikipedia.org/wiki/Amdahl%27s_law>`_ - an increase in cores or computational power will not scale in a perfectly linear manner. Using 2 cores will not be twice as fast as a single core - and the proportional time reduction from using more cores will decrease with larger core counts.
* Job workload optimisation is highly dependent on the workload type - workloads can be CPU, memory bandwidth or IO (reading and writing to disk) limited - detailed exploration and profiling of workloads is beyond the scope of this guide.
* Trying a smaller job (or preferably a set of smaller jobs of different sizes) will allow you to extrapolate likely resource requirements but you must remain aware of the limitations as stated above.


-----------------

.. _Memory-allocation:

.. include:: ../referenceinfo/scheduler/MemoryAllocationLimits.rst

The memory allocation limits will differ between job types and by cluster - a summary of these differences can be seen above. It is important to note that SLURM and SGE will request memory on a different basis as detailed above.

Determining memory requirements:
----------------------------------


**By using the emailing parameters of the qsub or sbatch command:**


Submit your job ``qsub`` or ``sbatch`` by specifying very generous memory and time requirements to ensure that it runs to completion" and also using the ``-M`` and ``-m abe`` or  ``--mail-user=`` and ``--mail-type=ALL``   parameters to receive an email-report. The mail message will list the maximum memory usage ( maxvmem / MaxVMSize  ) as well as the wallclock time used by the job.

.. tabs::

    .. group-tab:: Stanage
        .. code-block::

            #SBATCH --mem=8G
            #SBATCH --time=01:00:00
            #SBATCH --mail-user=joe.blogs@sheffield.ac.uk
            #SBATCH --mail-type=ALL
            myprog < mydata.txt > myresults.txt

    .. group-tab:: Bessemer
        .. code-block::

            #SBATCH --mem=8G
            #SBATCH --time=01:00:00
            #SBATCH --mail-user=joe.blogs@sheffield.ac.uk
            #SBATCH --mail-type=ALL
            myprog < mydata.txt > myresults.txt

    .. group-tab:: ShARC
        .. code-block::
            
            #$ -l h_rt=01:00:00
            #$ -l rmem=8G
            #$ -m abe
            #$ -M joe.blogs@sheffield.ac.uk
            myprog < mydata.txt > myresults.txt

When the job completes, you will receive an email reporting the memory and time usage figures.

-----------------

**By using the qstat or sstat / sacct command:**

.. tabs::
    .. include:: ../referenceinfo/imports/scheduler/memory_used_qstat.rst

-----------------

.. _Filestore-limits:

.. include:: ../referenceinfo/scheduler/FileStoreLimits.rst


-----------------

Determining how much storage space your jobs will need:
--------------------------------------------------------------------

One method to determine how much space your jobs are likely to consume is to run an example job within a specific directory saving the output within.

Once the run has completed you can determine the amount of storage taken by the job by running: ::

    du -sh my_directory_name

-----------------

=========================================================
Special limits and alternative queues
=========================================================

If you have paid for a reservation, your research group or department has purchased additional resources there may be other accounts and partitions you can specify which will override normal limits imposed on the cluster jobs.

* :ref:`Specific group nodes on ShARC<groupnodes_sharc>`
* :ref:`Specific group nodes on Bessemer<groupnodes_bessemer>`

If you have access to additional queues / partitions and want to know their limitations you can using the following commands to explore this.

-----------------

.. include:: ../referenceinfo/scheduler/ListingQueues.rst
