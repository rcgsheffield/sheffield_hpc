.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

Plink
=====

.. sidebar:: Plink

   :Versions:  1.90b6.5
   :Support Level: 
   :Dependencies: None
   :URL: https://www.cog-genomics.org/plink2

PLINK is a free, open-source whole genome association analysis toolset, designed to perform a range of basic, large-scale analyses in a computationally efficient manner.

Interactive Usage
-----------------
After connecting to sharc (see :ref:`ssh`),  start an interactive sesssion with the ```qsh`` or ``qrsh`` command.

The latest version of Plink is made available with the command

.. code-block:: none

        module load apps/plink

Alternatively, you can load a specific version.  To access the latest version ::

       module load apps/plink/1.90b6.5/binary

After making a version of Plink available you can then run it using ``plink`` on the command line.

Installation notes
------------------
These are primarily for administrators of the system.

Both versions of Plink were installed like so ::

  $ver=1.90b6.5

  mkdir plink_build
  cd plink_build
  unzip plink_linux_x86_64.zip
  rm plink_linux_x86_64.zip
  mkdir -p /usr/local/packages/apps/plink/$ver/binary
  mv * /usr/local/packages/apps/plink/$ver/binary

The modulefiles is at :download:`/usr/local/modulefiles/apps/plink/1.90b6.5/binary </decommissioned/sharc/software/modulefiles/apps/plink/1.90b6.5/binary>`.


