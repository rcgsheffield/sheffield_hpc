.. _molpro:

Molpro
======

.. sidebar:: Molpro

   :Version: 2022.3.2
   :Dependencies: No additional modules loaded.
   :URL: http://www.molpro.net/
   :Documentation: https://www.molpro.net/manual/doku.php


Molpro is a comprehensive system of ab initio programs for advanced molecular electronic structure calculations, designed and maintained by H.-J. Werner and P. J. Knowles, and containing contributions from many other authors.


Usage
-----

Molpro 2015.1.22 can be activated using the module file::

    module load Molpro/mpp-2022.3.2.linux_x86_64_sockets

The Molpro executable is ``molpro``.

**Important note:** Only licensed users of Molpro are entitled to use the code; refer to Molpro's website for license details: https://www.molpro.net/info/products.php . Access to Molpro on Stanage is restricted to members of the unix group ``hpc_molpro``.

To be added to this group, please contact ``research-it@sheffield.ac.uk`` and provide evidence of your eligibility to use Molpro.


Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run ``molpro`` and which is submitted to the queue by typing ``sbatch my_job.sh``. 

.. code-block:: bash
    
    #!/bin/bash
    #SBATCH --nodes=1
    #SBATCH --ntasks-per-node=4
    #SBATCH --mem=8000
    #SBATCH --job-name=molpro_job
    #SBATCH --output=molpro_output
    #SBATCH --time=01:00:00
    #SBATCH --mail-user=some.user@sheffield.ac.uk
    #SBATCH --mail-type=ALL

    module load Molpro/mpp-2022.3.2.linux_x86_64_sockets

    molpro -n 4 my_input.inp

The script requests 4 cores with a runtime of 1 hour and 8 GB of real memory. The Molpro input file is ``my_input.inp``.


Installation notes
------------------

The software was installed using a custom config called ``Molpro-mpp-2022.3.2.linux_x86_64_sockets.eb``, which should be available in the easybuild-easyconfig repository shortly.
