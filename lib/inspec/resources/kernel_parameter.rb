require 'inspec/resources/command'

module Inspec::Resources
  class KernelParameter < Inspec.resource(1)
    name 'kernel_parameter'
    supports platform: 'unix'
    desc 'Use the kernel_parameter InSpec audit resource to test kernel parameters on Linux platforms.'
    example <<~EXAMPLE
      describe kernel_parameter('net.ipv4.conf.all.forwarding') do
        its('value') { should eq 0 }
      end
    EXAMPLE

    def initialize(parameter = nil)
      @parameter = parameter

      # this resource is only supported on Linux
      return skip_resource 'The `kernel_parameter` resource is not supported on your OS.' if !inspec.os.linux?
    end

    def value
      cmd = inspec.command("/sbin/sysctl -q -n #{@parameter}")
      return nil if cmd.exit_status != 0
      # remove whitespace
      cmd = cmd.stdout.chomp.strip
      # convert to number if possible
      cmd = cmd.to_i if cmd =~ /^\d+$/
      cmd
    end

    def to_s
      "Kernel Parameter #{@parameter}"
    end
  end

  class LinuxKernelParameter < KernelParameter
    name 'linux_kernel_parameter'

    def initialize(parameter)
      Inspec.deprecate(:resource_linux_kernel_parameter, 'The `linux_kernel_parameter` resource is deprecated. Please use `kernel_parameter`')
      super(parameter)
    end

    def value
      Inspec.deprecate(:resource_linux_kernel_parameter, 'The `linux_kernel_parameter` resource is deprecated. Please use `kernel_parameter`')
      super()
    end

    def to_s
      "Kernel Parameter #{@parameter}"
    end
  end
end
