.. |softwarename| replace:: Bowtie 2
.. |currentver| replace:: 2.3.4.2
.. |ebtoolchain| replace:: foss-2018b

|softwarename|
==========================================================================================================


.. sidebar:: |softwarename|

   :Versions:  |currentver|
   :Dependencies: |ebtoolchain| toolchain (see Easybuild for details.)
   :URL: http://bowtie-bio.sourceforge.net/bowtie2/index.shtml

|softwarename| is an ultrafast and memory-efficient tool for aligning sequencing reads to long reference sequences. 
It is particularly good at aligning reads of about 50 up to 100s or 1,000s of characters, and particularly 
good at aligning to relatively long (e.g. mammalian) genomes. Bowtie 2 indexes the genome with an FM Index 
to keep its memory footprint small: for the human genome, its memory footprint is typically around **3.2 GB**. 
Bowtie 2 supports gapped, local, and paired-end alignment modes. 

--------

Interactive usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import.rst

The latest version of |softwarename| (currently version |currentver|) is made available with the command:

.. code-block:: console

	$ module load Bowtie2/2.3.4.2-foss-2018b


After this any of the |softwarename| commands can be run from the terminal prompt. The available 
commands can be obtained using:

.. code-block:: console

	$ bowtie2 --help

--------

Batch usage
-----------

The following is an example batch submission script, ``my_job.sh``, to run the executable ``bowtie2-build`` with input 
files from the Bowtie2 example directory. The script requests 1 core using the OpenMP parallel environment ``smp`` 
with a runtime of 10 minutes and 4 GB of real memory to build a small and a large Bowtie index from a set of DNA sequences. 

.. code-block:: bash

    #!/bin/bash
    #SBATCH --job-name=BOWTIE2_smp_test
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=1
    #SBATCH --mem=4000
    #SBATCH --output=output_BOWTIE2_smp_1
    #SBATCH --time=00:10:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load Bowtie2/2.3.4.2-foss-2018b
    bowtie2-build $EBROOTBOWTIE2/example/reference/lambda_virus.fa ./lambda_virus
    bowtie2-build --large-index $EBROOTBOWTIE2/example/reference/lambda_virus.fa ./lambda_virus



The job is submitted to the queue by typing:

.. code-block:: console

   $ sbatch my_job.sh

--------

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

|softwarename| version 2.3.4.2 was installed using Easybuild 4.4.0, build details can be found 
in ``/usr/local/packages/live/eb/Bowtie2/2.3.4.2-foss-2018b/easybuild/``


--------

Testing
^^^^^^^

Testing has been conducted by running the small and a large Bowtie index build process as detailed in the 
batch job above.

The bowtie2-build cmds will output a set of 6 files with suffixes .1.bt2, .2.bt2, .3.bt2, .4.bt2, .rev.1.bt2, and .rev.2.bt2. 
In the case of a large index these suffixes will have a bt2l termination. e.g.

.. code-block:: console

   [a_person@bessemer-node001 bowtie2test]$ bowtie2-build --large-index $EBROOTBOWTIE2/example/reference/lambda_virus.fa ./lambda_virus
   [a_person@bessemer-node001 bowtie2test]$ bowtie2-build $EBROOTBOWTIE2/example/reference/lambda_virus.fa ./lambda_virus
   [a_person@bessemer-node001 bowtie2test]$ ls -al
   total 24896
   -rw-r--r--  1 a_person a_group 4210730 Jan  4 16:01 lambda_virus.1.bt2
   -rw-r--r--  1 a_person a_group 8405234 Jan  4 16:01 lambda_virus.1.bt2l
   -rw-r--r--  1 a_person a_group   12132 Jan  4 16:01 lambda_virus.2.bt2
   -rw-r--r--  1 a_person a_group   24260 Jan  4 16:01 lambda_virus.2.bt2l
   -rw-r--r--  1 a_person a_group      17 Jan  4 16:01 lambda_virus.3.bt2
   -rw-r--r--  1 a_person a_group      29 Jan  4 16:01 lambda_virus.3.bt2l
   -rw-r--r--  1 a_person a_group   12126 Jan  4 16:01 lambda_virus.4.bt2
   -rw-r--r--  1 a_person a_group   12126 Jan  4 16:01 lambda_virus.4.bt2l
   -rw-r--r--  1 a_person a_group 4210730 Jan  4 16:01 lambda_virus.rev.1.bt2
   -rw-r--r--  1 a_person a_group 8405234 Jan  4 16:01 lambda_virus.rev.1.bt2l
   -rw-r--r--  1 a_person a_group   12132 Jan  4 16:01 lambda_virus.rev.2.bt2
   -rw-r--r--  1 a_person a_group   24260 Jan  4 16:01 lambda_virus.rev.2.bt2l

--------

Modulefiles
^^^^^^^^^^^

The module file is on the system at 
:download:`/usr/local/modulefiles/live/eb/all/Bowtie2/2.3.4.2-foss-2018b </bessemer/software/modulefiles/Bowtie2/2.3.4.2-foss-2018b>`.

--------

Alternative installation methods
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Bowtie2 is also available `via Anaconda <https://anaconda.org/bioconda/bowtie2>`_. You should be able to install Bowtie 2 with: ::

   conda install bowtie2
