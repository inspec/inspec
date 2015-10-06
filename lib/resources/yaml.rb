# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'yaml'

# Parses a yaml document
# Usage:
# describe yaml('.kitchen.yaml') do
#   its('driver.name') { should eq('vagrant') }
# end
class YamlConfig < JsonConfig
  name 'yaml'

  # override file load and parse hash from yaml
  def parse(content)
    YAML.load(content)
  end
end
