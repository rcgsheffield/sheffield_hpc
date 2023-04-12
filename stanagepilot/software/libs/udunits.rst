.. _udunits_stanage:

udunits
=======

.. sidebar:: udunits

    :Versions: 2.2.28, 2.2.26
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

.. code-block:: 
     
  module load UDUNITS/2.2.26-foss-2020a
  module load UDUNITS/2.2.26-GCCcore-8.3.0                    
  module load UDUNITS/2.2.26-GCCcore-10.2.0                
  module load UDUNITS/2.2.28-GCCcore-11.2.0                
  module load UDUNITS/2.2.28-GCCcore-11.3.0
  
--------

Installation notes
------------------
This section is primarily for administrators of the system. 

udunits was installed using Easybuild 4.7.0, build details can be found in ``$EBROOTGMP/easybuild`` with the module loaded.

------------------

Testing
-------

1. Load module.
2. Run “udunits2“.
3. For this test we convert 5km into miles, which produces the following results:

.. code-block::

    You have: 5km
    You want: miles
    5 km = 3.10686 miles
    x/miles = 0.621371*(x/km)