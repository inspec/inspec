# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
# license: All rights reserved

# Verifies if a kernel module is loaded
# Usage:
# describe kernel_module('bridge') do
#   it { should be_loaded }
# end
class KernelModule < Inspec.resource(1)
  name 'kernel_module'

  def initialize(modulename = nil)
    @module = modulename

    # this resource is only supported on Linux
    return skip_resource 'The `kernel_parameter` resource is not supported on your OS.' if !inspec.os.linux?
  end

  def loaded?
    # default lsmod command
    lsmod_cmd = 'lsmod'
    # special care for CentOS 5 and sudo
    lsmod_cmd = '/sbin/lsmod' if inspec.os[:family] == 'centos' && inspec.os[:release].to_i == 5

    # get list of all modules
    cmd = inspec.command(lsmod_cmd)
    return false if cmd.exit_status != 0

    # check if module is loaded
    re = Regexp.new('^'+Regexp.quote(@module)+'\s')
    found = cmd.stdout.match(re)
    !found.nil?
  end

  def to_s
    "Kernel Module #{@module}"
  end
end
