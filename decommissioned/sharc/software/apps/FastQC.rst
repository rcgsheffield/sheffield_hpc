.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

FastQC
======

.. sidebar:: FastQC

   :Version: 0.11.7
   :Dependency: Java for GUI. Module loaded for Java 1.8.0_102.
   :URL: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
   :Documentation: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/

FastQC aims to provide a simple way to do some quality control checks on raw sequence data coming from high throughput sequencing pipelines. It provides a modular set of analyses which you can use to give a quick impression of whether your data has any problems of which you should be aware before doing any further analysis.

Usage
-----

FastQC version can be activated using the module file::

	module load apps/FastQC/0.11.7/binary

Then run using the command ``fastqc``.

Installation notes
------------------

FastQC was installed using the
:download:`install_fastqc.sh </decommissioned/sharc/software/install_scripts/apps/FastQC/0.11.7/install_fastqc.sh>` script, the module
file is
:download:`0.11.7 </decommissioned/sharc/software/modulefiles/apps/FastQC/0.11.7>`.
