# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Christoph Hartmann
# license: All rights reserved

require 'json'

# Three constructor methods are available:
# 1. resistry_key(path'):
# describe registry_key('Task Scheduler','HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule') do
#   its('Start') { should eq 2 }
# end
#
# 2. resistry_key('name','path'):
# describe registry_key('Task Scheduler','HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule') do
#   its('Start') { should eq 2 }
# end
#
# 3. options hash
# describe registry_key({
#            name: 'Task Scheduler',
#            hive: 'HKEY_LOCAL_MACHINE',
#            key: ''\SYSTEM\CurrentControlSet\services\Schedule'
# }) do
#   its('Start') { should eq 2 }
# end

module Inspec::Resources
  class RegistryKey < Inspec.resource(1)
    name 'registry_key'
    desc 'Use the registry_key InSpec audit resource to test key values in the Microsoft Windows registry.'
    example "
      describe registry_key('path\to\key') do
        its('name') { should eq 'value' }
      end
    "

    def initialize(name, reg_key = nil)
      # if we have one parameter, we use it as name
      reg_key ||= name
      @options = {}
      if reg_key && reg_key.is_a?(Hash)
        @options = @options.merge!(reg_key)
        # generate registry_key if we do not have a regular expression
        @options[:path] = @options[:hive] + '\\' + @options[:key]
        @options[:name] ||= @options[:path]
      else
        @options[:name] = name
        @options[:path] = reg_key
      end
      return skip_resource 'The `registry_key` resource is not supported on your OS yet.' if !inspec.os.windows?
    end

    def exists?
      !registry_key(@options[:path]).nil?
    end

    def has_value?(value)
      val = registry_key(@options[:path])
      !val.nil? && registry_property_value(val, '(default)') == value ? true : false
    end

    def has_property?(property_name, property_type = nil)
      val = registry_key(@options[:path])
      !val.nil? && registry_property_exists(val, property_name) && (property_type.nil? || registry_property_type(val, property_name) == map2type(property_type)) ? true : false
    end

    # deactivate rubocop, because we need to stay compatible with Serverspe
    # rubocop:disable Style/OptionalArguments
    def has_property_value?(property_name, property_type = nil, value)
      # rubocop:enable Style/OptionalArguments
      val = registry_key(@options[:path])

      # convert value to binary if required
      value = value.bytes if !property_type.nil? && map2type(property_type) == 3 && !value.is_a?(Array)

      !val.nil? && registry_property_value(val, property_name) == value && (property_type.nil? || registry_property_type(val, property_name) == map2type(property_type)) ? true : false
    end

    # returns nil, if not existant or value
    def method_missing(meth)
      # get data
      val = registry_key(@options[:path])
      registry_property_value(val, meth)
    end

    def to_s
      "Registry Key #{@options[:name]}"
    end

    # private

    def prep_prop(property)
      property.to_s.downcase
    end

    def registry_property_exists(regkey, property)
      return false if regkey.nil? || property.nil?
      # always ensure the key is lower case
      !regkey[prep_prop(property)].nil?
    end

    def registry_property_value(regkey, property)
      return nil if !registry_property_exists(regkey, property)
      # always ensure the key is lower case
      regkey[prep_prop(property)]['value']
    end

    def registry_property_type(regkey, property)
      return nil if !registry_property_exists(regkey, property)
      # always ensure the key is lower case
      regkey[prep_prop(property)]['type']
    end

    def registry_key(path)
      return @registry_cache if defined?(@registry_cache)

      # load registry key and all properties
      script = <<-EOH
      $path = '#{path}'
      Function Get-InSpec-RegistryKey($path) {
        $fullpath = 'Registry::' + $path
        $reg = Get-Item $fullpath

        # convert properties
        $properties = New-Object -Type PSObject
        $reg.Property | ForEach-Object {
            $key = $_
            if ("(default)".Equals($key)) { $key = '' }
            $value = New-Object psobject -Property @{
              "value" =  $reg.GetValue($key);
              "type"  = $reg.GetValueKind($key);
            }
            $properties | Add-Member –MemberType NoteProperty –Name $_ –Value $value
        }
        $properties
      }
      Get-InSpec-RegistryKey($path) | ConvertTo-Json
      EOH

      cmd = inspec.powershell(script)

      # cannot rely on exit code for now, successful command returns exit code 1
      # return nil if cmd.exit_status != 0, try to parse json
      begin
        @registry_cache = JSON.parse(cmd.stdout)
        # convert keys to lower case
        @registry_cache = Hash[@registry_cache.map do |key, value|
          [key.downcase, value]
        end]
      rescue JSON::ParserError => _e
        @registry_cache = nil
      end

      @registry_cache
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
      warn '[DEPRECATION] `windows_registry_key(reg_key)` is deprecated.  Please use `registry_key(\'path\to\key\')` instead.'
    end
  end
end
