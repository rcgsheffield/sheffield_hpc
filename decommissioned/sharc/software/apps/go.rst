.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _sharc_go:

Go
==

.. sidebar:: Go

   :URL: https://golang.org/
   :documentation: https://golang.org/doc/

The Go programming language is an open source project to
make programmers more productive.

Go is a compiled language, and makes standalone binaries.
Once a Go program is compiled, you can run it without
the need to set environment variables.

Go is not installed on HPC in the usual sense (at least not yet).
But you can use ``conda`` to download it:

Installing Go via conda
-----------------------

After connecting to ShARC, start an interactive session with
the :ref:`qrshx` command.

Load ``conda`` ::

   module load apps/python/conda

create a ``conda`` environment (you can choose a different name if you want) ::

   conda create --name my-go-stuff

activate it. ::

   . activate my-go-stuff

(On newer versions of conda, it's ``conda activate go``)

Following `the conda-forge page <https://anaconda.org/conda-forge/go>`_ install Go. ::

   conda install --channel conda-forge go

Now you should be able to run the Go compiler to see its help message: ::

   go

Running the Go compiler
-----------------------

In subsequent sessions, you do not need to create a conda environment,
nor install go.
You do need to load conda and activate your environment: ::

   module load apps/python/conda
   . activate my-go-stuff

Learning Go and other Go resources
----------------------------------

The main Go website: https://golang.org/

An interactive tour: https://tour.golang.org/welcome/1

Effective Go: https://golang.org/doc/effective_go.html

An interactive web page for small Go snippets: https://play.golang.org/

END

