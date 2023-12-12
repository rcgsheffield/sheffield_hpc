.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _ansys-sharc-index:

..
  ######################################################################################################################################
  Notice: Updating the sidebar or modules load list MUST be done in the linked files in the /referenceinfo/imports/software/ansys/ area.
  ######################################################################################################################################
  
.. include:: /referenceinfo/imports/software/ansys/sharc-sidebar.rst

ANSYS
========================

.. contents::
    :depth: 2

----------------

The ANSYS suite of programs can be used to numerically simulate a large variety of structural and fluid dynamics problems found in many engineering, physics, medical, aeronautics and automotive industry applications.

.. include:: /referenceinfo/imports/software/ansys/ansys-license-restrictions.rst
  
----------------

.. include:: /referenceinfo/imports/software/ansys/module-load-list-sharc.rst

The ANSYS Workbench GUI executable is ``runwb2``. ``runwb2`` can be launched during an interactive session with X Window support (e.g. an interactive ``qrshx`` session).


------------------

ANSYS Programs
------------------

As the ANSYS suite contains a large number of packages, links to each dedicated page for each ANSYS sub-package, can be found below:

.. toctree::
  :maxdepth: 1
  :glob:


  fluent
  mechanical
  ls-dyna

------------------

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
The models can be found in::

  /usr/local/packages/apps/ansys/22.2/binary/v222/ansys/data
  /usr/local/packages/apps/ansys/21.2/binary/v212/ansys/data
  /usr/local/packages/apps/ansys/21.1/binary/v211/ansys/data
  /usr/local/packages/apps/ansys/20.2/binary/v202/ansys/data
  /usr/local/packages/apps/ansys/20.1/binary/v201/ansys/data
  /usr/local/packages/apps/ansys/19.4/binary/v194/ansys/data
  /usr/local/packages/apps/ansys/19.3/binary/v193/ansys/data
  /usr/local/packages/apps/ansys/19.2/binary/v192/ansys/data
  /usr/local/packages/apps/ansys/19.1/binary/v191/ansys/data
  /usr/local/packages/apps/ansys/19.0/binary/v190/ansys/data
  /usr/local/packages/apps/ansys/18.2/binary/v182/ansys/data
  /usr/local/packages/apps/ansys/18.0/binary/v180/ansys/data
  /usr/local/packages/apps/ansys/17.2/v172/ansys/data
  /usr/local/packages/apps/ansys/16.1/v161/ansys/data
  /usr/local/packages/apps/ansys/15.0.7/ansys_inc/v150/ansys/data

--------------------




Installation notes
------------------

The ``mpi-rsh`` tight-integration parallel environment is required to run ANSYS/Fluent using MPI due to
SSH access to worker nodes being prohibited for most users.

ANSYS 15.0 was installed using the
:download:`install_ansys.sh </decommissioned/sharc/software/install_scripts/apps/ansys/15.0/install_ansys.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansys/15.0/binary </decommissioned/sharc/software/modulefiles/apps/ansys/15.0/binary>`.

ANSYS 16.1 was installed using the
:download:`install_ansys.sh </decommissioned/sharc/software/install_scripts/apps/ansys/16.1/install_ansys.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansys/16.1 </decommissioned/sharc/software/modulefiles/apps/ansys/16.1>`.

ANSYS 17.2 was installed using the
:download:`install_ansys.sh </decommissioned/sharc/software/install_scripts/apps/ansys/17.2/install_ansys.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansys/17.2 </decommissioned/sharc/software/modulefiles/apps/ansys/17.2>`.

ANSYS 18.0 was installed using the
:download:`install_ansys_180.sh </decommissioned/sharc/software/install_scripts/apps/ansys/18.0/binary/install_ansys_180.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansys/18.0/binary </decommissioned/sharc/software/modulefiles/apps/ansys/18.0/binary>`.

ANSYS 18.2 was installed using the
:download:`install_ansys_182.sh </decommissioned/sharc/software/install_scripts/apps/ansys/18.2/binary/install_ansys_182.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansys/18.2/binary </decommissioned/sharc/software/modulefiles/apps/ansys/18.2/binary>`.

ANSYS 19.0 was installed using the
:download:`install_ansys_190.sh </decommissioned/sharc/software/install_scripts/apps/ansys/19.0/binary/install_ansys_190.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansys/19.0/binary </decommissioned/sharc/software/modulefiles/apps/ansys/19.0/binary>`.

ANSYS 19.1 was installed using the
:download:`install_ansys_191.sh </decommissioned/sharc/software/install_scripts/apps/ansys/19.1/binary/install_ansys_191.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansys/19.1/binary </decommissioned/sharc/software/modulefiles/apps/ansys/19.1/binary>`.

ANSYS 19.2 was installed using the
:download:`install_ansys_192.sh </decommissioned/sharc/software/install_scripts/apps/ansys/19.2/binary/install_ansys_192.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansys/19.2/binary </decommissioned/sharc/software/modulefiles/apps/ansys/19.2/binary>`.

ANSYS 19.3 was installed using the
:download:`install_ansys_193.sh </decommissioned/sharc/software/install_scripts/apps/ansys/19.3/binary/install_ansys_193.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansys/19.3/binary </decommissioned/sharc/software/modulefiles/apps/ansys/19.3/binary>`.

ANSYS 19.4 was installed using the
:download:`install_ansys_194.sh </decommissioned/sharc/software/install_scripts/apps/ansys/19.4/binary/install_ansys_194.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/ansys/19.4/binary </decommissioned/sharc/software/modulefiles/apps/ansys/19.4/binary>`.

ANSYS 20.1 was installed using the GUI installer with all features and the module
file is
:download:`/usr/local/modulefiles/apps/ansys/20.1/binary </decommissioned/sharc/software/modulefiles/apps/ansys/20.1/binary>`.

ANSYS 20.2 was installed using the GUI installer with all features and the module
file is
:download:`/usr/local/modulefiles/apps/ansys/20.2/binary </decommissioned/sharc/software/modulefiles/apps/ansys/20.2/binary>`.

ANSYS 21.1 was installed using the GUI installer with all features and the module
file is
:download:`/usr/local/modulefiles/apps/ansys/21.1/binary </decommissioned/sharc/software/modulefiles/apps/ansys/21.1/binary>`.

ANSYS 21.2 was installed using the GUI installer with all features and the module
file is
:download:`/usr/local/modulefiles/apps/ansys/21.2/binary </decommissioned/sharc/software/modulefiles/apps/ansys/21.2/binary>`.

ANSYS 22.2 was installed using the GUI installer with all features and the module
file is
:download:`/usr/local/modulefiles/apps/ansys/22.2/binary </decommissioned/sharc/software/modulefiles/apps/ansys/22.2/binary>`.


----------

ANSYS 20.1, and higher were installed using the GUI installer and then permissions were corrected as follows::

    chmod 775 -R /usr/local/packages/apps/ansys/20.1/binary
    chmod 775 -R /usr/local/packages/apps/ansys/20.2/binary
    chmod 775 -R /usr/local/packages/apps/ansys/21.1/binary
    chmod 775 -R /usr/local/packages/apps/ansys/21.2/binary
    chmod 775 -R /usr/local/packages/apps/ansys/22.2/binary

Please follow the same install directory structure.



For versions 19.3 & 19.4 and onward mapdl will not run without modifying the file::

    /usr/local/packages/apps/ansys/19.4/binary/v194/ansys/bin/anssh.ini

The following instruction should be inserted at line 2127 in ``anssh.ini``::

    setenv KMP_AFFINITY compact

