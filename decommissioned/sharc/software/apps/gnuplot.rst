.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Gnuplot
=======

.. sidebar:: Gnuplot
   
   :Version: 5.0.6
   :Dependencies: GCC compiler
   :URL: http://www.gnuplot.info/  
   :Documentation: http://www.gnuplot.info/documentation.html


Gnuplot is a portable command-line driven graphing utility for Linux, OS/2, MS Windows, OSX, VMS, and many other platforms. The source code is copyrighted but freely distributed (i.e., you don't have to pay for it). It was originally created to allow scientists and students to visualize mathematical functions and data interactively, but has grown to support many non-interactive uses such as web scripting. It is also used as a plotting engine by third-party applications like Octave. Gnuplot has been supported and under active development since 1986. 


Usage
-----

Gnuplot 5.0.6 can be activated using the module file::

    module load apps/gnuplot/5.0.6/gcc-4.8.5

Installation notes
------------------

Gnuplot 5.0.6 was installed using the
:download:`install_gnuplot.sh </decommissioned/sharc/software/install_scripts/apps/gnuplot/5.0.6/gcc-4.8.5/install_gnuplot.sh>` script; the module
file is
:download:`gcc-4.8.5 </decommissioned/sharc/software/modulefiles/apps/gnuplot/5.0.6/gcc-4.8.5>`.
The installation of Gnuplot 5.0.6 was compiled with GCC 4.8.5 and was tested using the ``make check`` command as part of running the above installation script.
    

