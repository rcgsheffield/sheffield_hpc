help([==[

Description
===========
Finite Element Analysis software for modeling, visualization and best-in-class implicit and explicit
 dynamics FEA.


More information
================
 - Homepage: http://www.simulia.com/products/abaqus_fea.html
]==])

whatis([==[Description: Finite Element Analysis software for modeling, visualization and best-in-class implicit and explicit
 dynamics FEA.]==])
whatis([==[Homepage: http://www.simulia.com/products/abaqus_fea.html]==])
whatis([==[URL: http://www.simulia.com/products/abaqus_fea.html]==])

local root = "/opt/apps/testapps/el7/software/staging/ABAQUS/2021"

conflict("ABAQUS")

prepend_path("CMAKE_PREFIX_PATH", root)
prepend_path("PATH", pathJoin(root, "Commands"))
prepend_path("PATH", pathJoin(root, "cae/linux_a64/code/command"))
setenv("EBROOTABAQUS", root)
setenv("EBVERSIONABAQUS", "2021")
setenv("EBDEVELABAQUS", pathJoin(root, "easybuild/ABAQUS-2021-easybuild-devel"))

setenv("LM_LICENSE_FILE", "27000@abaquslm.shef.ac.uk")
prepend_path("PATH", root)
-- Built with EasyBuild version 4.7.0
