# encoding: utf-8
# author: Nolan Davidson

require 'tomlrb'

module Inspec::Resources
  class TomlConfig < JsonConfig
    name 'toml'
    desc 'Use the toml InSpec resource to test configuration data in a TOML file'
    example "
      describe toml('default.toml') do
        its('key') { should eq('value') }
        its (['arr', 1]) { should eq 2 }
        its (['mytable', 'key1']) { should eq 'value1' }
      end
    "

    def parse(content)
      Tomlrb.parse(content)
    end

    def to_s
      "TOML #{@path}"
    end
  end
end
