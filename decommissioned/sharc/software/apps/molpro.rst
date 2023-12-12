.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Molpro
======

.. sidebar:: Molpro

   :Version: 2015.1.22
   :Dependencies: No additional modules loaded.
   :URL: http://www.molpro.net/
   :Documentation: http://www.molpro.net/info/users?portal=user


Molpro is a comprehensive system of ab initio programs for advanced molecular electronic structure calculations, designed and maintained by H.-J. Werner and P. J. Knowles, and containing contributions from many other authors.


Usage
-----

Molpro 2015.1.22 can be activated using the module file::

    module load apps/molpro/2015.1.22/binary

The Molpro executable is ``molpro``.

**Important note:** Only licensed users of Molpro are entitled to use the code; refer to Molpro's website for license details: http://www.molpro.net/info/products.php?portal=visitor&choice=Licence+types. Access to Molpro on ShARC is restricted to members of the unix group ``molpro``.
To be added to this group, please contact ``research-it@sheffield.ac.uk`` and provide evidence of your eligibility to use Molpro.


Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run ``molpro`` and which is submitted to the queue by typing ``qsub my_job.sh``. ::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe mpi 4

    module load apps/molpro/2015.1.22/binary

    molpro -n 4 my_input.inp

The script requests 4 cores using the Open MPI parallel environment ``mpi`` with a runtime of 30 mins and 2 GB of real memory per core. The Molpro input file is ``my_input.inp``.


Installation notes
------------------

Molpro 2015.1.22 was installed as a binary installation using the
:download:`install_molpro.sh </decommissioned/sharc/software/install_scripts/apps/molpro/2015.1.22/binary/install_molpro.sh>` script;
the module file is
:download:`/usr/local/modulefiles/apps/molpro/2015.1.22/binary </decommissioned/sharc/software/modulefiles/apps/molpro/2015.1.22/binary>`.

The Molpro 2015.1.22 installation was tested by running a batch job using the ``my_job.sh`` batch script, above, and an example input file from Molpro's quick-start website (http://www.molpro.net/info/2015.1/doc/quickstart/index.html).
