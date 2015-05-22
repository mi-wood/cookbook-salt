#
## Cookbook Name:: salt
## Recipe:: cron
#

# install AWS-sdk-core
gem_package 'aws-sdk-core' do
  version node['salt']['cron']['gem_version']
  action :install
end

directory node['salt']['cron']['path'] do
  owner node['salt']['master']['user']
  group node['salt']['master']['user']
  mode '644'
  action :create
end

cleanup_path = File.join(node['salt']['cron']['path'], 'cleanup_salt_keys.py')
cookbook_file cleanup_path do
  owner node['salt']['master']['user']
  group node['salt']['master']['user']
  mode  '744'
  action :create
end

cron_d 'cleanup_salt_keys' do
  command "/usr/bin/python #{cleanup_path} --region=#{node['salt']['cron']['region']} 2>&1 | sudo tee -a #{node['salt']['master']['log_file']} > /dev/null"
  user node['salt']['master']['user']
  minute node['salt']['cron']['minute']
end

