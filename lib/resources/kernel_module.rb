# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

module Inspec::Resources
  class KernelModule < Inspec.resource(1)
    name 'kernel_module'
    desc 'Use the kernel_module InSpec audit resource to test kernel modules on Linux platforms. These parameters are located under /lib/modules. Any submodule may be tested using this resource.'
    example "
      describe kernel_module('bridge') do
        it { should be_loaded }
      end
    "

    def initialize(modulename = nil)
      @module = modulename

      # this resource is only supported on Linux
      return skip_resource 'The `kernel_parameter` resource is not supported on your OS.' if !inspec.os.linux?
    end

    def loaded?
      if inspec.os.redhat? || inspec.os.name == 'fedora'
        lsmod_cmd = '/sbin/lsmod'
      else
        lsmod_cmd = 'lsmod'
      end

      # get list of all modules
      cmd = inspec.command(lsmod_cmd)
      return false if cmd.exit_status != 0

      # check if module is loaded
      re = Regexp.new('^'+Regexp.quote(@module)+'\s')
      found = cmd.stdout.match(re)
      !found.nil?
    end

    def version
      if inspec.os.redhat? || inspec.os.name == 'fedora'
        modinfo_cmd = "/sbin/modinfo -F version #{@module}"
      else
        modinfo_cmd = "modinfo -F version #{@module}"
      end

      cmd = inspec.command(modinfo_cmd)
      cmd.exit_status.zero? ? cmd.stdout.delete("\n") : nil
    end

    def to_s
      "Kernel Module #{@module}"
    end
  end
end
