.. _sharc-differences:

ShARC and Iceberg comparison
============================

CPUs
----
The hardware on Iceberg is older and **usually** slower than that on ShARC.
In particular, all of the CPUs on ShARC are '4th generation core' `Intel Haswell <https://en.wikipedia.org/wiki/Haswell_(microarchitecture)>`_ compared to a combination of '3rd generation core' `Intel Ivy Bridge <https://en.wikipedia.org/wiki/Ivy_Bridge_(microarchitecture)>`_, '1st generation core' `Intel Westmere <https://en.wikipedia.org/wiki/Westmere_(microarchitecture)>`_ and `AMD Processors <https://en.wikipedia.org/wiki/List_of_AMD_microprocessors>`_ on Iceberg.

Most of the time, you can expect programs to run more quickly on ShARC than on Iceberg. How much more quickly depends on which type of processor you were using on Iceberg and the characteristics of your program.  One of the new features of Intel Haswell CPUs is `Fused Multiply-Add <https://en.wikipedia.org/wiki/FMA_instruction_set>`_ which can substantially increase the speed of floating point calculations such as `Matrix-Matrix Multiplications <https://en.wikipedia.org/wiki/Matrix_multiplication>`_. Only programs that have been compiled to make use of this feature, such as :ref:`Intel R (Sharc)`, will see a speed increase as a result.

It is theoretically possible for some programs to run **more slowly** on ShARC since the typical clock speed of a ShARC CPU is 2.4Ghz compared to 2.6Ghz on the Ivy Bridge nodes on Iceberg. You are advised to conduct tests to see which system is best for your work. We are interested in any reproducible benchmarks you may run, please open an `issue on our GitHub page <https://github.com/rcgsheffield/sheffield_hpc/issues>`_ to discuss this.

MPI Interconnect
----------------
Nodes on ShARC are connected together using `Intel Omnipath <http://www.intel.com/content/www/us/en/high-performance-computing-fabrics/omni-path-architecture-fabric-overview.html>`_ which should be faster than the interconnect used on Iceberg. We are interested in any reproducible benchmarks you may run, please open an issue on our GitHub page to discuss this.

Off campus access
-----------------
If you are off-campus, you will need to use a VPN connection to access ShARC.
Iceberg can be accessed without a VPN Connection.

rmem and mem scheduler flags
----------------------------
On both systems `-l rmem` is used to request real memory.
On Iceberg, it is also necessary to make a `-l mem` request to ask for virtual memory.
`-l mem` is not required on ShARC and will be ignored.

Software and Module names
-------------------------
The two systems have different suites of software installed and modules follow different naming schemes.
See :ref:`sharc-software` and :ref:`iceberg-software` for details of what's installed on each system and how to access it.
