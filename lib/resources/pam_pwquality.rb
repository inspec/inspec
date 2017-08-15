# encoding: utf-8
# author: Matthew Dromazos

require 'utils/SimpleConfig'
require 'utils/parser'
module Inspec::Resources
  class PamPwquality < Inspec.resource(1)
    name 'pam_pwquality'
    desc 'Use the pam_pwquality InSpec audit resource to verify that pam_pwquality.so is enabled and verify the options or arguments that the module is running.'
    example "
      describe sec_pwquality_conf() do
        it { should be_enabled }
      end

      describe sec_pwquality_conf() do
        its('arguments') { should eq ['try_first_pass', 'local_users_only', 'retry=3', 'authtok_type='] }
      end
    "

    # figure out which implementation it is using, sec/pwquality, or whatever.

    attr_reader :params

    def initialize(host_path = nil)
      return skip_resource 'The `pam_pwquality` resource is not supported on your OS.' unless inspec.os.linux?
      @declared_path = host_path || '/etc/pam.d/passwd'
      detect_file
    end

    def enabled?
      !(inspec.command("grep pwquality #{@declared_path}").stdout =~ /^password\s+.+\s+pam_pwquality.so/).nil?
    end

    def arguments
      return 'pam_pwquality is not enabled for that file' unless enabled?
      inspec.command("grep pwquality #{@declared_path}").stdout.match(/^password\s+.+\s+pam_pwquality.so.*/)[0].split[3..-1]
    end

    def options
      inspec.sec_pwquality_conf.params
    end

    private

    def detect_file(conf_path = @declared_path)
      # Determine if the file exists and contains anything.
      file = inspec.file(conf_path)
      if !file.file?
        return skip_resource "Can't find file. If this is the correct path,
          access control is turned off.\"#{@declared_path}\""
      end
      raw_conf = file.content
      if raw_conf.empty? && !file.empty?
        return skip_resource("File is empty. If this is the correct file,
          access control is turned off. Path:\"#{@declared_path}\"")
      end
    end
  end
end
