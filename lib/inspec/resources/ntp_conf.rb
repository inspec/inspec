# copyright: 2015, Vulcano Security GmbH

require 'inspec/utils/simpleconfig'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class NtpConf < Inspec.resource(1)
    name 'ntp_conf'
    supports platform: 'unix'
    desc 'Use the ntp_conf InSpec audit resource to test the synchronization settings defined in the ntp.conf file. This file is typically located at /etc/ntp.conf.'
    example <<~EXAMPLE
      describe ntp_conf do
        its('server') { should_not eq nil }
        its('restrict') { should include '-4 default kod notrap nomodify nopeer noquery'}
      end
    EXAMPLE

    include FileReader

    def initialize(path = nil)
      @conf_path = path || '/etc/ntp.conf'
      @content = read_file_content(@conf_path)
    end

    def method_missing(name)
      param = read_params[name.to_s]
      # extract first value if we have only one value in array
      return param[0] if param.is_a?(Array) and param.length == 1
      param
    end

    def to_s
      'ntp.conf'
    end

    private

    def read_params
      return @params if defined?(@params)

      # parse the file
      conf = SimpleConfig.new(
        @content,
        assignment_regex: /^\s*(\S+)\s+(.*)\s*$/,
        multiple_values: true,
      )
      @params = conf.params
    end
  end
end
