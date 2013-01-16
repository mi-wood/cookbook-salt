require "chefspec"
require "chefspec/matchers/shared" # #render
require "yaml"

def load_yaml_for file, node
  ::YAML.load render(file, node)
end
