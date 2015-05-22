name             "salt"
maintainer       "John Dewey"
maintainer_email "john@dewey.ws"
license          "Apache 2.0"
description      "Installs/Configures salt"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.03"

recipe           "salt", "Installs/Configures salt minion"
recipe           "salt::add_repo", "Configure apt or yum repo"
recipe           "salt::minion", "Installs/Configures salt minion"
recipe           "salt::master", "Installs/Configures salt master"

supports         "ubuntu", ">= 12.04"
supports         "rhel"

depends          "apt"
depends          "cron"
depends          "yum"
