Description
===========

Installs/Configures salt

Currently experimenting with Ubuntu.  Feel free to send pull requests for
additional distros.

Requirements
============

* Chef 0.8+
* apt
* Ubuntu >= 12.04

Attributes
==========

* `default['salt']['master_search']` - The search used to determine
  the salt master, otherwise use `node['salt']['minion']['master']`.
* `default['salt']['custom_template_banner']` - Banner to add to templates
  managed by chef.
* `default['salt']['conf_dir']` - Salt's base configuration directory.
* `default['salt']['apt']['uri']` - The base of the Debian distribution.
* `default['salt']['apt']['distribution']` - This is usually your release's
  codename.
* `default['salt']['apt']['components']` - Package groupings.
* `default['salt']['apt']['deb_src']` - Whether or not to add the repository as
  a source repo as well.
* `default['salt']['apt']['keyserver']` - The GPG keyserver where the key for
  the repo should be retrieved.
* `default['salt']['apt']['key']` - If a `keyserver` is provided, this is
  assumed to be the fingerprint.

Minion configuration is handled via the following attributes.  View the
minion template to better understand the options.

* `default['salt']['minion']['master']`
* `default['salt']['minion']['master_port']`
* `default['salt']['minion']['user']`
* `default['salt']['minion']['root_dir']`
* `default['salt']['minion']['pki_dir']`
* `default['salt']['minion']['id']`
* `default['salt']['minion']['append_domain']`
* `default['salt']['minion']['sub_timeout']`
* `default['salt']['minion']['cachedir']`
* `default['salt']['minion']['cache_jobs']`
* `default['salt']['minion']['acceptance_wait_time']`
* `default['salt']['minion']['dns_check']`
* `default['salt']['minion']['disable_modules']`
* `default['salt']['minion']['disable_returners']`
* `default['salt']['minion']['module_dirs']`
* `default['salt']['minion']['returner_dirs']`
* `default['salt']['minion']['states_dirs']`
* `default['salt']['minion']['render_dirs']`
* `default['salt']['minion']['providers']`
* `default['salt']['minion']['cython_enable']`
* `default['salt']['minion']['renderer']`
* `default['salt']['minion']['state_verbose']`
* `default['salt']['minion']['autoload_dynamic_modules']`
* `default['salt']['minion']['clean_dynamic_modules']`
* `default['salt']['minion']['environment']`
* `default['salt']['minion']['state_top']`
* `default['salt']['minion']['file_client']`
* `default['salt']['minion']['file_roots']`
* `default['salt']['minion']['hash_type']`
* `default['salt']['minion']['pillar_roots']`
* `default['salt']['minion']['open_mode']`
* `default['salt']['minion']['multiprocessing']`
* `default['salt']['minion']['log_file']`
* `default['salt']['minion']['log_level']`
* `default['salt']['minion']['log_granular_levels']`


default['salt']['minion']['providers']

```json
"salt": {
    "minion":
        "providers": {
            "pkg", "yumpkg5"
        }
    }
]
```

default['salt']['minion']['file_roots']

```json
"salt": {
    "minion":
        "file_roots": {
            "base": [
              "/srv/salt/dev/services",
              "/srv/salt/dev/state"
            ]
        }
    }
]
```

default['salt']['minion']['pillar_roots']

```json
"salt": {
    "minion":
        "pillar_roots": {
            "base": [
              "/srv/pillar"
            ]
        }
    }
]
```

Usage
=====

default
----

Installs/Configures salt minion

```json
"run_list": [
    "recipe[salt]"
]
```

master
----

Installs/Configures salt master

```json
"run_list": [
    "recipe[salt::master]"
]
```

minion
----

Installs/Configures salt minion

```json
"run_list": [
    "recipe[salt::minion]"
]
```

Testing
=====

This cookbook is using [ChefSpec](https://github.com/acrmp/chefspec) for testing.

    $ cd $repo
    $ bundle
    $ librarian-chef install
    $ ln -s ../ cookbooks/salt
    $ rspec cookbooks/salt

License and Author
==================

Author:: John Dewey (<john@dewey.ws>)

Copyright 2012, John Dewey

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and 
limitations under the License.
