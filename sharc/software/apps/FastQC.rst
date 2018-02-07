FastQC
======

.. sidebar:: FastQC

   :Version: 0.11.7
   :Dependencies: Java for GUI. Module loaded for Java 1.8.0_102.
   :URL: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
   :Documentation: https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/

FastQC aims to provide a simple way to do some quality control checks on raw sequence data coming from high throughput sequencing pipelines. It provides a modular set of analyses which you can use to give a quick impression of whether your data has any problems of which you should be aware before doing any further analysis.

Usage
-----

FastQC version can be activated using the module files::

	module load apps/FastQC/0.11.7/binary

Then run using ``fastqc``.

Installation notes
------------------

Installation of FastQC 0.11.7 on Sharc was a binary installation. Actually installing FastQC is as simple as unzipping the zip file it comes in into a suitable location. The file is downloaded by the command::

	wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip

There is a wrapper script, called 'fastqc' which is the easiest way to  start the program. The wrapper is in the top level of the FastQC installation.  You may need to make this file executable::

	chmod 755 fastqc

