.. index::
    single: GROMACS

.. _gromacs:

GROMACS
=======

.. sidebar:: GROMACS

   :Latest version: 5.1
   :Dependancies: mpi/intel/openmpi/1.10.0
   :URL: http://www.gromacs.org/


Interactive Usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive sesssion with the :code:`qsh` or :code:`qrsh` command. To make GROMACS available in this session, run one of the following command:

.. code-block:: none

      source /usr/local/packages6/apps/intel/15/gromacs/5.1/bin/GMXRC


Installation notes
-------------------

Version 5.1
###########

Compilation Choices:

* Use latest intel compilers
* -DGMX_MPI=on
* -DCMAKE_PREFIX_PATH=/usr/local/packages6/apps/intel/15/gromcas
* -DGMX_FFT_LIBRARY="fftw3"
* -DGMX_BUILD_OWN_FFTW=ON

The script used to build gromacs can be found `here
<https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/apps/gromacs/install_gromacs_5.1.sh>`_.
