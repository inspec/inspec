
require 'inspec/utils/simpleconfig'

module Inspec::Resources
  class IniConfig < JsonConfig
    name 'ini'
    supports platform: 'unix'
    supports platform: 'windows'
    desc 'Use the ini InSpec audit resource to test data in a INI file.'
    example <<~EXAMPLE
      descibe ini do
        its('auth_protocol') { should eq 'https' }
      end
    EXAMPLE
    # override file load and parse hash with simple config
    def parse(content)
      SimpleConfig.new(content).params
    end

    private

    # used by JsonConfig to build up a full to_s method
    # based on whether a file path, content, or command was supplied.
    def resource_base_name
      'INI'
    end
  end
end
