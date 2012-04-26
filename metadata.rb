maintainer       "Jeff Siegel"
maintainer_email "jdsiegel@gmail.com"
license          "Apache v2.0"
description      "Installs user-owned runit monitors"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "runit"

recommends "user"  # where will them users come from?

supports "ubuntu"
