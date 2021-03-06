#
# Cookbook Name:: salt
# Recipe:: default
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

default['salt']['custom_template_banner'] = "
# This file autogenerated by Chef 
# Do not edit, changes will be overwritten.
"
default['salt']['conf_dir'] = ::File.join ::File::SEPARATOR, "etc", "salt"
default['salt']['master_search'] = nil # "role:salt-master AND chef_environment:#{node.chef_environment}"

default['salt']['apt']['uri'] = "http://ppa.launchpad.net/saltstack/salt/ubuntu"
default['salt']['apt']['distribution'] = "precise"
default['salt']['apt']['components'] = ["main"]
default['salt']['apt']['deb_src'] = true
default['salt']['apt']['keyserver'] = "keyserver.ubuntu.com"
default['salt']['apt']['key'] = "0E27C0A6"

default['salt']['yum']['repo'] = 'epel'
default['salt']['yum']['mirrorlist'] = 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
default['salt']['yum']['key'] = 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
