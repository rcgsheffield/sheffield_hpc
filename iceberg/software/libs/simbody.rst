.. _simbody:

SimBody
=======

.. sidebar:: SimBody

   :Version: 3.5.3
   :Support Level: Bronze
   :Dependancies: compilers/gcc/4.8.2
   :URL: https://simtk.org/home/simbody
   :Location: /usr/local/packages6/libs/gcc/4.8.2/simbody/3.5.3


Usage
-----
To make this library available, run the following module command

.. code-block:: none

        module load libs/gcc/4.8.2/simbody


Installing
----------
This section is primarily for administrators of the system.

Installed using the following procedure::

    module load compilers/gcc/4.8.2

    cmake ../simbody-Simbody-3.5.3/ -DCMAKE_INSTALL_PREFIX=/usr/local/packages6/libs/gcc/4.8.2/simbody/3.5.3

    make -j 8


