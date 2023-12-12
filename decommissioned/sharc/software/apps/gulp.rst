.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _gulp_sharc:

GULP
====

.. sidebar:: GULP

   :Latest Version: 4.4
   :URL: https://nanochemistry.curtin.edu.au/gulp/

Overview
--------

GULP is a program for performing a variety of types of simulation on materials
using boundary conditions of 0-D (molecules and clusters), 1-D (polymers), 2-D
(surfaces, slabs and grain boundaries), or 3-D (periodic solids). The focus of
the code is on analytical solutions, through the use of lattice dynamics, where
possible, rather than on molecular dynamics. A variety of force fields can be
used within GULP spanning the shell model for ionic materials, molecular
mechanics for organic systems, the embedded atom model for metals and the
reactive REBO potential for hydrocarbons. Analytic derivatives are included up
to at least second order for most force fields, and to third order for many.

GULP can either be run:

- on one core (*serial* build) or
- on multiple cores, potentially on different machines (*MPI* build).

Licensing
---------

The authors of GULP have given the University of Sheffield permission to install the software on our clusters.  
The license restrictions are as follows:

 * The program is not to be distributed to anyone else without the express permission of the author.
 * The program is **not to be used for commercial research**. For any commercial use of the program a license must be obtained from Accelrys Inc, including contract research.
 * The program is supplied on an "as is" basis with no implied guarantee or support.

To ensure that the software is not used for commercial purposes access to GULP is restricted to members of the ``gulp`` (UNIX) group.  
To be added to this group, you will need to contact ``research-it@sheffield.ac.uk`` and state the nature of your work.

Interactive Usage
-----------------

The serial build of GULP should be used for interactive usage. 
After connecting to ShARC (see :ref:`ssh`),  
start an interactive session with the ``qrsh`` or ``qrshx`` command. 
Make the serial version of GULP available using the following: ::

        module load apps/gulp/4.4/intel-17.0.0

You can then run GULP and show all output on the screen using: ::

        gulp < inputfile

You can also simultaneously save this output in a file (here called ``outputfile``): ::

        gulp < inputfile | tee outputfile

If you get: ::

        -bash: gulp: command not found

it is probably because you are not a member of the ``gulp`` group. See Licensing_.

Serial batch jobs
-----------------

Create a batch job submission script like the following: ::

        #!/bin/bash
        #$ -N my_gulp_serial_job
        #$ -j y
        #$ -m bea
        #$ -M YOUREMAIL@sheffield.ac.uk

        module load apps/gulp/4.4/intel-17.0.0

        gulp < infile > outfile

Then submit this job to the scheduler: ::

        qsub my_batch_job_script.sge

Multi-node batch jobs
---------------------

Create a batch job submission script like the following: ::

        #!/bin/bash
        #$ -N my_gulp_mpi_16_slot_job
        #$ -pe mpi 16
        #$ -j y
        #$ -m bea
        #$ -M YOUREMAIL@sheffield.ac.uk

        module load apps/gulp/4.4/intel-17.0.0-openmpi-2.0.1

        mpirun -np $NSLOTS gulp < infile > outfile

Then submit this job to the scheduler: ::

        qsub my_batch_job_script.sge

Examples
--------

The software comes with several example input files (plus example output files for verifying that the software is working correctly).

To run them, first activate either serial or the MPI build of GULP (using ``module load``) then copy the examples to a writable location e.g.: ::
        
        cp $GULP_EXAMPLES /data/$USER/gulp_4_4_examples
        cd /data/$USER/gulp_4_4_examples

Next, create a batch job submission script like the following (for serial testing): ::

        #!/bin/bash
        #$ -N gulp_ex_serial
        #$ -j y
        #$ -m bea
        #$ -M YOUREMAIL@sheffield.ac.uk

        module purge
        module load apps/gulp/4.4/intel-17.0.0
        export OMP_NUM_THREADS=$NSLOTS

        for infile in ./example*.gin; do
            outfile=${infile/gin/got}
            echo "*******************************************"
            echo "gulp < $infile | tee $outfile"
            echo "*******************************************"

            gulp < $infile | tee $outfile
        done

        # Determine the difference between each generated output file 
        # and a corresponding example output file provided with GULP
        sh ./diff.sh
        # Collate these differences
        for infile in example*.diff; do
            (echo $infile; cat $infile) >> diffs_serial.log
        done

or like the following (for MPI testing using 16 cores): ::

        #!/bin/bash
        #$ -N gulp_ex_mpi_16
        #$ -pe mpi 16
        #$ -j y
        #$ -m bea
        #$ -M YOUREMAIL@sheffield.ac.uk

        module purge
        module load apps/gulp/4.4/intel-17.0.0-openmpi-2.0.1

        for infile in ./example*.gin; do
            outfile=${infile/gin/got}
            echo "*******************************************"
            echo "mpirun -np 16 gulp < $infile | tee $outfile"
            echo "*******************************************"

            mpirun -np 16 gulp < $infile | tee $outfile

            # Needed to avoid errors about not being able to 
            # connect to 'orted' daemons on nodes
            sleep 5
        done
         
        # Determine the difference between each generated output file 
        # and a corresponding example output file provided with GULP
        sh ./diff.sh
        # Collate these differences
        for infile in example*.diff; do
            (echo $infile; cat $infile) >> diffs_mpi16.log
        done

Finally, submit this job to the scheduler: ::

        qsub my_batch_job_script.sge

After receiving email notification that the job has finished, check in the ``gulp_4_4_examples`` directory for an output file containing:

 - the names of the examples that were run;
 - timings per example;
 - details of any errors

There will also be a ``diffs*.log`` file containing details of differences between the generated outputs and the sample outputs provided by the software's authors.

Documentation
-------------

See the `GULP website <https://nanochemistry.curtin.edu.au/gulp/>`_ or the files in the ``$GULP_DOCS`` directory on the cluster.

Installation Notes
------------------

These are primarily for system administrators.

Version 4.4
^^^^^^^^^^^

Serial (1 CPU core) and parallel (MPI) builds were compiled. 
Both builds were compiled with :ref:`version 17.0.0 of the Intel Fortran compiler <sharc-intel-compilers>` and the :ref:`Intel MKL 2017.1 <sharc-intel-mkl>`.
The MPI build was compiled using :ref:`OpenMPI 2.0.1 <openmpi_intel_sharc>`.

Both builds were compiled and installed using :download:`this script </decommissioned/sharc/software/install_scripts/apps/gulp/4.4/intel-17.0.0/install.sh>` plus

* :download:`this serial build configuration</decommissioned/sharc/software/install_scripts/apps/gulp/4.4/intel-17.0.0/getmachine_serial>`
* :download:`this MPI build configuration</decommissioned/sharc/software/install_scripts/apps/gulp/4.4/intel-17.0.0/getmachine_mpi>`

In addition:

* :download:`The serial build modulefile </decommissioned/sharc/software/modulefiles/apps/gulp/4.4/intel-17.0.0>` was installed as ``/usr/local/modulefiles/apps/gulp/4.4/intel-17.0.0``
* :download:`The parallel build modulefile </decommissioned/sharc/software/modulefiles/apps/gulp/4.4/intel-17.0.0-openmpi-2.0.1>` was installed as ``/usr/local/modulefiles/apps/gulp/4.4/intel-17.0.0-openmpi-2.0.1``

Both versions were tested using the process outlined in the Examples_ section.  The results for the serial version:

* :download:`Timings and results file </decommissioned/sharc/software/install_scripts/apps/gulp/4.4/intel-17.0.0/timings_serial.log>`
* :download:`Diffs file </decommissioned/sharc/software/install_scripts/apps/gulp/4.4/intel-17.0.0/diffs_serial.log>`

A summary of the issues encountered during these 58 tests: ::

        $ egrep '(WARNING|ERROR)' timings_serial.log | sort | uniq -c
              1 !! WARNING : Ambiguous vacancy specifier used

The results for the MPI version:

* :download:`Timings and results file </decommissioned/sharc/software/install_scripts/apps/gulp/4.4/intel-17.0.0/timings_mpi_16.log>`
* :download:`Diffs file </decommissioned/sharc/software/install_scripts/apps/gulp/4.4/intel-17.0.0/diffs_mpi_16.log>`

A summary of the issues encountered during these 58 tests: ::

    $ egrep '(WARNING|ERROR)' timings_mpi_16.log | sort | uniq -c
          1 !! ERROR : RFO keyword cannot be used with conjugate gradients
         31 !! ERROR : second derivatives unavailable in parallel
          1 !! WARNING : Not all configurations optimised successfully in relaxed

