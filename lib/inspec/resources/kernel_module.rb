module Inspec::Resources
  class KernelModule < Inspec.resource(1)
    name 'kernel_module'
    supports platform: 'unix'
    desc 'Use the kernel_module InSpec audit resource to test kernel modules on
    Linux platforms. These parameters are located under /lib/modules. Any submodule
    may be tested using this resource.

    The `kernel_module` resource can also verify if a kernel module is `blacklisted`
    or if a module is disabled via a fake install using the `bin_true` or `bin_false`
    method.'

    example <<~EXAMPLE
      describe kernel_module('video') do
        it { should be_loaded }
        it { should_not be_disabled }
        it { should_not be_blacklisted }
      end

      describe kernel_module('sstfb') do
        it { should_not be_loaded }
        it { should be_disabled }
      end

      describe kernel_module('floppy') do
        it { should be_blacklisted }
      end

      describe kernel_module('dhcp') do
        it { should_not be_loaded }
      end
    EXAMPLE

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

    def disabled?
      !modprobe_output.match(%r{^install\s+#{@module}\s+/(s?)bin/(true|false)}).nil?
    end

    def blacklisted?
      !modprobe_output.match(/^blacklist\s+#{@module}/).nil? || disabled_via_bin_true? || disabled_via_bin_false?
    end

    def version
      cmd = inspec.command("#{modinfo_cmd_for_os} -F version #{@module}")
      cmd.exit_status.zero? ? cmd.stdout.delete("\n") : nil
    end

    def to_s
      "Kernel Module #{@module}"
    end

    private

    def modprobe_output
      @modprobe_output ||= inspec.command("#{modprobe_cmd_for_os} --showconfig").stdout
    end

    def modinfo_cmd_for_os
      if inspec.os.redhat? || inspec.os.name == 'fedora'
        '/sbin/modinfo'
      else
        'modinfo'
      end
    end

    def modprobe_cmd_for_os
      if inspec.os.redhat? || inspec.os.name == 'fedora'
        '/sbin/modprobe'
      else
        'modprobe'
      end
    end

    def disabled_via_bin_true?
      !modprobe_output.match(%r{^install\s+#{@module}\s+/(s?)bin/true}).nil?
    end

    def disabled_via_bin_false?
      !modprobe_output.match(%r{^install\s+#{@module}\s+/(s?)bin/false}).nil?
    end
  end
end
