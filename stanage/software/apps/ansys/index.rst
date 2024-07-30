.. _ansys-stanage-index:

..
  ######################################################################################################################################
  Notice: Updating the sidebar or modules load list MUST be done in the linked files in the /referenceinfo/imports/software/ansys/ area.
  ######################################################################################################################################
  
.. include:: /referenceinfo/imports/software/ansys/stanage-sidebar.rst

ANSYS
========================

.. contents::
    :depth: 2

----------------

The ANSYS suite of programs can be used to numerically simulate a large variety of structural and fluid dynamics problems found in many engineering, physics, medical, aeronautics and automotive industry applications.

.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst

----------------

.. include:: /referenceinfo/imports/software/ansys/module-load-list-stanage.rst

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

ANSYS training and help resources
---------------------------------

.. important::

  Academic support requests should be directed to the `IT Services' Research and Innovation team <mailto:research-it@sheffield.ac.uk>`_  or 
  the `ANSYS Learning Forum <https://forum.ansys.com/>`_ (**ensure you register with your University email for priority support**).

ANSYS provides numerous academic training and help resources including tutorials, video lectures and examples. 
A short list of these resources is summarised below:

* `ANSYS provides free online Innovation Courses <https://courses.ansys.com>`_ which cover numerous topics including the theory and implementation of modelling with ANSYS products.
* The `ANSYS How to Videos channel <https://www.youtube.com/user/ANSYSHowToVideos/playlists>`_ has many in depth tutorials for many ANSYS products.
* Those with an Ansys Learning Hub Subscription can also access further courses at  the `ANSYS Learning Hub courses index <https://www.ansys.com/training-center/course-catalog>`_.

--------------------

ANSYS example models
--------------------

ANSYS contains a large number of example models which can be used to become familiar with the software.
With a module loaded, the example models can be found in::

   $EBROOTANSYS/v222/ansys/data/

--------------------

Installation note for Administrators:
-------------------------------------

``export FLUENT_AFFINITY=0`` has been added to the module files in order to fix incorrect core allocation - `see details <https://github.com/rcgsheffield/sheffield_hpc/issues/1082>`_.

------------

**To be confirmed** mapdl will not run without modifying the file::

    $EBROOTANSYS/v222/ansys/bin/anssh.ini

The following instruction should be inserted at line 2433 (tbc) in ``anssh.ini``::

    setenv KMP_AFFINITY compact

------------

Module files are available below:

- :download:`/opt/apps/testapps/el7/modules/staging/all/ANSYS/2022R2.lua  </stanage/software/modulefiles/ansys/22.2/2022R2.lua>`
