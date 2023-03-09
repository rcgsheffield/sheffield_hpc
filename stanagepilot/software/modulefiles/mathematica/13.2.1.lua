help([==[

Description
===========
Mathematica is a computational software program used in many scientific, engineering, mathematical
and computing fields.


More information
================
 - Homepage: https://www.wolfram.com/mathematica
]==])

whatis([==[Description: Mathematica is a computational software program used in many scientific, engineering, mathematical
and computing fields.]==])
whatis([==[Homepage: https://www.wolfram.com/mathematica]==])
whatis([==[URL: https://www.wolfram.com/mathematica]==])

local root = "/opt/apps/testapps/el7/software/staging/Mathematica/13.2.1"

conflict("Mathematica")

prepend_path("CMAKE_PREFIX_PATH", root)
prepend_path("PATH", pathJoin(root, "bin"))
prepend_path("PATH", pathJoin(root, "Executables"))
setenv("EBROOTMATHEMATICA", root)
setenv("EBVERSIONMATHEMATICA", "13.2.1")
setenv("EBDEVELMATHEMATICA", pathJoin(root, "easybuild/Mathematica-13.2.1-easybuild-devel"))

prepend_path("PATH", root)
-- Built with EasyBuild version 4.7.0
