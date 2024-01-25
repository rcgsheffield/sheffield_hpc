.. _star_stanage:

.. |softwarename| replace:: STAR
.. |currentver| replace:: 2.7.10b

STAR
====

.. sidebar:: STAR

   :Versions:  2.7.10b
   :Dependencies: GCC, zlib, binutils
   :URL: https://github.com/alexdobin/STAR

STAR (Spliced Transcripts Alignment to a Reference) is a software for RNA sequence 
alignment. STAR aligns RNA-seq reads to a reference genome using uncompressed 
suffix arrays.  The latest STAR manual can be found at: 
https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf which will detail the 
many available command arguments.

--------

Interactive usage
-----------------

After connecting to Stanage (see :ref:`ssh`),  start an interactive session with the 
:code:`srun --pty bash -i` command.

STAR can be loaded with the command:

.. code-block:: console

	$ module load STAR/2.7.10b-GCC-11.3.0


After this any of the STAR commands can be run from the terminal prompt. The available 
commands can be obtained using:

.. code-block:: console

	$ STAR --help

--------

Batch usage
-----------

Download and unpack the input files from https://www.gencodegenes.org/human/. We will use the comprehensive gene 
annotation (regions: PRI), for the purpose for this example we use only the data/annotations for chromosome 19 to map to.

.. code-block:: bash

  #!/bin/bash
  # download the "Genome sequence, primary assembly (GRCh38)" fasta file
  wget https://ndownloader.figshare.com/files/14669702 && \ 
  mv 14669702 GRCh38.primary_assembly.genome.chr19.fa.gz && \
  gunzip GRCh38.primary_assembly.genome.chr19.fa.gz
  
  # download the annotations that correspond to it 
  wget https://ndownloader.figshare.com/files/14658830 && \
  mv 14658830 gencode.v29.primary_assembly.annotation.chr19.gtf.gz && \
  gunzip gencode.v29.primary_assembly.annotation.chr19.gtf.gz


The following is an example batch submission script, ``my_job.sh``, to run the executable ``STAR``.
The script requests 4 cores using the OpenMP library and multi-threading with a runtime of 5 minutes and 
1 GB of real memory per core to generate a genome index using the above data/annotations.

.. code-block:: bash

         #!/bin/bash
         #SBATCH --job-name=STAR_test
         #SBATCH --cpus-per-task=4
         #SBATCH --mem=1000
         #SBATCH --output=output_STAR_4.%j.out
         #SBATCH --time=00:05:00
         #SBATCH --mail-user=a.person@sheffield.ac.uk
         #SBATCH --mail-type=ALL

         module load STAR/2.7.10b-GCC-11.3.0

         STAR --runThreadN $SLURM_NTASKS --runMode genomeGenerate --genomeSAindexNbases 11 --genomeDir ./STAR --genomeFastaFiles GRCh38.primary_assembly.genome.chr19.fa \
         --sjdbGTFfile gencode.v29.primary_assembly.annotation.chr19.gtf

The job is submitted to the queue by typing:

.. code-block:: console

   $ sbatch my_job.sh

The output file will be written in the subdirectory ``STAR``.

--------

Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. |softwarename| has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBDEVELSTAR`` with a given module loaded.

--------

Testing
^^^^^^^

Testing has been conducted by running the genome indices generation job as detailed in the 
batch job above.

The output file should resemble: 

.. code-block:: console

         $ cat output_STAR_4.1239773.out 
         STAR --runThreadN 4 --runMode genomeGenerate --genomeSAindexNbases 11 --genomeDir ./STAR --genomeFastaFiles GRCh38.primary_assembly.genome.chr19.fa --sjdbGTFfile gencode.v29.primary_assembly.annotation.chr19.gtf
         STAR version: 2.7.10b   compiled: 2023-10-10T17:29:00+0100 node128:/dev/shm/STAR/2.7.10b/GCC-11.3.0/STAR-2.7.10b/source
         Jan 23 16:13:23 ..... started STAR run
         Jan 23 16:13:23 ... starting to generate Genome files
         Jan 23 16:13:23 ..... processing annotations GTF
         Jan 23 16:13:25 ... starting to sort Suffix Array. This may take a long time...
         Jan 23 16:13:25 ... sorting Suffix Array chunks and saving them to disk...
         Jan 23 16:13:42 ... loading chunks from disk, packing SA...
         Jan 23 16:13:43 ... finished generating suffix array
         Jan 23 16:13:43 ... generating Suffix Array index
         Jan 23 16:13:45 ... completed Suffix Array index
         Jan 23 16:13:45 ..... inserting junctions into the genome indices
         Jan 23 16:13:52 ... writing Genome to disk ...
         Jan 23 16:13:52 ... writing Suffix Array to disk ...
         Jan 23 16:13:53 ... writing SAindex to disk
         Jan 23 16:13:53 ..... finished successfully
 



