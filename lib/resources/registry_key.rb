# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# license: All rights reserved

require 'json'

# Usage:
# describe registry_key('Task Scheduler','HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule') do
#   its('Start') { should eq 2 }
# end

class RegistryKey < Inspec.resource(1)
  name 'registry_key'

  attr_accessor :reg_key

  def initialize(name, reg_key = nil)
    # if we have one parameter, we use it as name
    reg_key ||= name
    @name = name
    @reg_key = reg_key
  end

  def registry_value(path, key)
    cmd = "(Get-Item 'Registry::#{path}').GetValue('#{key}')"
    command_result ||= inspec.command(cmd)
    val = { exit_code: command_result.exit_status.to_i, data: command_result.stdout }
    val
  end

  def convert_value(value)
    val = value.strip
    val = val.to_i if val.match(/^\d+$/)
    val
  end

  # returns nil, if not existant or value
  def method_missing(meth)
    # get data
    val = registry_value(@reg_key, meth)

    # verify data
    if val[:exit_code] == 0
      return convert_value(val[:data])
    else
      return nil
    end
  end

  def to_s
    "Registry Key #{@name}"
  end
end
