# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'utils/simpleconfig'

module Inspec::Resources
  class IniConfig < JsonConfig
    name 'ini'
    desc 'Use the ini InSpec audit resource to test data in a INI file.'
    example "
      descibe ini do
        its('auth_protocol') { should eq 'https' }
      end
    "
    # override file load and parse hash with simple config
    def parse(content)
      SimpleConfig.new(content).params
    end

    def to_s
      "INI #{@path}"
    end
  end
end
