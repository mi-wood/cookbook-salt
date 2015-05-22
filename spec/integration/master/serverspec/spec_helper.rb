require 'serverspec'
require 'json'

set :backend, :exec

$node = ::JSON.parse(File.read('/opt/serverspec/node.json'))
