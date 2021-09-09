.. image:: https://readthedocs.org/projects/iceberg/badge/?version=latest
    :target: https://readthedocs.org/projects/iceberg/builds/

Sheffield High Performance Computing Documentation
==================================================

This is the source for the documentation of Bessemer and ShARC, The University of Sheffield's High Performance Computing clusters.

It is written in the reStructuredText_ (*rst*) format and the Sphinx_ tool is used to convert this to a set of HTML pages.

For a guide on the rst file format see `this <http://thomas-cokelaer.info/tutorials/sphinx/rest_syntax.html>`_ document.

Rendered Documentation
----------------------
`This website <https://docs.hpc.shef.ac.uk/en/latest/>`_  is currently automatically built from this repository:
each push to the ``master`` branch causes the `ReadTheDocs <https://readthedocs.org/>`__ service to
build and serve the documentation.

The ReadTheDocs build configuration is stored in the ``.readthedocs.yaml`` file with the Python version pinned to 3.7 and two PIP 
requirements files. The first requirements file is ``setuptoolsrequirements.txt``  and is set in order to first pin setuptools to 
version 57.5.0 in ``setuptoolsrequirements.txt`` to retain support for the current theme. See the following for details: 
https://github.com/ryan-roemer/sphinx-bootstrap-theme/issues/216 

The second requirements file ``requirements.txt`` then installs the remaining dependencies.

Please note that the use of the ``.readthedocs.yaml`` file will also override certain webGUI settings set in the ReadTheDocs administrative panel.

How to Contribute
-----------------
To contribute to this documentation, first you have to fork it on GitHub and clone it to your machine, see `Fork a Repo <https://help.github.com/articles/fork-a-repo/>`_ for the GitHub documentation on this process.

Once you have the git repository locally on your computer,
you will need to install specific versions of the ``sphinx`` and ``sphinx_bootstrap_theme`` to be able to build the documentation.
See the instructions below for how to achieve this.

Once you have made your changes and updated your Fork on GitHub you will need to `Open a Pull Request <https://help.github.com/articles/using-pull-requests/>`_.
All changes to the repository should be made through Pull Requests, including those made by the people with direct push access.

Building the documentation on a local Windows machine
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Install **Python 3** on your machine by downloading and running the `Miniconda installer`_:

   * Install for *just you*;
   * Install to the default location (e.g. ``C:\Users\myusername\Miniconda3``);
   * Do **not** *add Anaconda to your PATH environment variable*;
   * Do **not** *register Anaconda as your default Python 3*.

#. Click *Start* -> *Anaconda3 (64-bit)* -> *Anaconda Prompt* to open a terminal window.

#. Create a new *conda environment* for building the documentation by running the following from this window: ::

    conda create --name sheffield_hpc python=3
    conda activate sheffield_hpc	# . activate sheffield_hpc on older versions of conda
    pip install -r requirements.txt

#. To build the HTML documentation run: ::

    make html
	
   Or if you don't have the ``make`` utility installed on your machine then build with *sphinx* directly: ::

    sphinx-build . ./html

Building the documentation on a local Linux machine
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Ensure Python 3 is installed.
#. Create a `virtual environment <https://docs.python.org/3/tutorial/venv.html>`_ to install sphinx into: ::

    mkdir -m 700 ~/.venvs
    python3 -m venv ~/.venvs/sheffield_hpc_py3
    source ~/.venvs/sheffield_hpc_py3/bin/activate

#. Install the Python packages needed to build the HTML documentation: ::

     pip3 install -r requirements.txt

#. Build the documentation: ::

     make html

Building the documentation on a local Mac machine
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Ensure Python 3 is installed.  If you do not already have a python distribution installed, we recommend you install :ref:`Miniconda <Miniconda installer>`.
#. Install the Python packages needed to build the HTML documentation.  If you are using (mini)conda create a new *conda environment* for building the documentation by running: ::

    export PATH=${HOME}/miniconda3/bin:$PATH
    conda create -n sheffield_hpc python=3
    pip install -r requirements.txt

   If you are *not* using (mini)conda to provide Python 3: ::

    mkdir -m 700 ~/.venvs
    python3 -m venv ~/.venvs/sheffield_hpc_py3
    source ~/.venvs/sheffield_hpc_py3/bin/activate
    pip3 install --requirement requirements.txt

#. To build the HTML documentation run::

    make html

Check external links
^^^^^^^^^^^^^^^^^^^^

Do this with: ::

   make linkcheck

Continuous build and serve
^^^^^^^^^^^^^^^^^^^^^^^^^^

Build and serve the site and automatically rebuild when source files change:

    make livehtml

Testing the building of the documentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The validity of the reStructuredText in this repo and the ability to convert that to HTML with Sphinx can be tested in three ways:

* Locally by contributors when they run e.g. ``make html``
* By a [GitHub Actions](https://github.com/rcgsheffield/sheffield_hpc/actions/) Workflow each time a contributor creates or updates a Pull Request.
* By `ReadTheDocs <https://readthedocs.org/projects/iceberg/>`__ on each push to the ``master`` branch.

(Re)-generating PNG images from Mermaid.js diagram definitions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Some diagrams, such as ``images/hpcgateway-sequence-diag.png`` 
have been generated with `mermaid-cli <https://github.com/mermaid-js/mermaid-cli>`__ 
and Mermaid.js diagram definitions such as ``images/hpcgateway-sequence-diag.mmd``.
How to install mermaid-cli and regenerate one of these diagrams: ::

  yarn add @mermaid-js/mermaid-cli 
  ./node_modules/.bin/mmdc -i images/hpcgateway-sequence-diag.mmd -o images/hpcgateway-sequence-diag.png

.. _Sphinx: https://www.sphinx-doc.org/en/master/
.. _reStructuredText: https://docutils.sourceforge.io/rst.html
.. _Miniconda installer: https://conda.io/miniconda.html
