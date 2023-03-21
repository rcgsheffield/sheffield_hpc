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

local root = "/opt/apps/testapps/el7/software/staging/ANSYS/2022R2"

conflict("ANSYS")

prepend_path("CMAKE_PREFIX_PATH", root)
prepend_path("PATH", pathJoin(root, "v222/Framework/bin/Linux64"))
prepend_path("PATH", pathJoin(root, "v222/aisol/bin/linx64"))
prepend_path("PATH", pathJoin(root, "v222/RSM/bin"))
prepend_path("PATH", pathJoin(root, "v222/ansys/bin"))
prepend_path("PATH", pathJoin(root, "v222/autodyn/bin"))
prepend_path("PATH", pathJoin(root, "v222/CFD-Post/bin"))
prepend_path("PATH", pathJoin(root, "v222/CFX/bin"))
prepend_path("PATH", pathJoin(root, "v222/fluent/bin"))
prepend_path("PATH", pathJoin(root, "v222/TurboGrid/bin"))
prepend_path("PATH", pathJoin(root, "v222/polyflow/bin"))
prepend_path("PATH", pathJoin(root, "v222/Icepak/bin"))
prepend_path("PATH", pathJoin(root, "v222/icemcfd/linux64_amd/bin"))
prepend_path("PATH", pathJoin(root, "v222/CEI/bin"))

setenv("FLUENT_AFFINITY", "0")
setenv("LM_PROJECT", "STANAGE229N8FVw5T684")

setenv("EBROOTANSYS", root)
setenv("EBVERSIONANSYS", "2022R2")
setenv("EBDEVELANSYS", pathJoin(root, "easybuild/ANSYS-2022R2-easybuild-devel"))

prepend_path("PATH", root)
setenv("ICEM_ACN", "/opt/apps/testapps/el7/software/staging/ANSYS/2022R2/v222/icemcfd/linux64_amd")
-- Built with EasyBuild version 4.7.0