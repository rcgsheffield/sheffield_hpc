.. _ansys-typical-file-paths:


ANSYS Packages File Paths
-------------------------

This page contains a copy of the typical file paths for major ANSYS packages where ``$VERSION`` refers to an ANSYS version, e.g. 202, 190 etc... and ``$DOT_VER`` refers to the same version but with the dot structure e.g. 20.2 19.0 .

The ANSYS directories on the clusters are as follows:

  * Bessemer: ``/usr/local/packages/live/noeb/ANSYS/``
  * Stanage: ``/opt/apps/testapps/el7/software/staging/ANSYS/``


.. list-table:: Common ANSYS Executable Paths
   :widths: 50 50
   :header-rows: 1

   * - ANSYS Program
     - File Path

   * - ANSYS Workbench
     - /ansys_inc/v\ **$VERSION**/Framework/bin/Linux64/runwb2

   * - ANSYS Mechanical APDL
     - /ansys_inc/v\ **$VERSION**/ansys/bin/launcher\ **$VERSION** |br| /ansys_inc/v\ **$VERSION**/ansys/bin/mapdl

   * - CFX Standalone
     - /ansys_inc/v\ **$VERSION**/CFX/bin/cfx5

   * - Autodyn Standalone
     - /ansys_inc/v\ **$VERSION**/autodyn/bin/autodyn\ **$VERSION**

   * - Fluent Standalone
     - /ansys_inc/v\ **$VERSION**/fluent/bin/fluent

   * - Polyflow Standalone
     - /ansys_inc/v\ **$VERSION**/polyflow/bin/polyflow/polyflow

   * - Chemkin |br| (not typically installed on clusters)
     - /ansys_inc/reaction/chemkinpro.linuxx8664/bin/chemkinpro_setup.ksh

   * - Forte
     - /ansys_inc/v\ **$VERSION**/reaction/forte.linuxx8664/bin/forte.sh

   * - ANSYS Electronics Desktop |br| (for Ansoft tools, e.g. Maxwell, HFSS)
     - /ansys_inc/v\ **$VERSION**/AnsysEM/AnsysEM\ **$DOT_VER**/Linux64/ansysedt

   * - SIWave
     - /ansys_inc/v\ **$VERSION**/AnsysEM/AnsysEM\ **$DOT_VER**/Linux64/siwave
