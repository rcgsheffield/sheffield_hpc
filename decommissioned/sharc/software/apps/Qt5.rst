.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Qt5
========

.. sidebar:: Qt5

   :Versions:  5.12
   :Dependencies: dev/gcc/8.2, dev/cmake/3.17.1/gcc-8.2
   :URL: https://www.qt.io/

Qt is a widget toolkit for creating graphical user interfaces as well as cross-platform applications that run on various software and hardware platforms such as Linux, Windows, macOS, Android or embedded systems with little or no change in the underlying codebase while still being a native application with native capabilities and speed.


About Qt5 on ShARC
--------------------

Qt5 on ShARC works in both normal ``qrshx`` sessions and accelerated ``qsh-vis`` sessions and is installed to provide functionality to other downstream software which uses Qt5 as a dependency e.g. Paraview and ParaFOAM (OpenFOAM.)



Installation Notes
------------------
Qt 5.12 was installed using GCC 8.2 with the script :download:`/usr/local/packages/apps/Qt5/5.12/gcc-8.2-cmake-3.17.1/install_Qt5.sge </decommissioned/sharc/software/install_scripts/apps/Qt5/5.12/install_Qt5.sge>`

Note that this compilation will take significant resources and several hours to finish which is why this installation script uses a SGE submission.


Testing
-------
Qt 5.12 was tested with the helloworld application which can be found at https://github.com/tlanc007/qt5-qml-cpp-cmake-helloworld.git


Modulefile
----------
The module file is on the system at :download:`/usr/local/modulefiles/apps/Qt5/5.12/gcc-8.2-cmake-3.17.1 </decommissioned/sharc/software/modulefiles/apps/Qt5/5.12/gcc-8.2-cmake-3.17.1>`.

This module file defines two key environment variables to configure the correct fonts via ``QT_QPA_FONTDIR`` and sets the correct temp directory for lock files with ``XDG_RUNTIME_DIR``. The correction for the ``XDG_RUNTIME_DIR`` location may become unnecessary in the future as this may be added to a scheduler `prolog script <http://www.softpanorama.org/HPC/Grid_engine/prolog_and_epilog_scripts.shtml>`_.

