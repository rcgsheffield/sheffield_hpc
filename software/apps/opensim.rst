.. index::
    single: OpenSim

OpenSim
=======

.. sidebar:: OpenSim

   :Support Level: bronze
   :Dependancies: None
   :URL: https://simtk.org/home/opensim
   :Version: 3.3


OpenSim is a freely available, user extensible software system that lets users
develop models of musculoskeletal structures and create dynamic simulations of
movement. 


Usage
-----
The latest version of OpenSim can be loaded with ::

        module load apps/gcc/4.8.2/opensim

Installation Notes
------------------
These are primarily for administrators of the system.

Built using::

    cmake /home/cs1sjm/Downloads/OpenSim33-source/
    -DCMAKE_INSTALL_PREFIX=/usr/local/packages6/apps/gcc/4.8.2/opensim/3.3/
    -DSIMBODY_HOME=/usr/local/packages6/libs/gcc/4.8.2/simbody/3.5.3/
    -DOPENSIM_STANDARD_11=ON

    make -j 8

    make install


