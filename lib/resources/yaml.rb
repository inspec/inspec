# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'yaml'

# Parses a yaml document
# Usage:
# describe yaml('.kitchen.yaml') do
#   its('driver.name') { should eq('vagrant') }
# end
module Inspec::Resources
  class YamlConfig < JsonConfig
    name 'yaml'
    desc 'Use the yaml InSpec audit resource to test configuration data in a YAML file.'
    example "
      describe yaml do
        its('name') { should eq 'foo' }
      end
    "

    # override file load and parse hash from yaml
    def parse(content)
      YAML.load(content)
    end

    def to_s
      "YAML #{@path}"
    end
  end
end
