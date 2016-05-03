# encoding: utf-8
# author: Christoph Hartmann
# license: All rights reserved

module Inspec::Resources
  class KernelParameter < Inspec.resource(1)
    name 'kernel_parameter'
    desc 'Use the kernel_parameter InSpec audit resource to test kernel parameters on Linux platforms.'
    example "
      describe kernel_parameter('net.ipv4.conf.all.forwarding') do
        its('value') { should eq 0 }
      end
    "

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

  # for compatability with serverspec
  # this is deprecated syntax and will be removed in future versions
  class LinuxKernelParameter < KernelParameter
    name 'linux_kernel_parameter'

    def initialize(parameter)
      super(parameter)
    end

    def value
      deprecated
      super()
    end

    def deprecated
      warn '[DEPRECATION] `linux_kernel_parameter(parameter)` is deprecated.  Please use `kernel_parameter(parameter)` instead.'
    end

    def to_s
      "Kernel Parameter #{@parameter}"
    end
  end
end
