RELION
======

.. sidebar:: relion

   :Versions:  2-beta-a622560, 1.4
   :URL: http://www2.mrc-lmb.cam.ac.uk/relion/

RELION is a software package that performs an empirical Bayesian approach to (cryo-EM) structure determination by single-particle analysis. 
Note that RELION is distributed under a GPL license. 

Making RELION available
-----------------------

You can make a specific version available to your session using one of the following: ::

        module load apps/gcc/4.4.7/relion/2-beta-a622560

        module load apps/gcc/4.4.7/relion/1.4

Both versions support 
parallelisation using multiple cores on single nodes (i.e. a shared memory approach using OpenMP) and 
cores on different nodes (i.e.  a distributed memory approach using MPI) 
plus the combination of the two approaches.

Version ``2-beta-a622560`` also includes GPU support (using :ref:`CUDA 7.5 <cuda>`).  

Installation notes
------------------
These are primarily for system administrators.

The creators of RELION have `provided detailed instructions
<http://www2.mrc-lmb.cam.ac.uk/relion/index.php/Download_%26_install>`_ on how
to compile and install, how to create a Sun Grid Engine job submission template
and how to configure your environment so RELION can find third-party tools that
it depends on.

Version 2.0.1-beta
^^^^^^^^^^^^^^^^^^

* Commit ``a6225608e270ac68af463ec3ba7567dbbbc4a4a0`` of `this repository <https://bitbucket.org/tcblab/relion2-beta.git>`_.
* Cloned, configured, compiled and installed using :download:`this script </iceberg/software/install_scripts/apps/gcc/4.9.2/relion/2-beta-a622560/install.sh>`
* Compile-time dependencies:

    * GCC 4.9.2 compiler
    * OpenMPI 1.10.1
    * CUDA 7.5
    * FFTW 3.3.5
    * FLTK 1.3.3

* :download:`This modulefile </iceberg/software/modulefiles/apps/gcc/4.9.2/relion/2-beta-a622560>` was then installed as ``/usr/local/packages6/apps/gcc/4.9.2/relion/2-beta-a622560``
* Has run-time dependencies on the specified versions of GCC, OpenMPI, CUDA, FFTW and FLTK plus third-party tools used by RELION: 
    
    * :ref:`CTFFind 4.1.5 <iceberg_ctffind>`
    * :ref:`ResMap 1.1.4 <iceberg_resmap>`

* The environment variable ``RELION_QSUB_TEMPLATE`` points to an Sun Grid Engine ``qsub`` template, which needs customizing to work with our environment

Version 1.4
^^^^^^^^^^^

* Installed using the GCC 4.4.7 compiler and OpenMPI 1.8.8
* :download:`install_relion.sh </iceberg/software/install_scripts/apps/gcc/4.4.7/relion/1.4/install_relion.sh>`
* :download:`This modulefile </iceberg/software/modulefiles/apps/gcc/4.4.7/relion/1.4>` was installed as ``/usr/local/modulefiles/apps/gcc/4.4.7/relion/1.4``
* The environment variable ``RELION_QSUB_TEMPLATE`` points to an Sun Grid Engine ``qsub`` template, which needs customizing to work with our environment
