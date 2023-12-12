.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _cctools-sharc:

cctools
=======

.. sidebar:: cctools

   :Latest Version: 7.0.14
   :URL: http://ccl.cse.nd.edu/software/download

The Cooperative Computing Tools (cctools) contains Parrot, Chirp, Makeflow, Work Queue, SAND, and other software.

Interactive Usage
-----------------
After connecting to the cluster (see :ref:`ssh`), start an interactive session with the `qrsh` or `qrshx` command.

The default version of cctools is made available with the command ::

        module load apps/cctools

Alternatively, you can explicitly load a specific version using::

        module load apps/cctools/7.0.14/binary


Accessing CernVM-FS
-------------------

`parrot_run` provided by cctools can be used to provide access to `CernVM-FS <http://cernvm.cern.ch/portal/filesystem/parrot>`_ 

e.g. to access the Atlas CernVM-FS repo ::

 parrot_run bash

 ls /cvmfs/atlas.cern.ch/repo

 LibCvmfs version 2.4, revision 25

 ATLASLocalRootBase  benchmarks  conditions  containers  dev  images  sw  tools

The environment variable ``PARROT_CVMFS_ALIEN_CACHE`` is used to specify the location for the CVMFS cache.

By default the cctools module will set ``PARROT_CVMFS_ALIEN_CACHE`` to your ``/data`` directory.  You can override this behavior by setting ``PARROT_CVMFS_ALIEN_CACHE`` to another location.  

The environment variable ``PARROT_CVMFS_REPO`` can be used to add other repositories.

For more info on using the parrot connector see `CernVM-FS documentation <http://cernvm.cern.ch/portal/filesystem/parrot>`_ 


Installation notes
------------------
These are primarily for administrators of the system.

**cctools 7.0.14**

#. Download the cctools tarball (``cctools-7.0.14-x86_64-centos7.tar.gz``)  `from CCL <http://ccl.cse.nd.edu/software/downloadfiles.php>`_.
#. Save this file to ``/usr/local/media/cctools/7.0.14/``
#. Install cctools using :download:`this script </decommissioned/sharc/software/install_scripts/apps/cctools/7.0.14/binary/install.sh>`
#. Install :download:`this modulefile </decommissioned/sharc/software/modulefiles/apps/cctools/7.0.14/binary>` as ``/usr/local/modulefiles/apps/cctools/7.0.14/binary``

