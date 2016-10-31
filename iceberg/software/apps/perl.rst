Perl
====

.. sidebar:: Perl

   :Latest Version: 5.24.0
   :URL: https://www.perl.org/

Perl 5 is a programming language originally designed for text/report processing but now widely used by the bioinformatics community due to its ability to identify and process patterns in sequences of data.  Perl 5 is also used by Linux/UNIX systems administrators as it has borrowed much from shell scripting languages and contains functionality for manipulating files and directory trees.

Usage
-----
The default version of Perl on the system is 5.10.1; no ``module`` command is required to use it ::

        $ perl --version

        This is perl, v5.10.1 (*) built for x86_64-linux-thread-multi

However you may see warnings when trying to install Perl software that this version (or the ``cran`` package manage tool that comes with it) is too old; in this case you can activate a more recent version using ::

        module load apps/gcc/4.4.7/perl/5.24.0

Several Perl modules have been upgraded/installed for this instance of Perl:

* CPAN, the original Perl package management tool, was upgraded to 2.14
* BioPerl 1.007000 (aka v1.7.0) was installed.  `BioPerl <http://bioperl.org/>`_ is a collection of Perl modules that facilitate the development of Perl scripts for bioinformatics applications. It has played `an integral role in the Human Genome Project <https://www.foo.be/docs/tpj/issues/vol1_2/tpj0102-0001.html>`_.  BioPerl has pre-requisites of ``inc::latest`` (0.500) and ``Module::Build`` (0.4220).
* ``Term::ReadKey`` (2.37) and ``Term::Readline::Gnu`` (1.34) were installed; these make interactive use of CPAN more pleasant.
* ``local::lib`` was installed, which allows users to install additional Perl modules in their home directories.  MORE INFO NEEDED (see `Installing Perl modules`_).
* ``App::cpanminus`` (1.7042) was installed, which provides the ``cpanm`` program.  This is considered by some to be a superior package management tool over ``cpan``.

You can confirm that you are using this newer version of Perl (and have access to BioPerl) using ::

        $ perl --version

        Summary of my perl5 (revision 5 version 24 subversion 0) configuration:

        $ perl -MBio::Root::Version -le 'print $Bio::Root::Version::VERSION'

        1.007000
        ...

**Performance**:  5.24.0 `can be significantly faster <https://www.nu42.com/2015/12/go-faster-stripes-for-perl-programs.html>`_ than earlier versions of Perl 5 for arithemetic operations.


Installing Perl modules
----------------------- 

If using a version of Perl activated using ``module load`` then you can subsequently easily install Perl modules in your home directory (within what's called a Perl *local::lib*).  Run the following ::

        eval $(perlvers="$(perl -e 'print $^V')"; perl -I$HOME/.perl$perlvers/lib/perl5 -Mlocal::lib=$HOME/.perl$perlvers)

The next time you try to use ``cpanm`` to install a package it should install it into the (hidden) directory ``.perl5.x.y`` within your home directory.  For example, the following installs the ``Bio::Tradis`` Perl module into ``~/.perl5.24.0/`` ::

        module load apps/gcc/4.4.7/perl/5.24.0
        eval $(perlvers="$(perl -e 'print $^V')"; perl -I$HOME/.perl$perlvers/lib/perl5 -Mlocal::lib=$HOME/.perl$perlvers)
        cpanm Bio::Tradis

If you always want to have your Perl *local::lib* available then you may want to add the ``eval ...`` line above to your ``~/.bashrc`` file.

Installation instructions
-------------------------

**Version 5.24.0**

`This script <https://github.com/mikecroucher/HPC_Installers/blob/master/apps/perl/5.24.0/sheffield/iceberg/install_perl_5.24.0.sh>`__:

#. Downloads, unpacks, builds (using the system GCC (4.4.7)), tests then installs Perl (in ``/usr/local/packages6/apps/gcc/4.4.7/perl/5.24.0/``)
#. Installs `this modulefile <https://github.com/mikecroucher/HPC_Installers/blob/master/apps/perl/5.24.0/sheffield/iceberg/perl_5.24.0_modulefile>`_ as ``/usr/local/modulefiles/apps/gcc/4.4.7/perl/5.24.0``

`PerlBrew <https://perlbrew.pl/>`_ *could* have been used to install and manage multiple versions of Perl but it offers relatively few advantages over Environment Modules and the latter are already used system-wide for package management.
