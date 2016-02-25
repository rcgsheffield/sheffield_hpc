bcbio
=====
.. sidebar:: bcbio

   :Latest version: 0.9.6a
   :Dependancies: gcc 5.2, R 3.2.1, Anaconda Python 2.3
   :URL: http://bcbio-nextgen.readthedocs.org/en/latest/

A python toolkit providing best-practice pipelines for fully automated high throughput sequencing analysis. You write a high level configuration file specifying your inputs and analysis parameters. This input drives a parallel pipeline that handles distributed execution, idempotent processing restarts and safe transactional steps. The goal is to provide a shared community resource that handles the data processing component of sequencing analysis, providing researchers with more time to focus on the downstream biology.

Usage
-----
Load version 0.9.6a of bcbio with the command ::

    module load apps/gcc/5.2/bcbio/0.9.6a

There is also a development version of bcbio installed on iceberg. This could change without warning and should not be used for production ::

    module load apps/gcc/5.2/bcbio/devel

These module commands add bcbio commands to the PATH, load any supporting environments and correctly configure the system for bcbio usage.

Once the module is loaded you can, for example, check the version of bcbio ::

  bcbio_nextgen.py -v

  /usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/anaconda/lib/python2.7/site-packages/matplotlib/__init__.py:872: UserWarning: axes.color_cycle is deprecated and replaced with axes.prop_cycle; please use the latter.
    warnings.warn(self.msg_depr % (key, alt_key))
  0.9.6a

To check how the loaded version of bcbio has been configured ::

    more $BCBIO_DIR/config/install-params.yaml

At the time of writing, the output from the above command is ::

  aligners:
  - bwa
  - bowtie2
  - rtg
  - hisat2
  genomes:
  - hg38
  - hg19
  - GRCh37
  isolate: true
  tooldir: /usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/tools
  toolplus: []

Example batch submission
------------------------
TODO

Integration with SGE
---------------------
TODO

Installation Notes
------------------
These are primarily for system administrators.

**0.9.6a**

Version 0.9.6a was installed using gcc 5.2, R 3.2.1 and Anaconda Python 2.3. The install was performed in two parts.

The first step was to run the SGE script below in batch mode. Note that the install often fails due to external services being flaky. See https://github.com/rcgsheffield/iceberg_software/issues/219 for details. Depending on the reason for the failure, it should be OK to simply restart the install. This particular install was done in one-shot...no restarts necessary.

* `install_bcbio_0.96a <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/apps/gcc/5.2/bcbio/install_bcbio_0.96a.sge>`_

The output from this batch run can be found in `/usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/install_output/`

Once the install completed, the module file (see Modulefile section) was created and loaded and the following upgrades were performed ::

  bcbio_nextgen.py upgrade --toolplus gatk=./GenomeAnalysisTK.jar
  bcbio_nextgen.py upgrade --genomes hg38 --aligners hisat2

The GATK .jar file was obtained from https://www.broadinstitute.org/gatk/download/

A further upgrade was performed on 13th January 2016. STAR had to be run directly because the bcbio upgrade command that made use of it kept stalling ( `bcbio_nextgen.py upgrade --data --genomes GRCh37 --aligners bwa --aligners star` ). We have no idea why this made a difference but at least the direct STAR run could make use of multiple cores whereas the bcbio installer only uses 1 ::

  #!/bin/bash
  #$ -l rmem=3G -l mem=3G
  #$ -P radiant
  #$ -pe openmp 16

  module load apps/gcc/5.2/bcbio/0.9.6a
  STAR --genomeDir /usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/genomes/Hsapiens/GRCh37/star --genomeFastaFiles /usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/genomes/Hsapiens/GRCh37/seq/GRCh37.fa --runThreadN 16 --runMode genomeGenerate --genomeSAindexNbases 14

  bcbio_nextgen.py upgrade --data --genomes GRCh37 --aligners bwa

Another upgrade was performed on 25th February 2016 ::

    module load apps/gcc/5.2/bcbio/0.9.6a
    bcbio_nextgen.py upgrade -u stable --data --genomes mm10 --aligners star --aligners bwa

As is usually the case for us, this stalled on the final STAR command. The exact call to STAR was found in `/usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/genomes/Mmusculus/mm10/star/Log.out` and run manually in a 16 core OpenMP script::

    STAR   --runMode genomeGenerate   --runThreadN 16   --genomeDir /usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/genomes/Mmusculus/mm10/star   --genomeFastaFiles /usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/genomes/Mmusculus/mm10/seq/mm10.fa      --genomeSAindexNbases 14   --genomeChrBinNbits 14

**Development version**

The development version was installed using gcc 5.2, R 3.2.1 and Anaconda Python 2.3.

* `install_bcbio_devel.sge <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/apps/gcc/5.2/bcbio/install_bcbio_devel.sge>`_ This is a SGE submit script. The long running time of the installer made it better-suited to being run as a batch job.
* `bcbio-devel modulefile <https://github.com/rcgsheffield/iceberg_software/blob/master/software/modulefiles/apps/gcc/5.2/bcbio/devel>`_ located on the system at ``/usr/local/modulefiles/apps/gcc/5.2/bcbio/devel``

The first install attempt failed with the error ::

  To debug, please try re-running the install command with verbose output:
  export CC=${CC:-`which gcc`} && export CXX=${CXX:-`which g++`} && export SHELL=${SHELL:-/bin/bash} && export PERL5LIB=/usr/local/packages6/apps/gcc/5.2/bcbio/devel/tools/lib/perl5:${PERL5LIB} && /usr/local/packages6/apps/gcc/5.2/bcbio/devel/tools/bin/brew install -v --env=inherit  --ignore-dependencies  git
  Traceback (most recent call last):
    File "bcbio_nextgen_install.py", line 276, in <module>
      main(parser.parse_args(), sys.argv[1:])
    File "bcbio_nextgen_install.py", line 46, in main
      subprocess.check_call([bcbio["bcbio_nextgen.py"], "upgrade"] + _clean_args(sys_argv, args, bcbio))
    File "/usr/local/packages6/apps/binapps/anacondapython/2.3/lib/python2.7/subprocess.py", line 540, in check_call
      raise CalledProcessError(retcode, cmd)
  subprocess.CalledProcessError: Command '['/usr/local/packages6/apps/gcc/5.2/bcbio/devel/anaconda/bin/bcbio_nextgen.py', 'upgrade', '--tooldir=/usr/local/packages6/apps/gcc/5.2/bcbio/devel/tools', '--isolate', '--genomes', 'GRCh37', '--aligners', 'bwa', '--aligners', 'bowtie2', '--data']' returned non-zero exit status 1

I manually ran the command ::

  export CC=${CC:-`which gcc`} && export CXX=${CXX:-`which g++`} && export SHELL=${SHELL:-/bin/bash} && export PERL5LIB=/usr/local/packages6/apps/gcc/5.2/bcbio/devel/tools/lib/perl5:${PERL5LIB} && /usr/local/packages6/apps/gcc/5.2/bcbio/devel/tools/bin/brew install -v --env=inherit  --ignore-dependencies  git

and it completed successfully. I then resubmitted the submit script which eventually completed successfully. It took several hours! At this point, I created the module file.

Bcbio was upgraded to the development version with the following interactive commands ::

    module load apps/gcc/5.2/bcbio/devel
    bcbio_nextgen.py upgrade -u development

The GATK .jar file was obtained from https://www.broadinstitute.org/gatk/download/ and installed to bcbio by running the following commands interactively ::

    module load apps/gcc/5.2/bcbio/devel
    bcbio_nextgen.py upgrade --tools --toolplus gatk=./cooper/GenomeAnalysisTK.jar

Module files
------------

* `0.9.6a <https://github.com/rcgsheffield/iceberg_software/blob/master/software/modulefiles/apps/gcc/5.2/bcbio/0.9.6a>`_

Testing
-------
**Version 0.9.6a**

The following test script was submitted to the system as an SGE batch script ::

  #!/bin/bash
  #$ -pe openmp 12
  #$ -l mem=4G  #Per Core!
  #$ -l rmem=4G #Per Core!

  module add apps/gcc/5.2/bcbio/0.9.6a

  git clone https://github.com/chapmanb/bcbio-nextgen.git
  cd bcbio-nextgen/tests
  ./run_tests.sh devel
  ./run_tests.sh rnaseq

The tests failed due to a lack of pandoc ::

  [2016-01-07T09:40Z] Error: pandoc version 1.12.3 or higher is required and was not found.
  [2016-01-07T09:40Z] Execution halted
  [2016-01-07T09:40Z] Skipping generation of coverage report: Command 'set -o pipefail; /usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/anaconda/bin/Rscript /data/fe1mpc/bcbio-nextgen/tests/test_automated_ou
  tput/report/qc-coverage-report-run.R
  Error: pandoc version 1.12.3 or higher is required and was not found.
  Execution halted
  ' returned non-zero exit status 1

The full output of this testrun is on the system at `/usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/tests/7-jan-2016/`

Pandoc has been added to the list of applications that need to be installed on iceberg.

**Development version**

The following test script was submitted to the system. All tests passed. The output is at ``/usr/local/packages6/apps/gcc/5.2/bcbio/0.9.6a/tests/tests_07_01_2016/`` ::

  #!/bin/bash
  #$ -pe openmp 12
  #$ -l mem=4G  #Per Core!
  #$ -l rmem=4G #Per Core!

  module add apps/gcc/5.2/bcbio/0.9.6a

  git clone https://github.com/chapmanb/bcbio-nextgen.git
  cd bcbio-nextgen/tests
  ./run_tests.sh devel
  ./run_tests.sh rnaseq
