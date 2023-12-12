.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sharc_armadillo:

armadillo
=========

.. sidebar:: armadillo

   :Latest version: 7.950.1
   :URL: http://arma.sourceforge.net/

Armadillo is a high quality linear algebra library (matrix maths) for the C++ language, aiming towards a good balance between speed and ease of use.

Usage
-----
To make this library available, run the following: ::

        module load libs/armadillo/7.950.1/gcc-4.9.4

To compile this `example program <http://arma.sourceforge.net/docs.html#example_prog>`_ ::

        #include <iostream>
        #include <armadillo>
        
        using namespace std;
        using namespace arma;
        
        int main()
        {
        mat A = randu<mat>(4,5);
        mat B = randu<mat>(4,5);
        
        cout << A*B.t() << endl;
        
        return 0;
        }

If you save the above program as example.cpp, once you load the module it can be compiled using ::
 
        g++ example.cpp -o example -O2 -larmadillo 


Installation notes
------------------
This section is primarily for administrators of the system. 

Version 7.950.1
---------------

This was compiled with GCC 4.9.4 and the Intel MKL

* Run :download:`this script </decommissioned/sharc/software/install_scripts/libs/armadillo/7.950.1/gcc-4.9.4/install_armadillo.sh>`
* Next, :download:`this modulefile </decommissioned/sharc/software/modulefiles/libs/armadillo/7.950.1/gcc-4.9.4>` as ``/usr/local/modulefiles/libs/armadillo/7.950.1/gcc-4.9.4`` 

