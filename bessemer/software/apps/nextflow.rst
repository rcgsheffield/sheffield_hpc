.. _nextflow_bessemer:

Nextflow
========

.. sidebar:: Nextflow

   :Latest version: 22.04.0
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

.. include:: /referenceinfo/imports/scheduler/SLURM/common_commands/srun_start_interactive_session_import.rst

The latest version of Nextflow (currently version 22.4.0) is made available with the commands:

.. code-block:: console
        
    module load Nextflow/22.04.0

Note: The module file also loads ``Java/11.0.2``

You can now run the ``nextflow`` command:

.. code-block:: console
  :emphasize-lines: 1

    $ nextflow -version
    N E X T F L O W
    version 22.04.0 build 5697
    created 23-04-2022 18:00 UTC (19:00 BST)
    cite doi:10.1038/nbt.3820
    http://nextflow.io
    .

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

    N E X T F L O W  ~  version 22.04.0
    executor >  local (3)
    [69/c8ea4a] process > splitLetters   [100%] 1 of 1 ✔
    [84/c8b7f1] process > convertToUpper [100%] 2 of 2 ✔
    HELLO
    WORLD!

Batch usage
-----------

Ensure you have produced the above tutorial.nf script then write a file named **batch.sh** with the following content:

.. code-block:: bash

    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=2
    #SBATCH --mem=1000
    #SBATCH --job-name=tutorial_smp_2
    #SBATCH --output=tutorial_smp_2
    #SBATCH --time=00:01:00
    #SBATCH --mail-user=a.person@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load Nextflow/22.04.0
    nextflow run tutorial.nf
     
You can now submit this job to the SLURM scheduler with:

.. code-block:: console
  :emphasize-lines: 1

  $ sbatch batch.sh

Your output file content will be similar to the following:

.. code-block ::

    N E X T F L O W  ~  version 22.04.0
    Launching `tutorial.nf` [thirsty_mahavira] DSL2 - revision: 7ed0e799f3
    [-        ] process > splitLetters   -
    [-        ] process > convertToUpper -

    [-        ] process > splitLetters   [  0%] 0 of 1
    [-        ] process > convertToUpper -

    executor >  local (1)
    [be/6c0c6b] process > splitLetters   [  0%] 0 of 1
    [-        ] process > convertToUpper -

    executor >  local (1)
    [be/6c0c6b] process > splitLetters   [100%] 1 of 1 ✔
    [-        ] process > convertToUpper -

    executor >  local (2)
    [be/6c0c6b] process > splitLetters       [100%] 1 of 1 ✔
    [4b/4c2a74] process > convertToUpper (1) [  0%] 0 of 2

    executor >  local (3)
    [be/6c0c6b] process > splitLetters       [100%] 1 of 1 ✔
    [1b/1ed03e] process > convertToUpper (2) [ 50%] 1 of 2
    HELLO

    executor >  local (3)
    [be/6c0c6b] process > splitLetters       [100%] 1 of 1 ✔
    [1b/1ed03e] process > convertToUpper (2) [ 50%] 1 of 2
    HELLO

    executor >  local (3)
    [be/6c0c6b] process > splitLetters       [100%] 1 of 1 ✔
    [1b/1ed03e] process > convertToUpper (2) [100%] 2 of 2 ✔
    HELLO
    WORLD!


Installation notes
------------------

This installation was tested with the above examples.

Version 22.04.0
^^^^^^^^^^^^^^^
Version 22.04.0 was installed using Easybuild in the following directory::

    /usr/local/packages/live/eb/Nextflow/22.04.0

The 22.04.0 modulefile is :download:`/usr/local/modulefiles/live/eb/all/Nextflow/22.04.0 </bessemer/software/modulefiles/Nextflow/22.04.0>`
