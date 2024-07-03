help([==[

Description
===========
The worlds largest collection of robust, documented, tested and maintained numerical algorithms.


More information
================
 - Homepage: http://www.nag.co.uk
]==])

whatis([==[Description: The worlds largest collection of robust, documented, tested and maintained numerical algorithms.]==])
whatis([==[Homepage: http://www.nag.co.uk]==])
whatis([==[URL: http://www.nag.co.uk]==])

local root = "/opt/apps/testapps/el7/software/staging/NAG/nll6i30dbl"

conflict("NAG")

if not ( isloaded("iccifort/2019.5.281") ) then
    load("iccifort/2019.5.281")
end

setenv("NAGDIR", "/opt/apps/testapps/el7/software/staging/NAG/nll6i30dbl")
setenv("NAGLDIR", "/opt/apps/testapps/el7/software/staging/NAG/nll6i30dbl/lp64/lib")
setenv("NAG_KUSARI_FILE", "/opt/apps/testapps/common/licenses/NAG/license.lic")
prepend_path("FINCLUDE", pathJoin(root, "nag_interface_blocks"))
prepend_path("PATH", root)
-- NOT Built with EasyBuild version 4.9.0
