#
# Cookbook Name:: salt
# Recipe:: master
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

default['salt']['master']['default_include'] = "master.d/*.conf"
default['salt']['master']['interface'] = "0.0.0.0"
default['salt']['master']['publish_port'] = 4505
default['salt']['master']['user'] = "root"
default['salt']['master']['max_open_files'] = 100000
default['salt']['master']['worker_threads'] = 5
default['salt']['master']['ret_port'] = 4506
default['salt']['master']['pidfile'] = "/var/run/salt-master.pid"
default['salt']['master']['root_dir'] = "/"
default['salt']['master']['pki_dir'] = "/etc/salt/pki/master"
default['salt']['master']['cachedir'] = "/var/cache/salt/master"
default['salt']['master']['verify_env'] = "True"
default['salt']['master']['keep_jobs'] = 24
default['salt']['master']['timeout'] = 5
default['salt']['master']['sock_dir'] = "/var/run/salt/master"
default['salt']['master']['job_cache'] = "True"
default['salt']['master']['minion_data_cache'] = "True"
default['salt']['master']['include'] = nil
default['salt']['master']['open_mode'] = "False"
default['salt']['master']['auto_accept'] = "False"
default['salt']['master']['autosign_file'] = "/etc/salt/autosign.conf"
default['salt']['master']['permissive_pki_access'] = "False"
# default['salt']['master']['client_acl'] = nil # Not Implemented
# default['salt']['master']['external_auth'] = nil # Not Implemented
default['salt']['master']['runner_dirs'] = []
default['salt']['master']['cython_enable'] = "False"
default['salt']['master']['state_top'] = "top.sls"
default['salt']['master']['master_tops'] = nil
default['salt']['master']['external_nodes'] = "None"
default['salt']['master']['renderer'] = "yaml_jinja"
default['salt']['master']['failhard'] = "False"
default['salt']['master']['state_verbose'] = "True"
default['salt']['master']['state_output'] = "full"
default['salt']['master']['file_roots'] = nil
default['salt']['master']['hash_type'] = "md5"
default['salt']['master']['file_buffer_size'] = 1048576
default['salt']['master']['file_ignore_regex'] = nil
default['salt']['master']['file_ignore_glob'] = nil
default['salt']['master']['pillar_roots'] = nil
default['salt']['master']['pillar_opts'] = "True"
default['salt']['master']['order_masters'] = "False"
default['salt']['master']['syndic_master'] = nil
default['salt']['master']['peer'] = nil
default['salt']['master']['peer_run'] = nil
default['salt']['master']['log_file'] = "/var/log/salt/master"
default['salt']['master']['key_logfile'] = "/var/log/salt/key"
default['salt']['master']['log_level'] = "warning"
default['salt']['master']['log_level_logfile'] = "warning"
default['salt']['master']['log_datefmt'] = "!!str '%Y-%m-%d %H:%M:%S'"
default['salt']['master']['log_fmt_console'] = "!!str '[%(levelname)-8s] %(message)s'"
default['salt']['master']['log_fmt_logfile'] = "!!str '%(asctime)s,%(msecs)03.0f [%(name)-17s][%(levelname)-8s] %(message)s'"
default['salt']['master']['log_granular_levels'] = nil
default['salt']['master']['nodegroups'] =  nil
default['salt']['master']['range_server'] = "range:80"
