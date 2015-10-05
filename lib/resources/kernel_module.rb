# encoding: utf-8
# license: All rights reserved

# Verifies if a kernel module is loaded
# Usage:
# describe kernel_module('bridge') do
#   it { should be_loaded }
# end
class KernelModule < Vulcano.resource(1)
  name 'kernel_module'

  def initialize(modulename = nil)
    @module = modulename

    # this resource is only supported on Linux
    return skip_resource 'The `kernel_module` resource is not supported on your OS.' if !%w{ubuntu debian redhat fedora arch}.include? vulcano.os[:family]
  end

  def loaded?
    # get list of all modules
    cmd = vulcano.command('lsmod')
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
