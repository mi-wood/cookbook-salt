#
# Cookbook Name:: test-helpers
# Recipe:: test-helpers
#

require 'pathname'

directory '/opt/serverspec'

file '/opt/serverspec/node.json' do
  owner 'root'
  mode '0400'
end

log 'Dumping attributes to /opt/serverspec/node.json.'

ruby_block 'dump_node_attributes' do
  block do
    require 'json'

    attrs = node.merged_attributes # ~FC019

    File.open('/opt/serverspec/node.json', 'w') { |file| file.write(JSON.pretty_generate(attrs)) }
  end
end
