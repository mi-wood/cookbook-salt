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

include_recipe "salt::apt"

def yamlize key, enum
  e = {}
  e[key] = enum.kind_of?(Hash) ? enum.to_hash : enum
  e.to_yaml.sub(/\A---\n/, "")
end

if node['salt']['master']['include']
  incl = yamlize "include", node['salt']['master']['include']
end

if node['salt']['master']['master_tops']
  master_tops = yamlize "master_tops", node['salt']['master']['master_tops']
end

if node['salt']['master']['file_roots']
  file_roots = yamlize "file_roots", node['salt']['master']['file_roots']
end

if node['salt']['master']['file_ignore_regex']
  file_ignore_regex = yamlize "file_ignore_regex", node['salt']['master']['file_ignore_regex']
end

if node['salt']['master']['file_ignore_glob']
  file_ignore_glob = yamlize "file_ignore_glob", node['salt']['master']['file_ignore_glob']
end

if node['salt']['master']['pillar_roots']
  pillar_roots = yamlize "pillar_roots", node['salt']['master']['pillar_roots']
end

if node['salt']['master']['peer']
  peer = yamlize "peer", node['salt']['master']['peer']
end

if node['salt']['master']['peer_run']
  peer_run = yamlize "peer_run", node['salt']['master']['peer_run']
end

if node['salt']['master']['nodegroups']
  nodegroups = yamlize "nodegroups", node['salt']['master']['nodegroups']
end

service "salt-master" do
  supports :restart => true

  action [ :enable, :start ]
end

package "salt-master" do
  action :install
end

template ::File.join(node['salt']['conf_dir'], "master") do
  source "master.erb"
  owner  "root"
  group  "root"
  mode   00644

  variables(
    :include           => incl,
    :master_tops       => master_tops,
    :file_roots        => file_roots,
    :file_ignore_regex => file_ignore_regex,
    :file_ignore_glob  => file_ignore_glob,
    :pillar_roots      => pillar_roots,
    :peer              => peer,
    :peer_run          => peer_run,
    :nodegroups        => nodegroups
  )

  notifies :restart, "service[salt-master]"
end
