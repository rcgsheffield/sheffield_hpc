.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst
.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. _magma_sharc:

Magma
=====

.. sidebar:: Magma

   :Latest Version: 2.24
   :URL: http://magma.maths.usyd.edu.au/magma/


Magma is a software package designed for computations in algebra, number theory, algebraic geometry and algebraic combinatorics. 
It provides a mathematically rigorous environment for defining and working with structures such as 
groups, rings, fields, modules, algebras, schemes, curves, graphs, designs, codes and many others. 
Magma also supports a number of databases designed to aid computational research in those areas of mathematics which are algebraic in nature. 

`This overview <http://magma.maths.usyd.edu.au/magma/overview/2/19/>`__ provides a summary of Magma's main features.

Magma is distributed by the Computational Algebra Group at the University of Sydney.

.. note::
   This page details an installation of Magma that is 
   only licensed for use by members of the Dept of Computer Science and their collaborators 
   on the :ref:`Dept of Computer Science (COM) nodes in ShARC <groupnodes_sharc>`
   It is not possible to use this installation of Magma on other nodes.

Interactive Usage
-----------------

After connecting to ShARC (see :ref:`ssh`),  start an interactive session on the Dept of Computer Science's nodes: ::

   qrshx -P rse -q rse-interactive.q 

Make an additional set of modulefiles available: ::

   module use /usr/local/community/rse/mods

Load a version of Magma (with `AVX <https://en.wikipedia.org/wiki/Advanced_Vector_Extensions>`__ support): ::

   module load apps/magma/2.24/binary-avx64

Start Magma: ::

   magma

Alternatively, for Magma with **CUDA** support (and 1 NVIDIA P100 GPU): ::

   qrshx -P rse -q rse-interactive.q -l gpu=1
   module use /usr/local/community/rse/mods
   module load apps/magma/2.24/binary-cuda8  # also loads CUDA 8.0.44
   magma

Documentation
-------------

See the `Magma Handbook <http://magma.maths.usyd.edu.au/magma/handbook/>`__.

Installation notes
------------------
These are primarily for administrators of the system.

2.24-10
^^^^^^^
* Install script: :download:`install.sh </decommissioned/sharc/software/install_scripts/community/rse/apps/magma/2.24/install.sh>`
* AVX build module file: :download:`/usr/local/community/rse/mods/apps/magma/2.24/binary-avx64 </decommissioned/sharc/software/modulefiles/community/rse/apps/magma/2.24/binary-avx64>`.
* CUDA build module file: :download:`/usr/local/community/rse/mods/apps/magma/2.24/binary-cuda8 </decommissioned/sharc/software/modulefiles/community/rse/apps/magma/2.24/binary-cuda8>`.

