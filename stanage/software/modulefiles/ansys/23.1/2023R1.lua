help([==[

Description
===========
ANSYS simulation software enables organizations to confidently predict 
    how their products will operate in the real world. We believe that every product is 
    a promise of something greater.


More information
================
 - Homepage: https://www.ansys.com
]==])

whatis([==[Description: ANSYS simulation software enables organizations to confidently predict 
    how their products will operate in the real world. We believe that every product is 
    a promise of something greater. ]==])
whatis([==[Homepage: https://www.ansys.com]==])
whatis([==[URL: https://www.ansys.com]==])

local root = "/opt/apps/testapps/el7/software/staging/ANSYS/2023R1"

conflict("ANSYS")

prepend_path("CMAKE_PREFIX_PATH", root)
prepend_path("PATH", pathJoin(root, "v231/Framework/bin/Linux64"))
prepend_path("PATH", pathJoin(root, "v231/aisol/bin/linx64"))
prepend_path("PATH", pathJoin(root, "v231/RSM/bin"))
prepend_path("PATH", pathJoin(root, "v231/ansys/bin"))
prepend_path("PATH", pathJoin(root, "v231/autodyn/bin"))
prepend_path("PATH", pathJoin(root, "v231/CFD-Post/bin"))
prepend_path("PATH", pathJoin(root, "v231/CFX/bin"))
prepend_path("PATH", pathJoin(root, "v231/fluent/bin"))
prepend_path("PATH", pathJoin(root, "v231/TurboGrid/bin"))
prepend_path("PATH", pathJoin(root, "v231/polyflow/bin"))
prepend_path("PATH", pathJoin(root, "v231/Icepak/bin"))
prepend_path("PATH", pathJoin(root, "v231/icemcfd/linux64_amd/bin"))
prepend_path("PATH", pathJoin(root, "v231/CEI/bin"))
setenv("EBROOTANSYS", root)
setenv("EBVERSIONANSYS", "2023R1")
setenv("EBDEVELANSYS", pathJoin(root, "easybuild/ANSYS-2023R1-easybuild-devel"))

setenv("FLUENT_AFFINITY", "0")
prepend_path("PATH", root)
setenv("ICEM_ACN", "/opt/apps/testapps/el7/software/staging/ANSYS/2023R1/v231/icemcfd/linux64_amd")
-- Built with EasyBuild version 4.7.1
