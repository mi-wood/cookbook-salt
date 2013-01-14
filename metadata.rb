name             "salt"
maintainer       "John Dewey"
maintainer_email "john@dewey.ws"
license          "Apache 2.0"
description      "Installs/Configures salt"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

recipe           "salt", "Installs/Configures salt minion"
recipe           "salt::apt", "Configure apt sources to use salt's PPA"
recipe           "salt::minion", "Installs/Configures salt minion"
recipe           "salt::master", "Installs/Configures salt master"

supports         "ubuntu", ">= 12.04"

depends          "apt"
