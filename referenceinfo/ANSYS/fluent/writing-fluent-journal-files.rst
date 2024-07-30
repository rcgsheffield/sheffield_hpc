.. _writing-fluent-journal-files:

.. toctree::
    :hidden:
    :maxdepth: 1
    :glob:

===================================================
Writing Fluent journal files
===================================================

What is a Fluent journal file
---------------------------------------------------

A journal file is effectively a sequence of TUI and/or Scheme commands that you’ll supply to Fluent instead of using the GUI / TUI. These are arranged as they would be typed interactively into the program or entered through the GUI (graphics user interface) / TUI (text user interface).


==============

Key things to understand about Fluent journal files
---------------------------------------------------

* The purpose of a journal file is to automate a series of commands instead of entering them repeatedly on the command line.
* To include comments in your file, be sure to put a semicolon ``;`` at the beginning of each comment line.
* You can check if a command exists by opening the Fluent program, loading a model and typing the command into the TUI command window.
* TUI commands are of the form ``/menu/submenu/command argument``
* Scheme commands are within brackets ``(command)`` and many commands may be undocumented - Scheme is a general programming language like C.

==============

Why you should use a Fluent journal file
---------------------------------------------------

* Using journal files with bash scripting can allow you to automate your jobs.
* Using journal files can allow you to parameterise your models easily and automatically.
* Using a journal file can set parameters you do not have in your case file e.g. autosaving.
* Using a journal file can allow you to safely save, stop and restart your jobs easily.

==============

How to make a Fluent journal file
---------------------------------------------------

If you have already made your case file and it is fully setup, the best way to make a journal file is to manually create one with a text editor with the necessary loading, initialisation, solving, stopping and saving commands.

For complex model setup, the primary way to make a journal file is to record a journal file with how you have setup your case (File > Write > Start Journal) using the Fluent GUI. This will allow for direct playback of exactly what you have done. This may have downsides such as one GUI operation being translated into several commands and / or you may make mistakes. For this reason it is best to take a hybrid approach and manually tweak your journal files after making them.

==============

Common journal file commands
---------------------------------------------------

Note that the order of your journal file commands is **highly** important. The correct sequences must be followed and some stages have multiple options e.g. different initialisation methods.

Reading a case file
^^^^^^^^^^^^^^^^^^^^

::

  ;Reading in the case file
  /rc fullcase.cas.gz
  ; an alternative form of this is "/file/read-case fullcase.cas.gz"

Initialisation of a case file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Choose only one initialisation method.

Normal Initialisation:

::

  ;initialising the system
  /solve/init/init

Hybrid initialisation of a case file: ::

  ;hybrid initialising the system
  /solve/init/hyb-init


Setting the transient time step
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Only necessary if you are using a transient model.

::

  ;Setting the transient time step size
  /solve/set/time-step 0.01


Starting a solve process
^^^^^^^^^^^^^^^^^^^^^^^^

Depending on your model type, either solve specifying time steps and iterations, or just iterations.

Starting a solve process with a number of iteration steps: ::

  /solve/iter 2000

Starting a solve process with a number of time steps and iteration steps: ::

  ;Setting the number of time-steps (first number) and the max
  ;number of iterations per step (second number)
  /solve/dual-time-iterate 1000 1000


Outputting performance data at model finish:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

::

  ;Outputting solver performance data upon completion of the simulation
  /parallel timer usage


Saving your model
^^^^^^^^^^^^^^^^^

To save your model you will need to save your data, but you may also choose to save your final case file.

Saving the final case file: ::

  ;Writing the final case file (overwriting if required)
  /wc fullcase.cas.gz
  yes
  ; an alternative form of this is "/file/write-case output_results.cas ok"

Saving the final data file: ::

  ;Writing the final data file (overwriting if required)
  /wd fullcase.dat.gz
  yes
  ; an alternative form of this is "/file/write-data output_results.data ok"

Exit fluent
^^^^^^^^^^^

::

  ;Exiting Fluent
  /exit
  yes
  ; an alternative form of this is "/exit ok"

==============

Autosaving and saving intermediate state models
---------------------------------------------------

Autosaving
^^^^^^^^^^

Using a journal file you can instruct Fluent to automatically save every X iterations or timesteps.

To do this you can add the following to your Fluent journal file (where 1 is the number of iterations between each autosave): ::

      /file/autosave/data-frequency 1


You can also use the following to choose the root name/path of the auto saves file names: ::

      /file/auto-save/root-name "path/mysaved/checkpoints"


If you have many iterations / time steps to complete you may also wish to add the following to retain only the 5 most recent iterations: ::

      file/auto-save/retain-most-recent-files yes


You can then subsequently resume your model if needed by changing to load the last data file in your journal file. Unfortunately this autosave method will not save state immediately before your job runs out of time as it is only by a fixed interval. Please follow the instructions below to save an intermediate state model immediately before your job is terminated.


Saving intermediate state models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For some models, you may need to request multiple jobs in order to finish the convergence process and as detailed above the autosaving process will not save state immediately prior to your job being terminated by the scheduler thus losing some progress. To address this there is an complimentary method which will save before your job finishes.

Place the following commands in your journal file: ::

  (set! checkpoint/check-filename "./check-fluent")
  (set! checkpoint/exit-filename "./exit-fluent")

This is instructing Fluent to check for files called ``check-fluent`` and ``exit-fluent`` in the current working directory for your Fluent job. The presence of ``check-fluent`` file will instruct Fluent to conduct a save and then resume computation. The presence of ``exit-fluent`` file will instruct Fluent to conduct a save and then exit.
The ``exit-fluent`` command will also automatically generate a ``#restart.inp`` file (a fluent journal) which can be used to restart the job from where it stopped.

We can write a small timer trigger script which will place the ``exit-fluent`` file prior to your job ending which is ran and forked as part of your main batch submission script.

Where ``/home/username/fluent_wait_then_save_and_exit.sh`` is: ::

        #!/bin/bash
        #Sleep for the length supplied as arguments
        sleep $*
        #Add the file to save and stop fluent in the current working directory.
        touch exit-fluent
        exit

Ensure that you set this script executable with: ::

  chmod +x /home/username/fluent_wait_then_save_and_exit.sh

Take care with the supplied arguments as **$*** supplies all arguments after the script command - sleep understands the following format:

      *  s - seconds (default)
      *  m - minutes
      *  h - hours
      *  d - days

These can be added together like so: 1h 55m

You would fork this script into the background by using the & symbol at the end in your batch submission script e.g. : ::

  /home/username/fluent_wait_then_save_and_exit.sh 1h 55m &

==============

Example: Simple journal file - load case, initialise, run, save data and exit
------------------------------------------------------------------------------------------------------

::

  ;Reading in the case file
  /rc fullcase.cas.gz
  ;
  ; initialising the system
  /solve/init/init
  ;
  ;Setting the number of iterations and solving
  /solve/iter 2000
  ;
  ;Writing the final data file (overwriting if required)
  /wd fullcase.dat.gz
  ;
  ;Exit Fluent
  /exit ok


==============

Example: Complex journal file - submerged vegetation benchmark
------------------------------------------------------------------------------------------------------

The following ``runbenchmark.jou`` journal file manually loads the mesh specifies many parameters. The model being ran is a benchmark test case of submerged vegetation and is writing out a benchmarktimes.txt file with the start and end time of the model.

::

  ; Benchmark 1000 iteration test case for ANSYS Fluent 17 and up
  ; Created by Fred Sonnenwald at the University of Sheffield
  ; This benchmark may work with older Fluent versions, but some of the TUI commands may need to be changed
  ; This simulation is of submerged vegetation in an infinitely long flume

  ; To run locally, execute the following command in a shell where X is the number of cores
  ; fluent 3ddp -tX -i runbenchmark.jou -g

  ; Larger meshes (smaller cells) are suitable for testing more nodes and will use more RAM
  ; Expected memory usage (sum of all cores) is approximately 256(?), 120, 30, 4, and 1 GB
  ; Expected core count for reasonable solution time of <1 hour is 128(?), 32, 16, 8, and 2 Broadwell cores
  ; Limitations for this problem are guessed to be:
  ;  * CPU Bound for the larger meshes;
  ;  * Memory I/O bound for mid-size meshes; and
  ;  * Interconnect bound for the smaller meshes
  ; Load the mesh (change which mesh by commenting,uncommenting - comments start with ;)
  ;f rc ./3d_0.0025.msh
  ;f rc ./3d_0.0030.msh
  ;f rc ./3d_0.0050.msh
  f rc ./3d_0.0100.msh
  ;f rc ./3d_0.0200.msh

  ; Define water
  /define/materials/copy fluid water-liquid
  /define/boundary-conditions/fluid vegetation yes water-liquid n n n n 0 n 0 n 0 n 0 n 0 n 0 n n n n n
  /define/boundary-conditions/fluid water yes water-liquid n n n n 0 n 0 n 0 n 0 n 0 n 0 n n n n n
  /define/materials/delete air

  ; Setup periodic flow
  mesh mz mp inlet-vegetation outlet-vegetation n y y
  mesh mz mp inlet-water outlet-water n y y
  /define/periodic-conditions massflow 50 , , , , , ,

  ; Zero-shear surface boundary condition
  /define/boundary-conditions/set/wall surface () shear-bc yes shear-bc-spec-shear q

  ; Use the Reynolds Stress Model
  /define/models/viscous/ke-rng y

  ; Use the Enhanced Wall Treatment near wall boundary conditions
  /define/models/viscous/nwt ewt yes

  ; Setup drag within the vegetation with Cd=1 & a=4
  /define/boundary-conditions/fluid vegetation yes water-liquid n n n n 0 n 0 n 0 n 0 n 0 n 0 n n n
  y n n 1 n 0 n 0 n 0 n 1 n 0 n n 0 n 0 n 0 n n 4 n 4 n 0 0 0 n 1 , 1
  n

  ; Set the Coupled Pressure-Velocity Coupling and second order discritisation
  /solve/set/pv-coupling 21
  /solve/set/disc/pres 14
  /solve/set/disc/mom 4
  /solve/set/disc/k 1
  /solve/set/disc/e 1
  /solve/set/disc/drsm 1

  ; Set initial flow conditions and initialise
  /solve/initialize/set-defaults/pressure 0
  /solve/initialize/set-defaults/x-velocity 0.0265625
  /solve/initialize/set-defaults/y-velocity 0
  /solve/initialize/set-defaults/k 1e-5
  /solve/initialize/set-defaults/eps 1e-5
  /solve/initialize/initialize-flow

  ; Record the start time in a txt file
  !date >> benchmarktimes.txt

  ; Run for 1000 iterations
  /so it 1000

  ; Record the end time in a txt file
  !date >> benchmarktimes.txt

  ; Save, overwriting the previous run if it exists
  /f wcd benchmark ok

  ; Exit
  exit ok
