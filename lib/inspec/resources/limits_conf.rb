# copyright: 2015, Vulcano Security GmbH

require 'inspec/utils/simpleconfig'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class LimitsConf < Inspec.resource(1)
    name 'limits_conf'
    supports platform: 'unix'
    desc 'Use the limits_conf InSpec audit resource to test configuration settings in the /etc/security/limits.conf file. The limits.conf defines limits for processes (by user and/or group names) and helps ensure that the system on which those processes are running remains stable. Each process may be assigned a hard or soft limit.'
    example <<~EXAMPLE
      describe limits_conf do
        its('*') { should include ['hard','core','0'] }
      end
    EXAMPLE

    include FileReader

    def initialize(path = nil)
      @conf_path = path || '/etc/security/limits.conf'
      @content = read_file_content(@conf_path)
    end

    def method_missing(name)
      read_params[name.to_s]
    end

    def read_params
      return @params if defined?(@params)

      # parse the file
      conf = SimpleConfig.new(
        @content,
        assignment_regex: /^\s*(\S+?)\s+(.*?)\s+(.*?)\s+(.*?)\s*$/,
        key_values: 3,
        multiple_values: true,
      )
      @params = conf.params
    end

    def to_s
      'limits.conf'
    end
  end
end
