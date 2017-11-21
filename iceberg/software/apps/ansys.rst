.. _ansys_iceberg:

ANSYS
=====

.. sidebar:: ANSYS

   :Versions: 14, 14.5, 15, 16.1, 17.2, 18.2
   :Support Level: FULL
   :Dependencies: If using the User Defined Functions (UDF) will also need the following:
                  For ANSYS Mechanical, Workbench, CFX and AutoDYN : Intel 14.0 or above Compiler
                  For Fluent :  GCC 4.6.1 or above 
   :URL: http://www.ansys.com/en_uk
   :Local URL: http://www.shef.ac.uk/cics/research/software/fluent

The Ansys suite of programs can be used to numerically simulate a large variety of structural and fluid dynamics problems found in many engineering, physics, medical, aeronotics and automative industry applications.

Interactive usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive sesssion with the ``qsh`` command. Alternatively, if you require more memory, for example 16 GB, use the command ``qsh -l rmem=16G``.

To make the **default** version of ANSYS available (currently **version 16.1**), run the following: ::

      module load apps/ansys

Alternatively, you can make a specific version available with one of the following commands: ::

      module load apps/ansys/18.2
      module load apps/ansys/17.2
      module load apps/ansys/16.1
      module load apps/ansys/15.0
      module load apps/ansys/14.5
      module load apps/ansys/14

You can then issue one of the following commands to run an ANSYS product. The teaching versions mentioned below are installed for use during ANSYS and Fluent teaching labs and will only allow models of up to 500,000 elements. ::

      ansyswb  : to run ANSYS workbench      
      ansys    : to run ANSYS Mechanical outside the workbench
      ansystext: to run line-mode version of ansys
      Ansys and Ansystext : to run the teaching license version of the above two commands.
      fluent   : to run Fluent outside the workbench
      fluentext: to run the line-mode version of Fluent
      Fluent and Fluentext : to run the teaching license version of the above two commands.
      icemcfx or icem: to run icemcfd outside the workbench.
      lsdyna  : to run LS Dyna command line outside of the workbench (note: version required i.e. lsdyna161)

Running batch fluent and ansys jobs
-----------------------------------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``my_job.sh``, to run ``fluent`` version 17.2 and which is submitted to the queue by typing ``qsub my_job.sh``. ::

     #!/bin/bash
     #$ -cwd
     #$ -l h_rt=00:30:00
     #$ -l rmem=2G
     #$ -pe openmpi-ib 8

     module load apps/ansys/17.2

     fluent 2d -i flnt.inp -g

The script requests 8 cores using the MPI parallel environment ``openmpi-ib`` with a runtime of 30 mins and 2 GB of real memory per core. The Fluent input file is ``flnt.inp``. 

To run a multi-core job on a single node, using the OpenMP parallel environment ``openmp``, use the following SGE parameters (i.e. the lines beginning with ``#$``) in the batch submission script. ::

     #!/bin/bash
     #$ -cwd
     #$ -l h_rt=00:30:00
     #$ -l rmem=2G
     #$ -pe openmp 8

     module load apps/ansys/17.2

     fluent 2d -i flnt.inp -g


The ``runansys`` and ``runfluent`` commands (deprecated)
--------------------------------------------------------

Historically, the way of running batch jobs for a particular version of ANSYS (e.g. 17.2) was: ::

     module load apps/ansys/17.2
     runansys  

Or the same for Fluent: ::
      
     module load apps/ansys/17.2
     runfluent

The ``runfluent`` and ``runansys`` commands submit a Fluent journal or ANSYS input file into the batch system and can take a number of different parameters, according to your requirements. 

**Note:** Specification of virtual memory, ``-mem=nn``, is now redundant on iceberg. ``runansys`` and ``runfluent`` are not setup for use with Ansys 18.2.

runfluent command
#################

Just typing ``runfluent`` will display information on how to use it: ::

        $ runfluent
         THIS COMMAND SUBMITS SERIAL or PARALLEL FLUENT JOBS TO THE SUN GRID ENGINE 
         -------------------------------------------------------------------------- 
         Usage: runfluent [2d,2ddp,3d or 3ddp] fluent_journal_file  -time hh:mm:ss [-mem=nn]
               [-rmem=nn] [-mail your_email_address] [-nq] [-parallel nprocs][optional_extra_fluent_params]
         Where; 
          All but the first two parameters are optional. 
         First parameter is the dimensionality of the problem.
         Second parameter, fluent_journal_file, is the file containing the fluent commands.
         Other 'optional' parameters are:
            -time hh:mm:ss is the cpu time needed in hours:minutes:seconds 
            -mem=nn is the virtual memory needed (Default=8G). Example: -mem 12G (for 12 GBytes)
            -rmem=nn is the real memory needed.(Default=2G). Example: -rmem 4G (for 4 GBytes)
            -mail email_address. You will receive emails about the progress of your job
                                 Example:  -mail J.Bloggs@sheffield.ac.uk  
            -nq is an optional parameter to submit without confirming 
            -parallel nprocs : Only needed for parallel jobs to specify the no.of processors.
            -project project_name : The job will use a project allocation.
            fluent_params : any parameter not recognised will also be passed onto 
                            the fluent startup script. 
         
         Example:  runfluent  3d nozzle.jou -time 00:30:00 -mem=10G
         Fluent journal files are essentially a sequence of Fluent Commands
         you would have entered by starting fluent in non-gui mode
         Here is an example journal file:
                /file/read-case test.cas 
                /file/read-data test.dat 
                /solve iter 200 
               /file/write-data testv5b.dat
                yes 
              /exit 
                yes 
         Note that there can be no graphics output related commands 
              in the journal file as the job will be run in batch mode
         Please see fluent documents for further details of journal files and
              how to create them by typing-  docs 
         You can startup an interactive fluent session in non-gui mode to 
          experiment. For example, by using the command: qrsh fluent 3d -g 

**Note that the option** ``mem`` **has been deprecated and is no longer required**

An example of its usage: ::

        runfluent 3d nozzle.jou -time 00:30:00 -rmem=10G

Fluent journal files are essentially a sequence of Fluent Commands you would have entered by starting fluent in non-GUI mode.

Here is an example journal file: ::

      /file/read-case test.cas 
      /file/read-data test.dat 
      /solve iter 200 
      /file/write-data testv5b.dat
      yes 
      /exit 
      yes 

Note that there can be no graphics-output-related commands in the journal file as the job will be run in batch (non-interative) mode. Please see the Fluent documentation for further details of journal files and how to create them.

By using the ``-g`` parameter, you can startup an interactive Fluent session in non-GUI mode to experiment. For example: :: 

        fluent 3d -g 
 
runansys command
################
 
Just typing ``runansys`` will display information on how to use it: ::

        $ runansys
         
        **Input ( .dat or .inp) file containing Ansys commands was not specified.
         
         THIS COMMAND SUBMITS ANSYS JOBS TO THE SUN GRID ENGINE 
         ------------------------------------------------------ 
         Usage:  runansys ansys_inp_file [-time hh:mm:ss][-mem=nn] [-rmem=nn] [-parallel n]
                [-usefastdata] [-project proj_name] [-mail email_address] [other qsub parameters]
             Where; 
          ansys_inp_file  is a file containing a series of Ansys commands.
          -time hh:mm:ss  is the cpu time needed in hours:minutes:seconds, 
                          if not specified 1 hour will be assumed.
            -mem=nn       is the virtual memory requirement. 
            -rmem=nn      is the real memory requirement. 
            -parallel n   request an n-way parallel ansys job
            -gpu		use GPU
                          Note for GPU users: -mem= must be greater than 18G.
            -usefastdata  Use /fastdata/te1st as the working directory for temporary files
            -project project_name : The job will use a project's allocation.
            -mail your_email_address  : Job progress report is emailed to you.
         
         As well as time and memory, any other valid qsub parameter can be specified.
          
         All parameters except the ansys_inp file are optional.  
         
         Output files created by Ansys take their names from
          the jobname specified by the user.
         You will be prompted for a jobname as well as any other
           startup parameter you wish to pass to Ansys
        Example: 
           runansys test1.dat -time 00:30:00 -mem 8G -rmem=3G -mail j.bloggs@shef.ac.uk

**Note that the option** ``mem`` **has been deprecated and is no longer required.**
