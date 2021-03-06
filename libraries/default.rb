#
# Library:: salt
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

require 'yaml'

module Opscode
  # Chef helpers for salt cookbook
  module Salt
    def yamlize(key, enum)
      e = {}
      e[key] = enum.is_a?(Hash) ? enum.to_hash : enum
      e.to_yaml.sub(/\A---\n/, '')
    end
  end
end
