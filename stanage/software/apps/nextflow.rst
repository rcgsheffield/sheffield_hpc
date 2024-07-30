.. _nextflow_stanage:

.. |softwarename| replace:: Nextflow
.. |currentver| replace:: 23.10.0

|softwarename|
================================================================================

.. sidebar:: |softwarename|

   :Latest version: |currentver|
   :URL: https://www.nextflow.io/
   :Dependencies: Java 11
   :Documentation: https://www.nextflow.io/docs/latest/index.html
   :Nextflow pipelines: https://nf-co.re/pipelines

Nextflow is a free and open-source software distributed under the Apache 2.0 licence, developed by Seqera Labs. The software is used by scientists and engineers to write, deploy and share data-intensive, highly scalable, workflows on any infrastructure.

Nextflow enables scalable and reproducible scientific workflows using software containers. It allows the adaptation of pipelines written in the most common scripting languages.

Its fluent DSL simplifies the implementation and the deployment of complex parallel and reactive workflows on clouds and clusters

.. note::

  `nf-core <https://nf-co.re/pipelines>`_ is a community effort to collect a curated set of analysis pipelines built using Nextflow.

Interactive Usage
-----------------

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import_stanage.rst

The latest version of Nextflow (currently version |currentver|) is made available with the commands:

.. code-block:: console
        
    module load Nextflow/23.10.0

Note: The module file also loads ``Java/11.0.16``

You can now run the ``nextflow`` command:

.. code-block:: console
  :emphasize-lines: 1

    $ nextflow -version
      N E X T F L O W
      version 23.10.0 build 5891
      created 15-10-2023 15:14 UTC (16:14 BST)
      cite doi:10.1038/nbt.3820
      http://nextflow.io

A Simple Script
^^^^^^^^^^^^^^^

Write a file named **tutorial.nf** (`source <https://www.nextflow.io/docs/latest/getstarted.html#your-first-script>`_) with the following content: 

.. code-block:: console
    
    params.str = 'Hello world!'

    process splitLetters {
      output:
        path 'chunk_*'

      """
      printf '${params.str}' | split -b 6 - chunk_
      """
    }

    process convertToUpper {
      input:
        path x
      output:
        stdout

      """
      cat $x | tr '[a-z]' '[A-Z]'
      """
    }

    workflow {
      splitLetters | flatten | convertToUpper | view { it.trim() }
    }
    
Execute the script by entering the following command in your terminal:

.. code-block:: console
  :emphasize-lines: 1
  
  $ nextflow run tutorial.nf

It will output something similar to the text shown below:

.. code-block:: console

    N E X T F L O W  ~  version 23.10.0
    executor >  local (3)
    [69/c8ea4a] process > splitLetters   [100%] 1 of 1 ✔
    [84/c8b7f1] process > convertToUpper [100%] 2 of 2 ✔
    WORLD!
    HELLO

Batch usage
-----------

Ensure you have produced the above tutorial.nf script then write a file named **batch.sh** with the following content:

.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=2
    #SBATCH --mem=1000
    #SBATCH --job-name=tutorial_smp_2
    #SBATCH --output=tutorial_smp_2.out
    #SBATCH --time=00:01:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load Nextflow/23.10.0
    nextflow run tutorial.nf
     
You can now submit this job to the SLURM scheduler with:

.. code-block:: console
  :emphasize-lines: 1

  $ sbatch batch.sh

Your output file content will be similar to the following:

.. code-block ::

    N E X T F L O W  ~  version 23.10.0
    Launching `tutorial.nf` [peaceful_lamarr] DSL2 - revision: e61bd183fe
    [-        ] process > splitLetters -

    [-        ] process > splitLetters   [  0%] 0 of 1
    [-        ] process > convertToUpper -

    executor >  local (1)
    [03/d6ce85] process > splitLetters   [100%] 1 of 1 ✔
    [-        ] process > convertToUpper -

    executor >  local (3)
    [03/d6ce85] process > splitLetters       [100%] 1 of 1 ✔
    [ff/dadc3e] process > convertToUpper (2) [100%] 2 of 2 ✔
    HELLO
    WORLD!




Installation notes
------------------

Installation method
^^^^^^^^^^^^^^^^^^^

This section is primarily for administrators of the system. |softwarename| has been installed using the default Easybuild config files.

Build logs and test reports can be found in ``$EBDEVELNEXTFLOW`` with a given module loaded.

Testing method
^^^^^^^^^^^^^^^
Testing has been conducted with the above examples.
