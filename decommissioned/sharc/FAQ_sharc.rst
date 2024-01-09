.. include:: /referenceinfo/imports/decommissioned/sharc_decom.rst

.. include:: /referenceinfo/imports/decommissioned/decom_watermark.rst

.. _FAQ_sharc:

Frequently Asked Questions (ShARC)
==================================

In this section, we've archived some of the tips for solving problems related to the decommisioned cluster ShARC.

-------

Login node SSH RSA/ECDSA/ED25519 host key fingerprints
------------------------------------------------------

The RSA, ECDSA and ED25519 fingerprints for ShARC's login nodes are: ::

   SHA256:NVb+eAG6sMFQEbVXeF5a+x5ALHhTqtYqdV6g31Kn6vE (RSA)
   SHA256:WJYHPbMKrWud4flwhIbrfTB1SR4pprGhx4Vu88LhP58 (ECDSA)
   SHA256:l8imoZMnO+fHGle6zWi/pf4eyiVsEYYscKsl1ellrnE (ED25519)

-------

'Illegal Instruction' errors
----------------------------

If your program fails with an **Illegal Instruction** error then it may have been compiled using (and optimised for) one type of processor but is running on another.

If you get this error **after copying compiled programs onto a cluster** then you may need to recompile them on on the cluster or recompile them elsewhere without aggressively optimising for processor architecture.

If however you get this error when **running programs on the cluster that you have also compiled on the cluster** then you may have compiled on one processor type and be running on a different type.
You may not consistently get the *illegal instruction* error here as the scheduler may allocate you a different type of processor every time you run your program.
You can either recompile your program without optimisations for processor architecture or force your job to run on the type of processor it was compiled on using the ``-l arch=`` ``qsub``/``qrsh``/``qsh`` parameter e.g.

* ``-l arch=intel*`` to avoid being allocated one of the few AMD-powered nodes
* ``-l arch=intel-x5650`` to use the Intel Westmere CPU architecture
* ``-l arch=intel-e5-26[567]0`` to use the Intel Sandy Bridge CPU architecture

If you know the node that a program was compiled on but do not know the CPU architecture of that node then you can discover it using the following command (substituting in the relevant node name): ::

        qhost | egrep '(ARCH|node116)'

---------

.. _unnamed_groups:

Warning about 'groups: cannot find name for group ID xxxxx'
-----------------------------------------------------------

You may occasionally see warnings like the above e.g. when running an :ref:`Apptainer/Singularity <apptainer_sharc>` container or when running the standard ``groups`` Linux utility.
These warnings can be ignored.

The scheduler, Son of Grid Engine, dynamically creates a Unix group per job to
keep track of resources (files and process) associated with that job.
These groups have numeric IDs but no names, which can result in harmless warning messages in certain circumstances.

See ``man 8 pam_sge-qrsh-setup`` for the details of how and why Grid Engine creates these groups.

------

.. _real-vs-virt-mem:

What are the rmem (real memory) and (deprecated) mem (virtual memory) options?
------------------------------------------------------------------------------

.. warning::

   The following is most likely only of interest when revisiting job submission scripts and documentation created before
   26 June 2017 as now users only need to request real memory (``rmem``) and jobs are only killed if they exceed their ``rmem`` quota
   (whereas prior to that date jobs could request and be policed using virtual memory ``mem`` requests).

Running a program always involves loading the program instructions and also its data (i.e. all variables and arrays that it uses) into the computer's memory.
A program's entire instructions and its entire data, along with any dynamically-linked libraries it may use, defines the **virtual storage** requirements of that program.
If we did not have clever operating systems we would need as much physical memory (RAM) as the virtual storage requirements of that program.
However, operating systems are clever enough to deal with situations where we have insufficient **real memory** (physical memory, typically called RAM) to
load all the program instructions and data into the available RAM.
This technique works because hardly any program needs to access all its instructions and its data simultaneously.
Therefore the operating system loads into RAM only those bits (**pages**) of the instructions and data that are needed by the program at a given instance.
This is called **paging** and it involves copying bits of the programs instructions and data to/from hard-disk to RAM as they are needed.

If the real memory (i.e. RAM) allocated to a job is much smaller than the entire memory requirements of a job ( i.e. virtual memory)
then there will be excessive need for paging that will slow the execution of the program considerably due to
the relatively slow speeds of transferring information to/from the disk into RAM.

On the other hand if the RAM allocated to a job is larger than the virtual memory requirement of that job then
it will result in waste of RAM resources which will be idle duration of that job.

* The virtual memory limit defined by the ``-l mem`` cluster scheduler parameter defines the maximum amount of virtual memory your job will be allowed to use. **This option is now deprecated** - you can continue to submit jobs requesting virtual memory, however the scheduler **no longer applies any limits to this resource**.
* The real memory limit is defined by the ``-l rmem`` cluster scheduler parameter and defines the amount of RAM that will be allocated to your job.  The job scheduler will terminate jobs which exceed their real memory resource request.

.. hint::

   As mentioned above, jobs now need to just request real memory and are policed using real memory usage.  The reasons for this are:

   * For best performance it is preferable to request as much real memory as the virtual memory storage requirements of a program as paging impacts on performance and memory is (relatively) cheap.
   * Real memory is more tangible to newer users.