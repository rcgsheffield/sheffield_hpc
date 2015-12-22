.. index::
    single: bcbio

bcbio
=====
.. sidebar:: bcbio

   :Latest version: Unknown
   :Dependancies: gcc 5.2, R 3.2.1, Anaconda Python 2.3
   :URL: http://bcbio-nextgen.readthedocs.org/en/latest/

A python toolkit providing best-practice pipelines for fully automated high throughput sequencing analysis. You write a high level configuration file specifying your inputs and analysis parameters. This input drives a parallel pipeline that handles distributed execution, idempotent processing restarts and safe transactional steps. The goal is to provide a shared community resource that handles the data processing component of sequencing analysis, providing researchers with more time to focus on the downstream biology.

Usage
-----
Load the development version of bcbio with the command. The development version may be upgraded or modified at any time without warning. ::

    module load apps/gcc/5.2/bcbio/devel

This correctly populates the PATH, LD_LIBRARY_PATH and PERL5LIB environment variables for bcbio usage.

Example batch submission
------------------------
TODO

Integration with SGE
---------------------
TODO

Installation Notes
------------------
These are primarily for system administrators.

**Development version**

The development version was installed using gcc 5.2, R 3.2.1 and Anaconda Python 2.3.

* `install_bcbio_devel.sge <https://github.com/rcgsheffield/iceberg_software/blob/master/software/install_scripts/apps/gcc/5.2/bcbio/install_bcbio_devel.sge>`_ This is a SGE submit script. The long running time of the installer made it better-suite to being run as a batch job.
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

Testing
-------
The following test script was submitted to the system. All tests passed. The output is at ``/usr/local/packages6/apps/gcc/5.2/bcbio/devel/tests/tests_28_8_2015`` ::

  #!/bin/bash
  #$ -pe openmp 12
  #$ -l mem=4G  #Per Core!
  #$ -l rmem=4G #Per Core!

  bcbio_dir=/data/fe1mpc/bcbio_install/tools
  module add apps/gcc/5.2/bcbio/devel

  git clone https://github.com/chapmanb/bcbio-nextgen.git
  cd bcbio-nextgen/tests
  ./run_tests.sh devel
  ./run_tests.sh rnaseq
