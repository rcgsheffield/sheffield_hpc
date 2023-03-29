udunits
=======

.. sidebar:: libunistring
    
    .. tabs::
     .. group-tab:: Stanage
        :Versions: 2.2.28, 2.2.26
        :URL: https://www.unidata.ucar.edu/software/udunits

     .. group-tab:: Bessemer
        :Versions: 2.2.26
        :URL: https://www.unidata.ucar.edu/software/udunits

     .. group-tab:: Sharc
        :version: 2.2.28, 2.2.26
        :URL: https://www.unidata.ucar.edu/software/udunits



The UDUNITS package supports units of physical quantities. 
Its C library provides for arithmetic manipulation of units and for conversion 
of numeric values between compatible units. The package contains an extensive unit database, 
which is in XML format and user-extendable. The package also contains a command-line utility 
for investigating units and converting values.

.. caution::

        UDUNITS is typically loaded as an external dependency for R. Please ensure you select the matching 
        GCC compiler versions of your version of R and the UDUNITS libraries.

--------

Usage
-----

To make this library available, run one of the following: 

.. tabs:: 

   .. group-tab:: Stanage

    .. code-block:: console
         
      module load UDUNITS/2.2.26-foss-2020a
      module load UDUNITS/2.2.26-GCCcore-8.3.0                    
      module load UDUNITS/2.2.26-GCCcore-10.2.0                
      module load UDUNITS/2.2.28-GCCcore-11.2.0                
      module load UDUNITS/2.2.28-GCCcore-11.3.0

   .. group-tab:: Bessemer

    .. code-block:: console
         
      module load UDUNITS/2.2.26-foss-2020a
      module load UDUNITS/2.2.26-GCCcore-8.3.0 

   .. group-tab:: Sharc

    .. code-block:: console

      module load libs/udunits/2.2.26/gcc-4.9.4
      module load libs/udunits/2.2.28/gcc-8.2

--------

Installation notes
------------------
This section is primarily for administrators of the system. 

.. tabs::

   .. group-tab:: Stanage
      
        udunits was installed using Easybuild 4.7.0, build details can be found in $EBROOTGMP/easybuild with the module loaded.

   .. group-tab:: Bessemer
    
        udunits was installed using Easybuild 4.4.0.

   .. group-tab:: Sharc
        **Version 2.2.28**

        This was compiled with GCC 8.2.0

        * To install Qsub :download:`this script </sharc/software/install_scripts/libs/udunits/2.2.28/gcc-8.2/install_udunits.sh>`
        * The installer script automatically creates a module file and logs.


        **Version 2.2.26**

        This was compiled with GCC 4.9.4

        * Run :download:`this script </sharc/software/install_scripts/libs/udunits/2.2.26/gcc-4.9.4/install_udunits.sh>`
        * Next, :download:`this modulefile </sharc/software/modulefiles/libs/udunits/2.2.26/gcc-4.9.4>` as ``/usr/local/modulefiles/libs/udunits/2.2.26/gcc-4.9.4`` 

Testing
-------

.. tabs::

   .. group-tab:: Stanage

    1. load Module

    2. Run “udunits2“

    3. For my test i converted 5km to miles , getting the following results:

    .. code-block:: console
        
        You have: 5km
        You want: miles
        5 km = 3.10686 miles
        x/miles = 0.621371*(x/km)