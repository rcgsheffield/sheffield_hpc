STAR
====

.. sidebar:: STAR

   :Latest version:  2.5.0c
   :URL: https://github.com/alexdobin/STAR

Spliced Transcripts Alignment to a Reference.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the :code:`qrsh` command.

The latest version of STAR (currently 2.5.0c) is made available with the command ::

        module load apps/gcc/5.2/STAR

Alternatively, you can load a specific version with ::

        module load apps/gcc/5.2/STAR/2.5.0c

This command makes the STAR binary available to your session and also loads the gcc 5.2 compiler environment which was used to build STAR. Check that STAR is working correctly by displaying the version ::

    STAR --version

This should give the output ::

  STAR_2.5.0c

Documentation
-------------
The STAR manual is available online: https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf

Installation notes
------------------
STAR was installed using gcc 5.2 ::

  module load compilers/gcc/5.2

  mkdir STAR
  mv ./STAR-2.5.0c.zip ./STAR
  cd ./STAR/
  unzip STAR-2.5.0c.zip
  cd STAR-2.5.0c
  make
  cd source
  mkdir -p /usr/local/packages6/apps/gcc/5.2/STAR/2.5.0c
  mv ./STAR /usr/local/packages6/apps/gcc/5.2/STAR/2.5.0c/

Testing
-------
No test suite was found.

Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.2/STAR/2.5.0c`

It's contents ::

  #%Module1.0#####################################################################
  ##
  ## STAR 2.5.0c module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  module load compilers/gcc/5.2

  module-whatis   "Makes version 2.5.0c of STAR available"

  set STAR_DIR /usr/local/packages6/apps/gcc/5.2/STAR/2.5.0c/

  prepend-path PATH $STAR_DIR
