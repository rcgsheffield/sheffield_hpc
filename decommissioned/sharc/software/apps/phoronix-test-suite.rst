.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Phoronix Test Suite
====================

.. sidebar:: Phoronix Test Suite
   
   :Versions: 9.8.0
   :Dependencies: No prerequsite modules loaded - compilers such as GCC and CMake may be required for installing tests, specific test dependencies will also apply.
   :URL: https://www.phoronix-test-suite.com/ 


----------

Phoronix Test Suite is a free and open-source benchmark software for Linux and other operating systems which is developed by Michael Larabel and Matthew Tippett. Phoronix Test Suite integrates with https://openbenchmarking.org/ where tests, suites of tests and uploaded benchmarks from users are available.

----------

Usage
-----

Phoronix Test Suite can be activated using the following module file::

    module load apps/phoronixtestsuite/pts9.8.0/binary

	
The Phoronix Test Suite executable is ``phoronix-test-suite`` but is aliased to the command ``p`` . The Phoronix Test Suite can be launched during an interactive session with X Window support (e.g. an interactive ``qrshx`` session) or used in batch jobs when appropriately configured.

----------

Introduction
-------------

Phoronix Test Suite contains a very large number of benchmarks which can be used to become familiar with the software.

A list of these tests/test suites can be found here: https://openbenchmarking.org/tests

A summary of common commands can be found here: https://www.phoronix-test-suite.com/documentation/phoronix-test-suite.html

A Phoronix Test Suite cheat sheet can be found at: https://gist.github.com/anshula/728a76297e4a4ee7688d

Concepts to be aware of include:
#######################################
* You can save your results locally or also upload your results to the OpenBenchmarking website which may be useful for comparison.
* Benchmark tests are typically discrete by a single program but may have multiple test modes to characterise different aspects of that program.
* Test suites are a group of benchmark tests.
* You will not be able to install dependencies with sudo - you will need to install these yourself, load them and override the check in phoronix for dependencies by setting the following environment variable: ``SKIP_EXTERNAL_DEPENDENCIES=1`` .
* Any dependencies will need to be installed / handled by you e.g. python, conda and tensorflow for the pts/ai-benchmark benchmark.
* You can set the test name and unique identifier for a test interactively when running the program or with the following environment variables when in batch jobs: ``TEST_RESULTS_NAME="My Test Name"``, ``TEST_RESULTS_IDENTIFIER="My Unique ID"``.


Common commands include:
##########################
* ``p list-all-tests`` to list all benchmark tests.
* ``p info yourtestnamehere`` to get info about a given a benchmark test.
* ``p benchmark yourtestorsuitenamehere`` to run a benchmark test.
* ``p install yourtestnamehere`` to install a benchmark test.
* ``p upload yourtestnamehere`` to upload your benchmark test results.
* ``p build-suite`` to start building a custom suite of your own benchmark tests, you can also use this to pre-select options for benchmarks when batch testing.
* ``p batch-setup`` to setup phoronix running batch jobs (set this up if doing batch jobs.)
* ``p batch-benchmark yourtestorsuitenamehere`` to run a batch benchmark job.

----------

Phoronix Test Suite example benchmarks / suites
------------------------------------------------

Interactive jobs
##########################
The Phoronix Test Suite can be called like a normal executable when in an interactive session requested via ``qrshx``

Simply entering the command ``p`` will list the commands which are available.

As an example, you can start the CPU stress testing benchmark, stress-ng with the following command: ::

    p benchmark stress-ng

Batch jobs
##########################
Here is an example batch submission script which is running a custom build CPU test suite called ``sharccpu`` which reserves a node exclusively for 24 hours (this will take a long time to queue): ::

    #!/bin/bash
    #$ -cwd
    #$ -l excl=true
    #$ -l h_rt=24:00:00
    #$ -l rmem=40G
    #$ -pe smp 16
    #$ -j yes
    #$ -m bea
    #$ -M yourusername@sheffield.ac.uk
    #$ -N Phoronix-CPU-test

    export SKIP_EXTERNAL_DEPENDENCIES=1
    module load apps/phoronixtestsuite/pts9.8.0/binary

    #Add the over all test name i.e. where the unique tests will be grouped
    export TEST_RESULTS_NAME="Sheffield HPC CPU Test"

    #Construct the test ID aka the unique name for each test
    CPUMODEL=`lscpu | grep "Model name:" | sed -e "s/^Model name:[[:space:]]*//"`
    CLUSTERNAME="ShARC " # Edit me if needed
    TESTID="$CLUSTERNAME $CPUMODEL"
    export TEST_RESULTS_IDENTIFIER=$TESTID

    p batch-benchmark sharccpu


		
Installation notes
------------------
PHP and several modules are required for Phoronix Test Suite to function, PHP has been manually compiled from source alongside these modules and any dependencies.

The sourcefiles for this will be located within: 

``/usr/local/packages/apps/phoronixtestsuite/source/``

The module file can be found at the following location: 

:download:`/usr/local/modulefiles/apps/phoronixtestsuite/pts9.8.0/binary </decommissioned/sharc/software/modulefiles/apps/phoronixtestsuite/pts9.8.0/binary>`

The Makefile can be found at the following location: 

:download:`/usr/local/packages/apps/phoronixtestsuite/source/php/php-src-8.0.0-dev/Makefile </decommissioned/sharc/software/modulefiles/apps/phoronixtestsuite/pts9.8.0/Makefile>`

----------

The PHP_INI_SCAN_DIR environment variable is set in the module file to direct PHP to load the required PHP extensions: 

* gd
* sockets
* pcntl
* bz2

----------

The ./configure for this compiling is as follows: ::

    ./configure --prefix=/usr/local/packages/apps/phoronixtestsuite/php-8.0.0-dev/ --with-curl --with-openssl --with-xmlrpc --with-zip --with-zlib

Please ensure that the PKG_CONFIG_PATH environment variable is set correctly: ::

    export PKG_CONFIG_PATH=/usr/local/packages/apps/phoronixtestsuite/php-8.0.0-dev/lib/pkgconfig/:/usr/local/packages/apps/phoronixtestsuite/php-8.0.0-dev/lib64/pkgconfig/
	
----------

Compiling and installing PHP modules will require you to first load the Phoronix Module then follow the instructions (with respect to phpize and onward) in this link: https://ma.ttias.be/how-to-compile-and-install-php-extensions-from-source/
