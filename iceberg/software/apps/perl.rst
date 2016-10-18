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

You can then confirm that you are using this newer version with ::

    $ perl --version

    Summary of my perl5 (revision 5 version 24 subversion 0) configuration:
    ...

Installing Perl modules
-----------------------

TODO

BEST TO USE PERLBREW

CPANM TO INSTALL IN HOME DIR

    module load apps/gcc/4.4.7/perl/5.24.0
    cpanm -L ~/perl-5.24.0 --self-contained Some::Module
    export PERL5LIB="${HOME}/perl-5.24.0:${PERL5LIB}"

INSTALLING WITH CPANM OFTEN TAKES SOME TIME

PROVIDE EXAMPLE

Installation instructions
-------------------------

Install perlbrew ::

    export PERLBREW_ROOT=/usr/local/packages6/apps/gcc/4.4.7/perlbrew/0.76/
    mkdir -p ${PERLBREW_ROOT}
    wget https://install.perlbrew.pl -O install.perlbrew.pl
    chmod +x install.perlbrew.pl
    bash ./install.perlbrew.pl

Install and activate a newer particular version of Perl ::

    source ${PERLBREW_ROOT}/etc/bashrc
    perlbrew install 5.24.0


Create modulefile ``/usr/local/modulefiles/apps/gcc/4.4.7/perlbrew/0.76`` using ::

    perlbrew use 5.x.x
    perlbrew install-cpanm
    env | grep -i perl
