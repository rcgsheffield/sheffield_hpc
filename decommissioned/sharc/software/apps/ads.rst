.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _ads_sharc:

ADS
===

.. sidebar:: ADS

   :Latest Version:  2020
   :URL: https://www.keysight.com/gb/en/products/software/pathwave-design-software/pathwave-advanced-design-system.html

Advanced Design System is an electronic design automation software system produced by Keysight EEsof EDA, a division of Keysight Technologies. It provides an integrated design environment to designers of RF electronic products such as mobile phones, pagers, wireless networks, satellite communications, radar systems, and high-speed data links.

Interactive Usage
-----------------
After connecting to sharc (see :ref:`ssh`),  start an interactive session with the :ref:`qrshx` command.

ADS 2020 is made available with the command ::

        module load apps/ads/2020/binary

You can then run the graphical interface of ADS by entering ``ads``.

Installation notes
------------------
These are primarily for administrators of the system.

**ADS 2020**

* Run the installer **./SETUP.sh** and follow instructions.
* Choose Install folder `/usr/local/packages/apps/ads/2020/binary`
* Choose a network license, and enter the license server adslm.shef.ac.uk

The module file is :download:`/usr/local/modulefiles/apps/ads/2020/binary </decommissioned/sharc/software/modulefiles/apps/ads/2020/binary>`.


