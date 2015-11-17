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

  def exists?
    !registry_value(@reg_key).nil?
  end

  def has_value?(value)
    val = registry_value(@reg_key)
    !val.nil? && val['(default)'.to_s]['value'] == value ? true : false
  end

  def has_property?(property_name, property_type = nil)
    val = registry_value(@reg_key)
    !val.nil? && !val[property_name.to_s].nil? && (property_type.nil? || val[property_name.to_s]['type'] == map2type(property_type)) ? true : false
  end

  # deactivate rubocop, because we need to stay compatible with Serverspe
  # rubocop:disable Style/OptionalArguments
  def has_property_value?(property_name, property_type = nil, value)
    # rubocop:enable Style/OptionalArguments
    val = registry_value(@reg_key)

    # convert value to binary if required
    value = value.bytes if !property_type.nil? && map2type(property_type) == 3 && !value.is_a?(Array)

    !val.nil? && val[property_name.to_s]['value'] == value && (property_type.nil? || val[property_name.to_s]['type'] == map2type(property_type)) ? true : false
  end

  # returns nil, if not existant or value
  def method_missing(meth)
    # get data
    val = registry_value(@reg_key)
    return nil if val.nil?
    val[meth.to_s]['value']
  end

  def to_s
    "Registry Key #{@name}"
  end

  private

  def registry_value(path)
    return @registy_cache if defined?(@registy_cache)

    # load registry key and all properties
    script = <<-EOH
    $reg = Get-Item 'Registry::#{path}'
    $object = New-Object -Type PSObject
    $reg.Property | ForEach-Object {
        $key = $_
        if ("(default)".Equals($key)) { $key = '' }
        $value = New-Object psobject -Property @{
          "value" =  $reg.GetValue($key);
          "type"  = $reg.GetValueKind($key);
        }
        $object | Add-Member –MemberType NoteProperty –Name $_ –Value $value
    }
    $object | ConvertTo-Json
    EOH

    cmd = inspec.script(script)

    # cannot rely on exit code for now, successful command returns exit code 1
    # return nil if cmd.exit_status != 0, try to parse json
    begin
      @registy_cache = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      @registy_cache = nil
    end

    @registy_cache
  end

  # Registry key value types
  # @see https://msdn.microsoft.com/en-us/library/windows/desktop/ms724884(v=vs.85).aspx
  # REG_NONE 0
  # REG_SZ 1
  # REG_EXPAND_SZ 2
  # REG_BINARY 3
  # REG_DWORD 4
  # REG_DWORD_LITTLE_ENDIAN 4
  # REG_DWORD_BIG_ENDIAN 5
  # REG_LINK 6
  # REG_MULTI_SZ 7
  # REG_RESOURCE_LIST 8
  # REG_FULL_RESOURCE_DESCRIPTOR 9
  # REG_RESOURCE_REQUIREMENTS_LIST 10
  # REG_QWORD 11
  # REG_QWORD_LITTLE_ENDIAN 11
  def map2type(symbol)
    options = {}

    # chef symbols, we prefer those
    options[:binary] = 3
    options[:string] = 1
    options[:multi_string] = 7
    options[:expand_string] = 2
    options[:dword] = 4
    options[:dword_big_endian] = 5
    options[:qword] = 11

    # serverspec symbols
    options[:type_string] = 1
    options[:type_binary] = 3
    options[:type_dword] = 4
    options[:type_qword] = 11
    options[:type_multistring] = 7
    options[:type_expandstring] = 2

    options[symbol]
  end
end

# for compatability with serverspec
# this is deprecated syntax and will be removed in future versions
class WindowsRegistryKey < RegistryKey
  name 'windows_registry_key'

  def initialize(name)
    deprecated
    super(name)
  end

  def deprecated
    warn '[DEPRECATION] `yumrepo(reponame)` is deprecated.  Please use `yum.repo(reponame)` instead.'
  end
end
