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

class ::Chef::Recipe
  include ::Opscode::Salt
end

include_recipe "salt::add_repo"

if node['salt']['master_search']
  result = search :node, node["salt"]["master_search"]
  master = result[0]['fqdn']
else
  master = node['salt']['minion']['master']
end

if node['salt']['minion']['providers']
  providers = yamlize "providers", node['salt']['minion']['providers']
end

if node['salt']['minion']['file_roots']
  file_roots = yamlize "file_roots", node['salt']['minion']['file_roots']
end

if node['salt']['minion']['pillar_roots']
  pillar_roots = yamlize "pillar_roots", node['salt']['minion']['pillar_roots']
end

package "salt-minion" do
  action :install
end

service "salt-minion" do
  supports :restart => true

  action [ :enable, :start ]
end


template ::File.join(node['salt']['conf_dir'], "minion") do
  source "minion.erb"
  owner  "root"
  group  "root"
  mode   00644

  variables(
    :providers    => providers,
    :file_roots   => file_roots,
    :pillar_roots => pillar_roots,
    :master       => master
  )

  notifies :restart, "service[salt-minion]"
end
