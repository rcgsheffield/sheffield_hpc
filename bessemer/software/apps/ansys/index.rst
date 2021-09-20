.. _ansys-bessemer-index:

.. include:: ../ansys/bessemer-sidebar.rst

ANSYS
========================

.. contents::
    :depth: 2

----------------

The ANSYS suite of programs can be used to numerically simulate a large variety of structural and fluid dynamics problems found in many engineering, physics, medical, aeronautics and automotive industry applications.

----------------

.. include:: ../ansys/module-load-list.rst

and the workbench is launched using::

   runwb2

Fluent, CFX, ICEM, Mechanical APDL/model (and many more) can all be accessed from the workbench. Outside the workbench the corresponding GUIs can be launched using ``fluent``, ``cfx5pre``, ``icemcfd`` and ``launcher``.

--------------------

ANSYS Programs
------------------

As the ANSYS suite contains a large number of packages, links to each dedicated page for each ANSYS sub-package, can be found below:

.. toctree::
  :maxdepth: 1
  :glob:

  fluent
  mechanical

--------------------

ANSYS example models
--------------------

ANSYS contains a large number of example models which can be used to become familiar with the software.
The models can be found in::

   /usr/local/packages/live/noeb/ANSYS/21.2/binary/v212/ansys/data/
   /usr/local/packages/live/noeb/ANSYS/21.1/binary/v211/ansys/data/
   /usr/local/packages/live/noeb/ANSYS/20.2/binary/v202/ansys/data/
   /usr/local/packages/live/noeb/ANSYS/20.1/binary/v201/ansys/data/
   /usr/local/packages/live/eb/ANSYS/19.4/v194/ansys/data

--------------------

Installation note for Administrators:
-------------------------------------

``export FLUENT_AFFINITY=0`` has been added to the module files in order to fix incorrect core allocation - `see details <https://github.com/rcgsheffield/sheffield_hpc/issues/1082>`_.

------------

mapdl will not run without modifying the file::

    /usr/local/packages/live/noeb/ANSYS/20.2/binary/v202/ansys/bin/anssh.ini

The following instruction should be inserted at line 2433 in ``anssh.ini``::

    setenv KMP_AFFINITY compact

------------

Please note ANSYS 20.1 and higher versions have been installed manually with the GUI in the following directories and permissions corrected as follows::

    chmod 775 -R /usr/local/packages/live/noeb/ANSYS/20.1/binary/
    chmod 775 -R /usr/local/packages/live/noeb/ANSYS/20.2/binary/
    chmod 775 -R /usr/local/packages/live/noeb/ANSYS/21.1/binary/
    chmod 775 -R /usr/local/packages/live/noeb/ANSYS/21.2/binary/

Please follow the same install directory structure.

In addition the following software packages are not included with the installations for ANSYS 19.4::


    "ANSYS Chemkin"
    "ANSYS Geometry Interfaces".

------------

Module files are available below:

- :download:`/usr/local/modulefiles/live/eb/all/ANSYS/19.4 </bessemer/software/modulefiles/ansys/19.4/19.4>`
- :download:`/usr/local/modulefiles/live/noeb/ANSYS/20.1/binary </bessemer/software/modulefiles/ansys/20.1/binary>`
- :download:`/usr/local/modulefiles/live/noeb/ANSYS/20.2/binary  </bessemer/software/modulefiles/ansys/20.2/binary>`
- :download:`/usr/local/modulefiles/live/noeb/ANSYS/21.1/binary  </bessemer/software/modulefiles/ansys/21.1/binary>`
- :download:`/usr/local/modulefiles/live/noeb/ANSYS/21.2/binary  </bessemer/software/modulefiles/ansys/21.2/binary>`
