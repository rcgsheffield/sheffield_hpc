gemini
======

.. sidebar:: gemini

   :Versions:  0.18.0
   :URL: http://gemini.readthedocs.org/en/latest/

GEMINI (GEnome MINIng) is a flexible framework for exploring genetic variation in the context of the wealth of genome annotations available for the human genome. By placing genetic variants, sample phenotypes and genotypes, as well as genome annotations into an integrated database framework, GEMINI provides a simple, flexible, and powerful system for exploring genetic variation for disease and population genetics.

Making gemini available
-----------------------
The following module command makes the latest version of gemini available to your session ::

      module load apps/gcc/4.4.7/gemini

Alternatively, you can make a specific version available ::

      module load apps/gcc/4.4.7/gemini/0.18

Installation notes
------------------
These are primarily for system administrators.

* gemini was installed using the gcc 4.4.7 compiler
* `install_gemini.sh <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/apps/gcc/4.4.7/gemini/0.18/install_gemini.sh>`_


Testing
-------
The test script used was

* `test_gemini.sh <https://github.com/rcgsheffield/iceberg_software/blob/master/software/test_scripts/apps/gcc/4.4.7/gemini/0.18/test_gemini.sh>`_

The full output from the test run is on the system at `/usr/local/packages6/apps/gcc/4.4.7/gemini/0.18/test_results/`

There was one failure ::

      effstring.t02...\c
  ok
      effstring.t03...\c
  15d14
  < gene	impact	impact_severity	biotype	is_exonic	is_coding	is_lof
  64a64
  > gene	impact	impact_severity	biotype	is_exonic	is_coding	is_lof
  fail
  updated 10 variants
       annotate-tool.t1 ... ok
  updated 10 variants
       annotate-tool.t2 ... ok

This was reported to the developers who `indicated that it was nothing to worry about <https://github.com/arq5x/gemini/issues/621>`_

Modulefile
----------
The module file is on the system at `/usr/local/modulefiles/apps/gcc/4.4.7/gemini/0.18`

The contents of the module file is ::

  #%Module1.0#####################################################################
  ##
  ## Gemini module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
        global bedtools-version

        puts stderr "   Adds `gemini-$geminiversion' to your PATH environment variable"
  }

  set     geminiversion 0.18

  prepend-path PATH /usr/local/packages6/apps/gcc/4.4.7/gemini/0.18/bin/
