.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

SCOTCH
======

.. sidebar:: SCOTCH
   
   :Version: 6.0.4
   :Dependencies: GCC compiler and Open MPI
   :URL: http://scotch.gforge.inria.fr/ 
   :Documentation: https://gforge.inria.fr/docman/?group_id=248


Software package and libraries for sequential and parallel graph partitioning, static mapping and clustering, sequential mesh and hypergraph partitioning, and sequential and parallel sparse matrix block ordering


Usage
-----

SCOTCH and PT SCOTCH 6.0.4 can be activated using the module file::

    module load libs/scotch/6.0.4/gcc-6.2-openmpi-2.0.1

Installation notes
------------------

SCOTCH was installed using the
:download:`install_scotch.sh </decommissioned/sharc/software/install_scripts/libs/scotch/6.0.4/install_scotch.sh>` script; the module
file is
:download:`gcc-6.2-openmpi-2.0.1 </decommissioned/sharc/software/modulefiles/libs/scotch/6.0.4/gcc-6.2-openmpi-2.0.1>`.

The installation was tested using the ''make check'' command as part of running the above installation script.
    
