.. _ansys:

Ansys
=====

.. sidebar:: Ansys

   :Version:  14 , 14.5 , 15
   :Support Level: FULL
   :Dependencies: If using the User Defined Functions (UDF) will also need the following:
                  For Ansys Mechanical, Workbench, CFX and AutoDYN : INTEL 14.0 or above Compiler
                  For Fluent :  GCC 4.6.1 or above 
   :URL: http://www.ansys.com/en_uk
   :Local URL: http://www.shef.ac.uk/cics/research/software/fluent
   :Categories:    
    .. tag:: Ansys
        :tag: engineering

ANSYS suite of programs can be used to numerically simulate a large variety of structural and fluid dynamics problems found in many engineering, physics, medical, aeronotics and automative industry applications

Interactive usage
-----------------
After connecting to iceberg (see :ref:`ssh`),  start an interactive sesssion with the :code:`qsh` command. Alternatively, if you require more memory, for example 16 gigabytes, use the command :code:`qsh -l rmem=16G` 

To make the latest version of Ansys available, run the following module command

.. code-block:: none

        module load apps/ansys

Alternatively, you can make a specific version available with one of the following commands

.. code-block:: none

      module load apps/ansys/14
      module load apps/ansys/14.5 
      module load apps/ansys/15.0 

After loading the modules, you can issue the following commands to run an ansys product. The teaching versions mentioned below are installed for use during ANSYS and FLUENT teaching labs and will only allow models of upto 500,000 elements.  

.. code-block:: none

      ansyswb  : to run Ansys workbench      
      ansys    : to run Ansys Mechanical outside the workbench
      ansystext: to run line-mode version of ansys
      Ansys and Ansystext : to run the teaching license version of the above two commands.
      fluent   : to run Fluent outside the workbench
      fluentext: to run the line-mode version of Fluent
      Fluent and Fluentext : to run the teaching license version of the above two commands.
      icemcfx or icem: to run icemcfd outside the workbench.
       


Running Batch fluent and ansys jobs
-----------------------------------


The easiest way of running batch ansys and fluent jobs is as follows:

.. code-block:: none

     module load {version_you_require} for example: module load apps/ansys/15.0
     followed by  runfluent  or runansys  
      

runfluent and runansys command submits a fluent journal or ansys input file into the batch system and can take a number of different parameters, according to your requirements. 

runfluent command
#################

Just typing runfluent will display information on how to use it.  
 
Usage: runfluent [2d,2ddp,3d or 3ddp] fluent_journal_file  -time hh:mm:ss [-mem=nn] [-rmem=nn] [-mail your_email_address] [-nq] [-parallel nprocs][optional_extra_fluent_params].

Where all but the first two parameters are optional. 

.. code-block:: none

    First parameter [2d , 2ddp , etc  ] is the dimensionality of the problem.
    Second parameter, fluent_journal_file, is the file containing the fluent commands.
    Other 'optional' parameters are:
    -time hh:mm:ss is the cpu time needed in hours:minutes:seconds 
    -mem=nn is the virtual memory needed (Default=8G). Example: -mem 12G (for 12 GBytes)
    -rmem=nn is the real memory needed.(Default=2G). Example: -rmem 4G (for 4 GBytes)
    -mail email_address. You will receive emails about the progress of your job.
    Example:-mail J.Bloggs@sheffield.ac.uk  
    -nq is an optional parameter to submit without confirming 
    -parallel nprocs : Only needed for parallel jobs to specify the no.of processors.
    -project project_name : The job will use a project allocation.
    fluent_params : any parameter not recognised will be passed to fluent itself. 
 

Example:  runfluent  3d nozzle.jou -time 00:30:00 -mem=10G

Fluent journal files are essentially a sequence of Fluent Commands you would have entered by starting fluent in non-gui mode.

Here is an example journal file:

.. code-block:: none

      /file/read-case test.cas 
      /file/read-data test.dat 
      /solve iter 200 
      /file/write-data testv5b.dat
      yes 
     /exit 
     yes 


Note that there can be no graphics output related commands in the journal file as the job will be run in batch mode. Please see fluent documents for further details of journal files and how to create them.

By using the -g parameter, you can startup an interactive fluent session in non-gui mode to experiment. For example-  fluent 3d -g 

 
runansys command
################
 
RUNANSYS COMMAND SUBMITS ANSYS JOBS TO THE SUN GRID ENGINE 
   
Usage:  runansys ansys_inp_file [-time hh:mm:ss][-mem=nn] [-rmem=nn] 
[-parallel n] [-project proj_name] [-mail email_address] [other qsub parameters]
      
Where; 
   ansys_inp_file  is a file containing a series of Ansys commands.

.. code-block:: none

    -time hh:mm:ss  is the cpu time needed in hours:minutes:seconds, if not specified 1 hour will be assumed.
    -mem=nn       is the virtual memory requirement. 
    -rmem=nn      is the real memory requirement. 
    -parallel n   request an n-way parallel ansys job
    -gpu          use GPU.  Note for GPU users: -mem= must be greater than 18G.
    -project project_name : The job will use a project's allocation.
    -mail your_email_address  : Job progress report is emailed to you.

 
As well as time and memory, any other valid qsub parameter can be specified.Particularly users of UPF functions will need to specify -v ANS_USER_PATH=the_working_directory
  
All parameters except the ansys_inp file are optional.  
 
Output files created by Ansys take their names from the jobname specified by the user.
You will be prompted for a jobname as well as any other startup parameter you wish to pass to Ansys
Example:   runansys test1.dat -time 00:30:00 -mem 8G -rmem=3G -mail j.bloggs@shef.ac.uk



