# copyright: 2015, Vulcano Security GmbH

require 'inspec/utils/simpleconfig'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class AuditDaemonConf < Inspec.resource(1)
    name 'auditd_conf'
    supports platform: 'unix'
    desc "Use the auditd_conf InSpec audit resource to test the configuration settings for the audit daemon. This file is typically located under /etc/audit/auditd.conf' on UNIX and Linux platforms."
    example <<~EXAMPLE
      describe auditd_conf do
        its('space_left_action') { should eq 'email' }
      end
    EXAMPLE

    include FileReader

    def initialize(path = nil)
      @conf_path = path || '/etc/audit/auditd.conf'
      @content = read_file_content(@conf_path)
    end

    def method_missing(name)
      read_params[name.to_s]
    end

    def to_s
      'Audit Daemon Config'
    end

    private

    def read_params
      return @params if defined?(@params)

      # parse the file
      conf = SimpleConfig.new(
        @content,
        multiple_values: false,
      )
      @params = conf.params
    end
  end
end
