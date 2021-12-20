.. _clang_bessemer:

Clang
=====

The Clang project provides a language front-end and tooling infrastructure
for languages in the C language family (C, C++, Objective C/C++, OpenCL, CUDA, and RenderScript) for the LLVM project.

Usage
-----

It is possible to switch versions of the Clang compiler suite using modules (if more than one version is installed).
After connecting to Bessemer, :ref:`start an interactive sessson <submit_interactive_bessemer>`
then load Clang using: ::

   module load Clang/10.0.0-GCCcore-8.3.0

Confirm that you've loaded the version of Clang you wanted using ``clang --version``.

Language support
----------------

* How support for C++ standards `varies between versions of Clang <https://clang.llvm.org/cxx_status.html>`__.
* `Common compatibility/portability issues with Clang <https://clang.llvm.org/compatibility.html>`__.

Documentation
-------------

See the online `user manual <https://releases.llvm.org/10.0.0/tools/clang/docs/UsersManual.html>`__ (for version 10; manuals for other versions also available).
