# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

include Serverspec::Type
require 'json'

# Registry Key Helper
class RegistryKey < Serverspec::Type::Base

  attr_accessor :reg_key

  def getRegistryValue(path, key)
    cmd = "(Get-Item 'Registry::#{path}').GetValue('#{key}')"
    command_result ||= @runner.run_command(cmd)
    val = { :exit_code => command_result.exit_status.to_i, :data => command_result.stdout }
    val
  end

  def convertValue (value)
    val = value.strip
    val = val.to_i if val.match(/^\d+$/)
  end

  # returns nil, if not existant or value
  def method_missing(meth)

    # get data
    val = getRegistryValue(@reg_key, meth)

    # verify data
    if (val[:exit_code] == 0)
      val = convertValue(val[:data])
    else
      nil
    end

  end

  def to_s
    "Registry Key #{@name}"
  end

end

module Serverspec::Type
  def registry_key(name, reg_key=nil)
    # if we have one parameter, we use it as name
    if reg_key == nil
      reg_key = name
    end

    # initialize variable
    i = RegistryKey.new(name)
    i.reg_key = reg_key
    i
  end
end