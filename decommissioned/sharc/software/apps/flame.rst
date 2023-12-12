.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

FLAME
=====

.. sidebar:: FLAME
   
   :Version: 0.17.1 (xparser), 0.3.1 (libmboard)
   :Dependencies: GCC 6.2, (optional) OpenMPI 2.1.1, (optional) GSL 2.4
   :URL: https://github.com/FLAME-HPC/xparser/
   :Documentation: http://flame.ac.uk/docs/

The FLAME framework is an enabling tool to create **agent-based models** that can be run on high performance computer (HPC) clusters. 
Models are created based upon a model of computation called (extended finite) state machines. 
By defining agent-based models in this way the FLAME framework can automatically 
generate simulation programs that can run models efficiently on HPC clusters. 
The behaviour model is based upon state machines which are composed of 
a number of states with transition functions between those states. 
There is a single start state and by traversing states using the transition functions 
the machine executes the functions until it reaches an end state. 
This happens to each agent/machine as one time step or iteration is completed.

Usage
-----

To use FLAME on ShARC you typically need to:

#. Load the ``libmboard`` library, which is used for communications by FLAME simulations.  
   You can load a serial (non-parallel) build of the library: ::

      module load libs/libmboard/0.3.1/gcc-6.2 

   or a parallel (MPI) build: ::

      module load libs/libmboard/0.3.1/gcc-6.2-openmpi-2.1.1

   The parallel build also loads OpenMPI 2.1.1 (and GCC 6.2).

#. Load a build of the ``xparser`` utility: ::

      module load apps/xparser/0.17.1/gcc-6.2

#. (Optional) Load a build of the :ref:`GNU Scientific Library (GSL) <gsl_sharc>`, 
   should you want to use it for pseudo-random number generation.  E.g. ::

      module load libs/gsl/2.4/gcc-6.2

#. Run the ``xparser`` utility on the XMML (*X Machine Markup Language*) XML file corresponding to your model 
   (which references the C source code files containing your state transition functions): ::

      xparser -p model.xml

   This generates code that can be compiled to provide a FLAME simulation program.
   Here we passed the ``-p`` argument to ``xparser``, which tells it to generate simulation source code that can be run in parallel using MPI.
   Alternatively you can specify ``-s`` if you want a serial simulation program instead.
   In addition, you can specify a ``-f`` flag if you want to generate an optimised (*final*) build of your FLAME simulation program.

#. Compile the FLAME simulation program: ::

      make

   The output is a program called ``main``.

#. Run the FLAME simulation program.  To run a serial FLAME simulation program: ::

      ./main 5000 its/0.xml

   Here you are asking to run 5000 iterations, starting with the agent/system state as defined in the (pre-existing) ``0.xml`` XML file.

   To run a parallel simulation program using MPI: ::
   
      mpirun ./main 5000 its/0.xml

   This will distribute work over all the CPU cores you requested for your job.


Example using MPI
-----------------

#. Download and unpack some example FLAME models using: ::

      cd some_directory
      wget http://flame.ac.uk/docs/zip/tutorial_models.zip
      unzip tutorial_models.zip
      cd tutorial_models/model_05

#. Create a subdirectory for (XML) state information: ::

      mkdir its
      cp 0.xml its/

#. Create a batch job submission script in the current working directory, ``model_05``, called ``flame_example_model_05.sge`` containing: ::
   
      #!/bin/bash
      #$ -pe mpi 4
      #$ -l h_rt=00:15:00

      module load libs/libmboard/0.3.1/gcc-6.2-openmpi-2.1.1
      module load apps/xparser/0.17.1/gcc-6.2

      make clean
      xparser -p -f model.xml
      make
      mpirun ./main 100 its/0.xml

#. Submit the job using: ::
   
      qsub test.sge

#. Output state information can now be found in the new XML files created in ``/its``.


Installation notes
------------------

libmboard
^^^^^^^^^

* 0.3.1 built with GCC 6.2 and OpenMPI 2.1.1: 
  :download:`install script </decommissioned/sharc/software/install_scripts/libs/libmboard/0.3.1/gcc-6.2-openmpi-2.1.1/install.sh>` script; 
  :download:`install log </decommissioned/sharc/software/install_scripts/libs/libmboard/0.3.1/gcc-6.2-openmpi-2.1.1/install.log>` script; 
  :download:`module file </decommissioned/sharc/software/modulefiles/libs/libmboard/0.3.1/gcc-6.2-openmpi-2.1.1>`
* 0.3.1 built with GCC 6.2 (and no MPI): 
  same install script and install log as serial build; 
  :download:`module file </decommissioned/sharc/software/modulefiles/libs/libmboard/0.3.1/gcc-6.2>`
  **NOTE** libmboard can in theory be tested by building test utilities using the `CUnit <http://cunit.sourceforge.net/>`__ unit testing framework.  However, attempts to run the compiled test utilities resulted in segfaults.  GDB backtraces suggested the issue lay with CUnit and not libmboard.  It was possible to run example FLAME simulations using libmboard and xparser so the segfault issue has been ignored.

xparser
^^^^^^^

* 0.17.1 built with GCC 6.2: :download:`install script </decommissioned/sharc/software/install_scripts/apps/xparser/0.17.1/gcc-6.2/install.sh>` script; 
  :download:`install log </decommissioned/sharc/software/install_scripts/apps/xparser/0.17.1/gcc-6.2/install.log>` script; 
  :download:`module file </decommissioned/sharc/software/modulefiles/apps/xparser/0.17.1/gcc-6.2>`
  **NOTE** xparser can in theory be tested by building test utilities using the `CUnit <http://cunit.sourceforge.net/>`__ unit testing framework.  However, attempts to run the compiled test utilities resulted in segfaults.  GDB backtraces suggested the issue lay with CUnit and not libmboard.  It was possible to run example FLAME simulations using libmboard and xparser so the segfault issue has been ignored.

