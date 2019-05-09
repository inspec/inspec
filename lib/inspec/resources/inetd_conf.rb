# copyright: 2015, Vulcano Security GmbH

require 'inspec/utils/simpleconfig'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class InetdConf < Inspec.resource(1)
    name 'inetd_conf'
    supports platform: 'unix'
    desc 'Use the inetd_conf InSpec audit resource to test if a service is enabled in the inetd.conf file on Linux and UNIX platforms. inetd---the Internet service daemon---listens on dedicated ports, and then loads the appropriate program based on a request. The inetd.conf file is typically located at /etc/inetd.conf and contains a list of Internet services associated to the ports on which that service will listen. Only enabled services may handle a request; only services that are required by the system should be enabled.'
    example <<~EXAMPLE
      describe inetd_conf do
        its('shell') { should eq nil }
        its('login') { should eq nil }
        its('exec') { should eq nil }
      end
    EXAMPLE

    include FileReader

    def initialize(path = nil)
      @conf_path = path || '/etc/inetd.conf'
      @content = read_file_content(@conf_path)
    end

    # overwrite exec to ensure it works with its
    # TODO: this needs to be fixed in RSpec
    def exec
      read_params['exec']
    end

    def method_missing(name)
      read_params[name.to_s]
    end

    def read_params
      return @params if defined?(@params)

      # parse the file
      conf = SimpleConfig.new(
        @content,
        assignment_regex: /^\s*(\S+?)\s+(.*?)\s+(.*?)\s+(.*?)\s+(.*?)\s+(.*?)\s+(.*?)\s*$/,
        key_values: 6,
        multiple_values: false,
      )
      @params = conf.params
    end

    def to_s
      'inetd.conf'
    end
  end
end
