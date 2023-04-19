help([==[

Description
===========
Built to complement the rich, open source Python community,
the Anaconda platform provides an enterprise-ready data analytics platform 
that empowers companies to adopt a modern open data science analytics architecture.


More information
================
 - Homepage: https://www.anaconda.com
]==])

whatis([==[Description: Built to complement the rich, open source Python community,
the Anaconda platform provides an enterprise-ready data analytics platform 
that empowers companies to adopt a modern open data science analytics architecture.
]==])
whatis([==[Homepage: https://www.anaconda.com]==])
whatis([==[URL: https://www.anaconda.com]==])

local root = "/opt/apps/testapps/common/software/staging/Anaconda3/2022.10"

conflict("Anaconda3")

prepend_path("MANPATH", pathJoin(root, "man"))
prepend_path("MANPATH", pathJoin(root, "share/man"))
prepend_path("PATH", pathJoin(root, "bin"))
prepend_path("PATH", pathJoin(root, "sbin"))
prepend_path("PKG_CONFIG_PATH", pathJoin(root, "lib/pkgconfig"))
setenv("EBROOTANACONDA3", root)
setenv("EBVERSIONANACONDA3", "2022.10")
setenv("EBDEVELANACONDA3", pathJoin(root, "easybuild/Anaconda3-2022.10-easybuild-devel"))

prepend_path("PATH", root)
-- Built with EasyBuild version 4.7.1
