.. _jade2:

JADE II (Tier 2 GPU cluster)
============================

The JADE II cluster is a 2020 renewal of the `Joint Academic Data Science Endeavour (JADE) <https://www.jade.ac.uk>`_ maintaining its status as the largest GPU facility in the UK supporting world-leading research in machine learning.

The computational hub harnesses the capabilities of the **NVIDIA DGX MAX-Q** Deep Learning System and comprise of **63 servers**, each containing **8 NVIDIA Tesla V100 GPUs** linked by NVIDIA’s NV link interconnect technology. The MAX-Q range are a more power-efficient system allowing the doubling of computational power of JADE with only 2/3 of power that would have been required.

The `RSE`_ group director (Paul Richmond) is a co-investigator in the EPSRC Tier 2 JADE II system. As such members of the University of Sheffield are able to access this resource for free (for use with deep learning research).

JADE II Specification
---------------------

**More details on the system coming soon.**

Hardware
^^^^^^^^

* 63 Nodes of DGX MAX-Q, each with:
    * 8x Nvidia V100 32GB GPUs
    * 512GB RAM
* 70TB `DDN AI400 <https://www.ddn.com/products/a3i-accelerated-any-scale-ai/>`__ shared storage (NVMe) for read intensive/streaming applications
* 1PB Lustre shared storage (spinning disk)
* EDR infiniband interconnect

Software
^^^^^^^^

* Redhat Linux

Requesting access
-----------------

If you would like to use JADE for the purpose of machine learning, `please fill in this form <https://shef.topdesk.net/tas/public/ssp/content/serviceflow?unid=89acfdddb2bf4600bdc386a541a569ca>`__ to request access.
The application will be put through a short internal review process by the `RSE`_ team and/or IT Services before approval.
Please contact ``jade@sheffield.ac.uk`` if you have any questions regarding JADE 2 in general and the application process.

.. _RSE: https://rse.shef.ac.uk
