CDO
===

.. sidebar:: CDO

   :Version:  1.7.2
   :URL: https://code.zmaw.de/projects/cdo

CDO is a collection of command line Operators to manipulate and analyse Climate and NWP model Data.
Supported data formats are GRIB 1/2, netCDF 3/4, SERVICE, EXTRA and IEG. There are more than 600 operators available.

Interactive Usage
-----------------
After connecting to Iceberg (see :ref:`ssh`),  start an interactive session with the `qsh` or `qrsh` command.

To add the cdo command to the system PATH, execute the following command ::

        module load apps/gcc/5.3/cdo/1.7.2

Documentation
-------------
The CDO manual is available online at https://code.zmaw.de/projects/cdo/embedded/index.html

Installation notes
------------------
  Installation  ::

     (1) Download the latest current version:

         wget https://code.zmaw.de/attachments/download/12350/cdo-current.tar.gz

     (2) Extract the files into a working directory  ( I have used /data/cs1ds/2016/cdo ) :

         gunzip cdo-current.tar.gz 
         tar -xvf cdo-current.tar

     (3) Install the program  ( I have used /usr/local/extras/CDO ):

         module load compilers/gcc/5.3
         ./configure  --prefix=/usr/local/extras/CDO --with-netcdf=/usr/local/extras/netcdf/4.3.2
         make install



Modulefile
----------
* The module file is on the system at `/usr/local/modulefiles/apps/gcc/5.3/cdo`

Its contents are ::

 #%Module1.0#####################################################################
 ##
 ## CDO Climate Data Operators Module file.
 ##

 ## Module file logging
 source /usr/local/etc/module_logging.tcl
 ##

 proc ModulesHelp { } {
        puts stderr "Makes Climate Data Operator $version available"
  }

 set version 1.7.2
 set BIN_DIR /usr/local/extras/CDO/$version

 module-whatis   "Makes CDO (Climate Data Operators) $version available"

 prepend-path PATH $BIN_DIR/bin
 

