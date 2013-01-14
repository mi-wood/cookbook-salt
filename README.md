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
    $ foodcritic cookbooks/salt
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
