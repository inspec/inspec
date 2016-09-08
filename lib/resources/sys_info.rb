# encoding: utf-8
module Inspec::Resources
  # this resource returns additional system informatio
  class System < Inspec.resource(1)
    name 'sys_info'

    desc 'Use the user InSpec system resource to test for operating system properties.'
    example "
      describe sysinfo do
        its('hostname') { should eq 'example.com' }
      end
    "

    def hostname
      os = inspec.os
      if os.linux?
        inspec.command('hostname').stdout.chomp
      elsif os.windows?
        # windows hostname
        inspec.powershell('$env:computername').stdout.chomp
      else
        return skip_resource 'The `system` resource is not supported on your OS yet.'
      end
    end
  end
end
