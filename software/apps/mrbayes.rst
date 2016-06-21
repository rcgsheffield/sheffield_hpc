MrBayes
=======

.. sidebar:: MrBayes

   :Version:  3.2.6
   :URL: https://sourceforge.net/projects/mrbayes/

MrBayes is a program for the Bayesian estimation of phylogeny.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qrshx` command.

The latest version of MrBayes (currently 3.2.6) is made available with the command ::

        module load apps/gcc/4.4.7/mrbayes

Alternatively, you can load a specific version with ::

        module load apps/gcc/4.4.7/mrbayes/3.2.6

This command makes the MrBayes `mb` binary available to your session.

Installation notes
------------------
MrBayes was installed with gcc 4.4.7 ::

  tar -xvzf ./mrbayes-3.2.6.tar.gz
  ls
  cd mrbayes-3.2.6
  autoconf
  ./configure --with-beagle=/usr/local/packages6/libs/gcc/4.4.7/beagle/2.1.2 --prefix=/usr/local/packages6/apps/gcc/4.4.7/mrbayes/3.2.6/
  make
  make install

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/4.4.7/mrbayes/3.2.6`
* The module file is `on github <https://github.com/mikecroucher/HPC_Installers/blob/master/apps/mrbayes/3.2.6/sheffield/iceberg/3.2.6>`_.
