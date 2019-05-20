# author: Nolan Davidson

require 'tomlrb'
require 'inspec/resources/json'

module Inspec::Resources
  class TomlConfig < JsonConfig
    name 'toml'
    desc 'Use the toml InSpec resource to test configuration data in a TOML file'
    example <<~EXAMPLE
      describe toml('default.toml') do
        its('key') { should eq('value') }
        its (['arr', 1]) { should eq 2 }
        its (['mytable', 'key1']) { should eq 'value1' }
      end
    EXAMPLE

    def parse(content)
      Tomlrb.parse(content)
    rescue => e
      raise Inspec::Exceptions::ResourceFailed, "Unable to parse TOML: #{e.message}"
    end

    private

    # used by JsonConfig to build up a full to_s method
    # based on whether a file path, content, or command was supplied.
    def resource_base_name
      'TOML'
    end
  end
end
