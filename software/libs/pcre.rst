.. index::
    single: PCRE

.. _pcre:

pcre
====

.. sidebar:: pcre

   :Version: 8.37
   :Support Level: Bronze
   :Dependancies: None
   :URL: http://www.pcre.org/
   :Location: /usr/local/packages6/libs/gcc/4.4.7/pcre/8.37

The PCRE library is a set of functions that implement regular expression pattern matching using the same syntax and semantics as Perl 5. PCRE has its own native API, as well as a set of wrapper functions that correspond to the POSIX regular expression API. The PCRE library is free, even for building proprietary software.

Usage
-----
To make this library available, run the following module command after starting a ``qsh`` or ``qrsh`` session.

.. code-block:: none

        module load libs/gcc/4.4.7/pcre/8.37

This also makes the updated ``pcregrep`` command available and will replace the system version. Check the version you are using with ``pcregrep -V`` ::

    pcregrep -V

    pcregrep version 8.37 2015-04-28

Installation notes
------------------
This section is primarily for administrators of the system.

.. code-block:: none

    qrsh
    tar -xvzf pcre-8.37.tar.gz
    cd pcre-8.37
    mkdir -p /usr/local/packages6/libs/gcc/4.4.7/pcre/8.37
    ./configure --prefix=/usr/local/packages6/libs/gcc/4.4.7/pcre/8.37

The configuration details were ::

    pcre-8.37 configuration summary:

    Install prefix .................. : /usr/local/packages6/libs/gcc/4.4.7/pcre/8.37
    C preprocessor .................. : gcc -E
    C compiler ...................... : gcc
    C++ preprocessor ................ : g++ -E
    C++ compiler .................... : g++
    Linker .......................... : /usr/bin/ld -m elf_x86_64
    C preprocessor flags ............ :
    C compiler flags ................ : -g -O2 -fvisibility=hidden
    C++ compiler flags .............. : -O2 -fvisibility=hidden -fvisibility-inlines-hidden
    Linker flags .................... :
    Extra libraries ................. :

    Build 8 bit pcre library ........ : yes
    Build 16 bit pcre library ....... : no
    Build 32 bit pcre library ....... : no
    Build C++ library ............... : yes
    Enable JIT compiling support .... : no
    Enable UTF-8/16/32 support ...... : no
    Unicode properties .............. : no
    Newline char/sequence ........... : lf
    \R matches only ANYCRLF ......... : no
    EBCDIC coding ................... : no
    EBCDIC code for NL .............. : n/a
    Rebuild char tables ............. : no
    Use stack recursion ............. : yes
    POSIX mem threshold ............. : 10
    Internal link size .............. : 2
    Nested parentheses limit ........ : 250
    Match limit ..................... : 10000000
    Match limit recursion ........... : MATCH_LIMIT
    Build shared libs ............... : yes
    Build static libs ............... : yes
    Use JIT in pcregrep ............. : no
    Buffer size for pcregrep ........ : 20480
    Link pcregrep with libz ......... : no
    Link pcregrep with libbz2 ....... : no
    Link pcretest with libedit ...... : no
    Link pcretest with libreadline .. : no
    Valgrind support ................ : no
    Code coverage ................... : no

Once the configuration was complete, I did ::

	make
   	make install

Testing was performed and all tests passed ::

  make check

  ============================================================================
  Testsuite summary for PCRE 8.37
  ============================================================================
  # TOTAL: 5
  # PASS:  5
  # SKIP:  0
  # XFAIL: 0
  # FAIL:  0
  # XPASS: 0
  # ERROR: 0
  ============================================================================


Module File
-----------
Module File Location: ``/usr/local/modulefiles/libs/gcc/4.4.7/pcre/8.37``

.. code-block:: none

  #%Module1.0#####################################################################
  ##
  ## pcre 8.37 module file
  ##

  ## Module file logging
  source /usr/local/etc/module_logging.tcl
  ##

  proc ModulesHelp { } {
          puts stderr "Makes the pcre 8.37 library available"
  }

  module-whatis   "Makes the pcre 8.37 library available"

  set PCRE_DIR /usr/local/packages6/libs/gcc/4.4.7/pcre/8.37

  prepend-path LD_LIBRARY_PATH $PCRE_DIR/lib
  prepend-path CPATH $PCRE_DIR/include
  prepend-path PATH $PCRE_DIR/bin
