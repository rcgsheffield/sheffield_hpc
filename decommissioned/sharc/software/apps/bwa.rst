.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

BWA
===

.. sidebar:: BWA
   
   :Version: 0.7.17
   :Dependency: Module loaded for GCC compiler 6.2.0
   :URL: http://bio-bwa.sourceforge.net
   :Documentation: http://bio-bwa.sourceforge.net/bwa.shtml

BWA is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome. It consists of three algorithms: BWA-backtrack, BWA-SW and BWA-MEM. The first algorithm is designed for Illumina sequence reads up to 100bp, while the rest two for longer sequences ranged from 70bp to 1Mbp. BWA-MEM and BWA-SW share similar features such as long-read support and split alignment, but BWA-MEM, which is the latest, is generally recommended for high-quality queries as it is faster and more accurate. BWA-MEM also has better performance than BWA-backtrack for 70-100bp Illumina reads. 

Usage
-----

BWA 0.7.17 can be activated using the module file::

    module load apps/bwa/0.7.17/gcc-6.2

The BWA executable is ``bwa``. Type ``bwa`` for a list of commands.

Installation notes
------------------

BWA 0.7.17 was installed using the
:download:`install_bwa.sh </decommissioned/sharc/software/install_scripts/apps/bwa/0.7.17/gcc-6.2/install_bwa.sh>` script; the module
file is
:download:`/usr/local/modulefiles/apps/bwa/0.7.17/gcc-6.2 </decommissioned/sharc/software/modulefiles/apps/bwa/0.7.17/gcc-6.2>`.
The installation of BWA 0.7.17 was compiled with GCC 6.2.0.
    

