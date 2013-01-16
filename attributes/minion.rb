#
# Cookbook Name:: salt
# Recipe:: minion
#
# Copyright 2013, John Dewey
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['salt']['minion']['master'] = "salt"
default['salt']['minion']['master_port'] = 4506
default['salt']['minion']['user'] = "root"
default['salt']['minion']['root_dir'] = "/"
default['salt']['minion']['pki_dir'] = "/etc/salt/pki"
default['salt']['minion']['id'] = nil
default['salt']['minion']['append_domain'] = nil
default['salt']['minion']['sub_timeout'] = "60"
default['salt']['minion']['cachedir'] = "/var/cache/salt"
default['salt']['minion']['cache_jobs'] = "False"
default['salt']['minion']['acceptance_wait_time'] = 10
default['salt']['minion']['dns_check'] = "True"
default['salt']['minion']['disable_modules'] = nil
default['salt']['minion']['disable_returners'] = nil
default['salt']['minion']['module_dirs'] = "[]"
default['salt']['minion']['returner_dirs'] = "[]"
default['salt']['minion']['states_dirs'] = "[]"
default['salt']['minion']['render_dirs'] = "[]"
default['salt']['minion']['providers'] = nil
default['salt']['minion']['cython_enable'] = "False"
default['salt']['minion']['renderer'] = "yaml_jinja"
default['salt']['minion']['state_verbose'] = "False"
default['salt']['minion']['autoload_dynamic_modules'] = "True"
default['salt']['minion']['clean_dynamic_modules'] = "True"
default['salt']['minion']['environment'] = "None"
default['salt']['minion']['state_top'] = "top.sls"
default['salt']['minion']['file_client'] = "local"
default['salt']['minion']['file_roots'] = nil
default['salt']['minion']['hash_type'] = "md5"
default['salt']['minion']['pillar_roots'] = nil
default['salt']['minion']['open_mode'] = "False"
default['salt']['minion']['multiprocessing'] = "True"
default['salt']['minion']['log_file'] = "/var/log/salt/minion"
default['salt']['minion']['log_level'] = "warning"
default['salt']['minion']['log_granular_levels'] = nil

# Module configuration is not implemented at this time.
