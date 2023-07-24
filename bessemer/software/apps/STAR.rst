STAR
====

.. sidebar:: STAR

   :Versions:  2.7.6a
   :Dependencies: GCC, zlib, binutils
   :URL: https://github.com/alexdobin/STAR

STAR (Spliced Transcripts Alignment to a Reference) is a software for RNA sequence 
alignment. STAR aligns RNA-seq reads to a reference genome using uncompressed 
suffix arrays.  The latest STAR manual can be found at: 
https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf which will detail the 
many available command arguments.

A limited collection of STAR genomes
is available from http://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/

--------

Interactive usage
-----------------

After connecting to Bessemer (see :ref:`ssh`),  start an interactive session with the 
:code:`srun --pty bash -i` command.

The latest version of STAR (currently version 2.7.6a) is made available with the command:

.. code-block:: console

	$ module load STAR/2.7.6a-GCC-9.3.0


After this any of the STAR commands can be run from the terminal prompt. The available 
commands can be obtained using:

.. code-block:: console

	$ STAR --help

--------

Batch usage
-----------

The following is an example batch submission script, ``my_job.sh``, to run the executable ``STAR`` with input 
files from https://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/Human/GRCh38_Ensembl99_sparseD3_sjdbOverhang99/. 
The script requests 4 cores using the OpenMP parallel environment ``smp`` with a runtime of 30 minutes and 6 GB of real memory per core to 
generate a genome index. 

.. code-block:: bash

    #!/bin/bash
    #SBATCH --job-name=STAR_smp_test
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=4
    #SBATCH --mem=24000
    #SBATCH --output=output_STAR_smp_4
    #SBATCH --time=00:30:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load STAR/2.7.6a-GCC-9.3.0
    STAR --runThreadN $SLURM_NTASKS --runMode genomeGenerate --genomeSAindexNbases 12 --genomeDir ./ \
    --genomeFastaFiles Homo_sapiens.GRCh38.dna.primary_assembly.fa --sjdbOverhang 99 \
    --sjdbGTFfile Homo_sapiens.GRCh38.99.gtf --limitGenomeGenerateRAM 15000000000 --genomeSAsparseD 3 \
    --limitIObufferSize 50000000 --limitSjdbInsertNsj 383200

The job is submitted to the queue by typing:

.. code-block:: console

   $ sbatch my_job.sh

--------

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

STAR was installed using Easybuild 4.4.0, build details can be found 
in ``/usr/local/packages/live/eb/STAR/2.7.6a-GCC-9.3.0/easybuild/``


--------

Testing
^^^^^^^

Testing has been conducted by running the genome indices generation job as detailed in the 
batch job above.

The output logs should resemble: https://labshare.cshl.edu/shares/gingeraslab/www-data/dobin/STAR/STARgenomes/Human/GRCh38_Ensembl99_sparseD3_sjdbOverhang99/log

--------

Modulefiles
^^^^^^^^^^^

The module file is on the system at 
:download:`/usr/local/modulefiles/live/eb/all/STAR/2.7.6a-GCC-9.3.0 </bessemer/software/modulefiles/STAR/2.7.6a-GCC-9.3.0>`.
