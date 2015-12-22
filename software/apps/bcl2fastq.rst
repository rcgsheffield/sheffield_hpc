.. index::
    single: bcl2fastq

bcl2fastq
=========

.. sidebar:: bcl2fastq

   :Versions: 1.8.4
   :Support Level: Bronze
   :URL: http://support.illumina.com/downloads/bcl2fastq_conversion_software_184.html

Illumina sequencing instruments generate per-cycle BCL basecall files as primary sequencing output, but many downstream analysis applications use per-read FASTQ files as input. bcl2fastq combines these per-cycle BCL files from a run and translates them into FASTQ files. bcl2fastq can begin bcl conversion as soon as the first read has been completely sequenced.

Usage
-----
To make ``bcl2fastq`` available, use the following ``module`` command in your submission scripts ::

    module load apps/bcl2fastq/1.8.4

Installation Notes
------------------
These notes are primarily for system administrators.

Compilation was done using gcc 4.4.7. I tried it with gcc 4.8 but ended up with a lot of errors. The package is also dependent on Perl. Perl 5.10.1 was used which was the system Perl installed at the time. The RPM Perl-XML-Simple also needed installing. ::

  export TMP=/tmp
  export SOURCE=${TMP}/bcl2fastq
  export BUILD=${TMP}/bcl2fastq-1.8.4-build
  mkdir -p /usr/local/packages6/apps/gcc/4.4.7/bcl2fastq/1.8.4
  export INSTALL=/usr/local/packages6/apps/gcc/4.4.7/bcl2fastq/1.8.4

  mv bcl2fastq-1.8.4.tar.bz2 ${TMP}
  cd ${TMP}
  tar xjf bcl2fastq-1.8.4.tar.bz2

  mkdir ${BUILD}
  cd ${BUILD}
  ${SOURCE}/src/configure --prefix=${INSTALL}

  make
  make install
