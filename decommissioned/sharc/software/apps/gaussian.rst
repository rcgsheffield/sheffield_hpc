.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Gaussian
========

.. _gaussian_sharc:

.. sidebar:: Gaussian 

   :Version: 09 E.01, 16 C.01
   :Dependencies: Vendor specified Portland Group Fortran compiler and GCC compiler.
   :URL: http://gaussian.com
   :Documentation: http://gaussian.com/techsupport/


Gaussian is a general purpose computational chemistry software package initially released in 1970.
It utilizes fundamental laws of quantum mechanics to predict energies, molecular structures, 
spectroscopic data (NMR, IR, UV) and much more advanced calculations. 
It provides state-of-the-art capabilities for electronic structure modeling. 

-------

Usage
-----

Gaussian versions can be activated loading one of the module files listed below: ::

    module load apps/gaussian_09/e.01/std
    module load apps/gaussian_16/c.01/haswell



.. warning::
    Access to Gaussian on ShARC is available to all users from the 
    Department of Chemistry by default (i.e. user IDs beginning with ``ch``);
    other users wishing to access Gaussian will need to contact ``research-it@sheffield.ac.uk`` 
    to request access (i.e. to be added to unix group ``gaussian09`` or ``Gaussian``).

-------

Gaussian utilities
---------------------

The Gaussian utilities can be accessed by loading the Gaussian module file (see above).
The utilities are executed by typing their name, e.g., ``formchk`` and ``cubegen``. The full list of utilities is described at http://gaussian.com/utils.

.. hint::

    The Gaussian 09 command line executuable is ``g09``.
    The Gaussian 16 command line executuable is ``g16``.

-------

Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run ``g09`` and which is submitted to the queue by typing ``qsub my_job.sh``. ::

    #!/bin/bash
    #$ -cwd
    #$ -l h_rt=00:30:00
    #$ -l rmem=2G
    #$ -pe smp 2

    module load apps/gaussian_09/e.01/std
    
    export GAUSS_SCRDIR=$TMPDIR

    g09 my_input.gjf

The script requests 2 cores using the shared memory parallel environment ``smp`` with a runtime of 30 mins and 2GB of real memory per core. The Gaussian 09 input file is ``my_input.gjf``.

**Please note:** The above script specifies that the scratch directory for Gaussian 09, 
``GAUSS_SCRDIR``, should be set to ``$TMPDIR`` / the highest performance storage on a compute node.
 
.. hint::

    Gaussian should scale well with increasing core counts with near linear proportional 
    scaling `up to 16 cores <https://staff.sharcnet.ca/jemmyhu/tutorials/Gaussian_09_Benchmarks.pdf>`_ and 
    diminishing returns at higher core counts.

-------

Installation notes
------------------

Gaussian 09 Revision E.01 and 16 Revision C.01  were installed manually 
(from the terminal) using appropriately modified commands from the
:download:`install_gaussian_09.sh </decommissioned/sharc/software/install_scripts/apps/gaussian_09/d.01/pgi-17.5/install_gaussian_09.sh>` script.
Vendor specified versions of PGI have been selected to maximise solver stability.

Module logic and separated chemistry department specific directories have been created to facilitate 
multiple group access to binaries correctly as filesystem ACLs are unavailable/undesirable 
and nested groups unduly affect cluster performance. 

Gaussian 09
^^^^^^^^^^^
The Gaussian 09 code was compiled with :ref:`PGI 12.5<PGI Compilers_sharc>` 
and has no architecutral optimisations that can be utilized. The 
``make.log`` file can be found in the ``$g09root/g09/``.

The module file was manually created and can be downloaded:  
:download:`here </decommissioned/sharc/software/modulefiles/apps/gaussian_09/e.01/std>`. 

Gaussian 16
^^^^^^^^^^^
The Gaussian 16 code was compiled with :ref:`PGI 18.10<PGI Compilers_sharc>`. 
and has architectural optimisations turned on for Haswell processors. The 
``make.log`` file can be found in the ``$g16root/g16/``.

The module file was manually created and can be downloaded:  
:download:`here </decommissioned/sharc/software/modulefiles/apps/gaussian_16/c.01/haswell>`. 

Testing
^^^^^^^

The Gaussian 09/16 installations were tested by running a batch job using the following text (including a blank line at the end) in an input file and the ``my_job.sh`` batch script, above. ::

    %chk=h2o.chk
    %nproc=2
    %mem=2GB
    #n hf/6-31G(d,p) opt freq

    H2O

    0 1
    O
    H 1 r1
    H 1 r2 2 a1

    r1 1.0
    r2 1.0
    a1 105.0




