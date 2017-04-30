# encoding: utf-8
module Inspec::Resources
  # this resource returns additional system informatio
  class System < Inspec.resource(1)
    name 'sys_info'

    desc 'Use the user InSpec system resource to test for operating system properties.'
    example "
      describe sys_info do
        its('hostname') { should eq 'example.com' }
      end
    "

    # returns the hostname of the local system
    def hostname
      os = inspec.os
      if os.linux? || os.darwin?
        inspec.command('hostname').stdout.chomp
      elsif os.windows?
        inspec.powershell('$env:computername').stdout.chomp
      else
        skip_resource 'The `sys_info.hostname` resource is not supported on your OS yet.'
      end
    end
  end
end
