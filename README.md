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

Master configuration is handled via the following attributes.  View the
master template to better understand the options.

* `default['salt']['master']['default_include']`
* `default['salt']['master']['interface']`
* `default['salt']['master']['publish_port']`
* `default['salt']['master']['user']`
* `default['salt']['master']['max_open_files']`
* `default['salt']['master']['worker_threads']`
* `default['salt']['master']['ret_port']`
* `default['salt']['master']['pidfile']`
* `default['salt']['master']['root_dir']`
* `default['salt']['master']['pki_dir']`
* `default['salt']['master']['cachedir']`
* `default['salt']['master']['verify_env']`
* `default['salt']['master']['keep_jobs']`
* `default['salt']['master']['timeout']`
* `default['salt']['master']['sock_dir']`
* `default['salt']['master']['job_cache']`
* `default['salt']['master']['minion_data_cache']`
* `default['salt']['master']['include']`
* `default['salt']['master']['open_mode']`
* `default['salt']['master']['auto_accept']`
* `default['salt']['master']['autosign_file']`
* `default['salt']['master']['permissive_pki_access']`
* `# default['salt']['master']['client_acl']`
* `# default['salt']['master']['external_auth']`
* `default['salt']['master']['runner_dirs']`
* `default['salt']['master']['cython_enable']`
* `default['salt']['master']['state_top']`
* `default['salt']['master']['master_tops']`
* `default['salt']['master']['external_nodes']`
* `default['salt']['master']['renderer']`
* `default['salt']['master']['failhard']`
* `default['salt']['master']['state_verbose']`
* `default['salt']['master']['state_output']`
* `default['salt']['master']['file_roots']`
* `default['salt']['master']['hash_type']`
* `default['salt']['master']['file_buffer_size']`
* `default['salt']['master']['file_ignore_regex']`
* `default['salt']['master']['file_ignore_glob']`
* `default['salt']['master']['pillar_roots']`
* `default['salt']['master']['pillar_opts']`
* `default['salt']['master']['order_masters']`
* `default['salt']['master']['syndic_master']`
* `default['salt']['master']['peer']`
* `default['salt']['master']['peer_run']`
* `default['salt']['master']['log_file']`
* `default['salt']['master']['key_logfile']`
* `default['salt']['master']['log_level']`
* `default['salt']['master']['log_level_logfile']`
* `default['salt']['master']['log_datefmt']`
* `default['salt']['master']['log_fmt_console']`
* `default['salt']['master']['log_fmt_logfile']`
* `default['salt']['master']['log_granular_levels']`
* `default['salt']['master']['nodegroups']`
* `default['salt']['master']['range_server']`


default['salt']['master']['include']

```json
"salt": {
    "master":
        "include": [
            "/etc/salt/extra_config"
        ]
    }
]
```

default['salt']['master']['master_tops']

```json
"salt": {
    "master":
        "master_tops": {
            "ext_nodes": "Shell command which returns yaml"
        }
    }
]
```

default['salt']['master']['file_roots']

```json
"salt": {
    "master":
        "file_roots": {
            "base": [
                "/srv/salt/dev/services",
                "/srv/salt/dev/state"
            ]
        }
    }
]
```

default['salt']['master']['file_ignore_regex']

```json
"salt": {
    "master":
        "ignore_regex": [
            "/\.svn($|/)",
            "/\.git($|/)"
        ]
    }
]
```

default['salt']['master']['file_ignore_glob']

```json
"salt": {
    "master":
        "ignore_glob": [
            "*.pyc",
            "*/somefolder/*.bak"
        ]
    }
]
```

default['salt']['master']['pillar_roots']

```json
"salt": {
    "master":
        "pillar_roots": {
            "base": [
                "/srv/pillar"
            ]
        }
    }
]
```

default['salt']['master']['peer']

```json
"salt": {
    "master":
        "peer": {
            "foo.example.com": [
                "test.*" 
            ]
        }
    }
]
```

default['salt']['master']['peer_run']

```json
"salt": {
    "master":
        "peer_run": {
            "foo.example.com": [
                "manage.up" 
            ]
        }
    }
]
```

default['salt']['master']['nodegroups']

```json
"salt": {
    "master":
        "nodegroups": {
            "group1": "L@foo.domain.com,bar.domain.com,baz.domain.com and bl*.domain.com",
            "group2": "G@os:Debian and foo.domain.com"
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
