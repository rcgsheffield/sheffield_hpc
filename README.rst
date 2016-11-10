.. image:: https://travis-ci.org/rcgsheffield/sheffield_hpc.svg?branch=master
    :target: https://travis-ci.org/rcgsheffield/sheffield_hpc

Iceberg Documentation
=====================

Iceberg is The University of Sheffield's High Performance Computing cluster. The current official documentation for it is at `https://www.shef.ac.uk/cics/research <https://www.shef.ac.uk/cics/research>`_.

This repository contains a proposed replacement for the page linked to above. It makes use of `Sphinx <http://sphinx-doc.org/>`_ to build the results and represents a move to a more open, collaborative way of working.

For a guide on the rst file format see `this <http://thomas-cokelaer.info/tutorials/sphinx/rest_syntax.html>`_ document.

Rendered Documentation
----------------------
Two versions of the documentation are currently automatically built from this repository:

* `A website <http://docs.iceberg.shef.ac.uk/en/latest/>`_.
* `A .pdf document <http://readthedocs.org/projects/iceberg/downloads/pdf/latest/>`_.

How to Contribute
-----------------
To contribute to this documentation, first you have to fork it on GitHub and clone it to your machine, see `Fork a Repo <https://help.github.com/articles/fork-a-repo/>`_ for the GitHub documentation on this process.

Once you have the git repository locally on your computer, you will need to install ``sphinx`` and ``sphinx_bootstrap_theme`` to be able to build the documentation. See the instructions below for how to achieve this.

Once you have made your changes and updated your Fork on GitHub you will need to `Open a Pull Request <https://help.github.com/articles/using-pull-requests/>`_.
All changes to the repository should be made through Pull Requests, including those made by the people with direct push access.


Building the documentation on a local Windows machine
#####################################################

Install the following:-

* `Anaconda Python <https://store.continuum.io/cshop/anaconda>`_.

Install the following modules ::

     pip install sphinx sphinx_bootstrap_theme

To build the HTML documentation run::

    make html
	
Or if you don't have make then build with sphinx directly 

	sphinx-build . ./html

If you want to build the PDF documentation you will need:

* `GNU Make <http://gnuwin32.sourceforge.net/packages/make.htm>`_
* `MikTeX <http://miktex.org/download>`_

Then from the command line, the following will build the .pdf file ::

    make latexpdf

On first run, MikTeX will prompt you to install various extra LaTeX packages.


Building the documentation on a local Linux machine
###################################################


Install the following Python modules ::

     pip install sphinx sphinx_bootstrap_theme

Then run ::

     make html


Building the documentation on a local Mac machine
#################################################

For the HTML documentation you will need ``sphinx`` and ``sphinx_bootstrap_theme``. If you do not already have a python distribution installed, we recommend you install `Anaconda Python <https://store.continuum.io/cshop/anaconda>`_.

Then once installed, install the following module ::

     pip install sphinx_bootstrap_theme

To build the HTML documentation run::

    make html


Making Changes to the Documentation
-----------------------------------

The documentation consists of a series of `reStructured Text <http://sphinx-doc.org/rest.html>`_ files which have the ``.rst`` extension.
These files are then automatically converted to HTMl and combined into the web version of the documentation by sphinx.
It is important that when editing the files the syntax of the rst files is followed.
If there are any errors in your changes the build will fail and the documentaion  will not update, you can test your build locally by running ``make html``.
The easiest way to learn what files should look like is to read the ``rst`` files already in the repository.
