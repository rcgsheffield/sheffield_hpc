AdmixTools
==========
.. sidebar:: AdmixTools

   :Latest version: 4.1
   :Dependancies: Intel compiler 15.0.3
   :URL: https://github.com/DReichLab/AdmixTools

AdmixTools implements five genetics methods described for learning about population mixtures.  Details of these methods/algorithms can be found in Patterson et al. (2012) *Ancient Admixture in Human History* (`doi:10.1534/genetics.112.145037 <http://dx.doi.org/10.1534/genetics.112.145037i>`_).

Usage
-----

Load version 4.1 of AdmixTools with the command ::

    module load apps/intel/15/AdmixTools/4.1

This module makes the following programs available (by adding their containing directory to the ``PATH`` environment variable); programs; these are documented in README files contained in the ``$ADMIXTOOLSDIR`` directory.

* ``convertf``: See ``README.CONVERTF`` for documentation of programs for converting file formats.
* ``qp3Pop``: See ``README.3PopTest`` for details of running f_3 test. This test can be used as a format test of admixture with 3 populations.
* ``qpBound``: See ``README.3PopTest`` for details of running qpBound. This test can be used for estimating bounds on the admixture proportions, given 3 populations (2 reference and one target).
* ``qpDstat``: See ``README.Dstatistics`` for details of running D-statistics. This is a formal test of admixture with 4 populations.
* ``qpF4Ratio``: See ``README.F4RatioTest`` for details of running F4 ratio estimation. This program computes the admixture proportion by taking the ratio of two f4 tests.
* ``rolloff``:  See ``README.ROLLOFF/`` ``README.ROLLOFF_OUTPUT`` for details for running rolloff. This program can be used for dating admixture events.

AdmixTools also comes with several examples.  The example inputs and outputs can be found in ``$ADMIXTOOLSDIR/examples``, whilst the example data the inputs reference are contained in ``$ADMIXTOOLSDIR/data``  

Installation Notes
-----------------

**Version 4.1**-

`This script <https://github.com/mikecroucher/HPC_Installers/blob/master/apps/AdmixTools/4.1/sheffield/iceberg/install_admixtools_4.1.sh>`_  ::

1. Checks out a specific git commit of AdmixTools (def3c5d75d1b10fd3270631f5c64adbf3af04d4d; NB the repository does not contain any tags)
2. Builds GNU Scientific library (GSL) v2.2 and installs into the AdmixTools final installation directory (``/usr/local/packages6/apps/intel/15/AdmixTools/4.1``)
3. Builds AdmixTools (using v15.0.3 of the Intel Compiler and a customised Makefile (links against Intel ``libifcore`` rather than ``gfortran`` and uses MKL for BLAS and LAPACK functions)
4. Installs AdmixTools in the aforementioned directory.  
5. Downloads the `data needed to run the examples <https://genetics.med.harvard.edu/reich/Reich_Lab/Software_files/AdmixTools_Example_Data.tar.gz>`_ then runs the examples
6. Installs `this modulefile <https://github.com/mikecroucher/HPC_Installers/blob/master/apps/AdmixTools/4.1/sheffield/iceberg/admixtools_env_mod_4.1>`_ as ``/usr/local/modulefiles/apps/intel/15/AdmixTools/4.1``
