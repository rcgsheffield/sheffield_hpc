.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

GATK
====

.. sidebar:: GATK

   :Version: 4.1.4
   :Dependencies: Java 1.8
   :URL: https://www.broadinstitute.org/gatk/
   :Documentation: https://www.broadinstitute.org/gatk/guide/

The Genome Analysis Toolkit or GATK is a software package for analysis of high-throughput sequencing data, developed by the Data Science and Data Engineering group at the Broad Institute. The toolkit offers a wide variety of tools, with a primary focus on variant discovery and genotyping as well as strong emphasis on data quality assurance. Its robust architecture, powerful processing engine and high-performance computing features make it capable of taking on projects of any size.

Interactive Usage
-----------------
After connecting to ShARC (see :ref:`ssh`),  start an interactive sesssion with the ``qsh``, ``qrshx`` or ``qrsh`` command.

The latest version of GATK (currently 4.1.4) is made available with the command

.. code-block:: none

        module load apps/gatk/4.1.4/binary

Version 4.1.4 of GATK also loads Java 1.8 module.

An environment variable called ``GATKHOME`` is created by the module command that contains the path to the requested version of GATK.

Thus, you can run the program with the command ::

  gatk Anytool toolArgs

You can obtain a full list of tools using ::

  gatk --list


Installation notes
------------------

GATK 4.1.4 was installed using
:download:`install_gatk.sh </decommissioned/sharc/software/install_scripts/apps/gatk/4.1.4/binary/install_gatk.sh>` script, the module
file is
:download:`/usr/local/modulefiles/apps/gatk/4.1.4/binary </decommissioned/sharc/software/modulefiles/apps/gatk/4.1.4/binary>`.


