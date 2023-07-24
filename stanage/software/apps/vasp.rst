VASP
====

.. sidebar:: VASP

   :Version: 5.4.4
   :Dependencies: Fortran and C compilers, an implementation of MPI, numerical libraries BLAS, LAPACK, ScaLAPACK, FFTW. Modules for Intel compiler 2022.2.1, Intel MPI 2021.7.1 and Intel MKL 2022.2.1 loaded.
   :URL: https://www.vasp.at/
   :Documentation: https://www.vasp.at/documentation


The Vienna Ab initio Simulation Package (VASP) is a computer program for atomic scale materials modelling, e.g. electronic structure calculations and quantum-mechanical molecular dynamics, from first principles.


Usage
-----

After connecting to Stanage (see section Connecting with SSH), you can start an interactive graphical session.

VASP 5.4.4 can be activated using one of the module load command below: ::

    module load VASP/5.4.4-intel-2022b

The VASP executables are ``vasp_std``, ``vasp_gam`` and ``vasp_ncl``.

.. important::

    Only licensed users of VASP are entitled to use the code; refer to VASP's website for license details: https://www.vasp.at/registration_form/ . Access to VASP on Stanage is restricted to members of the unix group ``hpc_vasp``.
    To be added to this group, please contact ``research-it@sheffield.ac.uk`` and provide evidence of your eligibility to use VASP.


Pseudopotential files
^^^^^^^^^^^^^^^^^^^^^

VASP Pseudopotentials can be found in the directory pointed to by the ``$PSEUDOPOTENTIAL_DIR`` in versioned ``potpaw`` sub-directories: ::

   $ ls $PSEUDOPOTENTIAL_DIR/5.4
   potpaw_LDA  potpaw_PBE

Note that the ``$PSEUDOPOTENTIAL_DIR`` environment variable is only defined *after* you have loaded a VASP environment module.


Batch jobs
----------

Users are encouraged to write their own batch submission scripts. The following is an example batch submission script, ``run.sh``, to run ``vasp_std`` and which is submitted to the queue with the command ``sbatch run.sh``. ::

    #!/bin/bash
    #SBATCH --nodes 16
    #SBATCH --ntasks-per-node 1
    #SBATCH --mem=16000
    #SBATCH --time 00:30:00
    #SBATCH --mail-user=jane.doe@sheffield.ac.uk
    #SBATCH --mail-type=ALL
    module load VASP/5.4.4-intel-2022b

    rm results.dat
    drct=$(pwd)

    for i in std_relaxation constrMD_microcanonical constrMD_canonical
    do
      cd $drct/$i
      ln -sf ../POTCAR .
      ln -sf ../POSCAR .
      ln -sf ../KPOINTS .
      srun --export=ALL vasp_std
    /bin/rm CHG* WAVECAR
    done

The script requests 16 cores (one core per node) using Intel MPI with a runtime of 30 mins and 16 GB of real memory. The batch script above with the input for the "Adsorption of H2O on TiO2" example (https://www.vasp.at/wiki/index.php/Adsorption_of_H2O_on_TiO2) from the online VASP tutorials (https://www.vasp.at/wiki/index.php/Category:Tutorials).


Installation notes
------------------

Not relevant for Pilot User phase.
