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
#            key: '\SYSTEM\CurrentControlSet\services\Schedule'
# }) do
#   its('Start') { should eq 2 }
# end
#
# Get all childs of a registry key:
# describe registry_key('Task Scheduler','HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet').children do
#   it { should_not eq [] }
# end
#
# Example to use regular expressions for keys
# describe registry_key({
#   hive: HKEY_USERS
# }).children(/^S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]{3,}\\Software\\Policies\\Microsoft\\Windows\\Installer/).each { |key|
#   describe registry_key(key) do
#     its('AlwaysInstallElevated') { should eq 'value' }
#   end
# }
#
# Example to use regular expressions in responses
# describe registry_key({
#   hive: 'HKEY_LOCAL_MACHINE',
#   key: 'SOFTWARE\Microsoft\Windows NT\CurrentVersion'
# }) do
#   its('ProductName') { should match /^[a-zA-Z0-9\(\)\s]*2012\s[rR]2[a-zA-Z0-9\(\)\s]*$/ }
# end

module Inspec::Resources
  class RegistryKey < Inspec.resource(1) # rubocop:disable Metrics/ClassLength
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
        @options[:path] = generate_registry_key_path_from_options
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

    # returns an arrray of child nodes
    def children(filter = nil)
      children_keys(@options[:path], filter)
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

    private

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
      Function InSpec-GetRegistryKey($path) {
        $reg = Get-Item ('Registry::' + $path)
        if ($reg -eq $null) {
          Write-Error "InSpec: Failed to find registry key"
          exit 1001
        }

        $properties = New-Object -Type PSObject
        $reg.Property | ForEach-Object {
            $key = $_
            if ("(default)".Equals($key)) { $key = '' }
            $value = New-Object psobject -Property @{
              "value" =  $reg.GetValue($key);
              "type"  = $reg.GetValueKind($key);
            }
            $properties | Add-Member NoteProperty $_ $value
        }
        $properties
      }
      $path = '#{path}'
      InSpec-GetRegistryKey($path) | ConvertTo-Json -Compress
      EOH

      cmd = inspec.powershell(script)
      # cannot rely on exit code for now, successful command returns exit code 1
      # return nil if cmd.exit_status != 0, try to parse json
      begin
        if cmd.exit_status == 1001 && cmd.stderr =~ /InSpec: Failed to find registry key/
          # TODO: provide the stderr output
          @registry_cache = nil
        else
          @registry_cache = JSON.parse(cmd.stdout)
          # convert keys to lower case
          @registry_cache = Hash[@registry_cache.map do |key, value|
            [key.downcase, value]
          end]
        end
      rescue JSON::ParserError => _e
        @registry_cache = nil
      end
      @registry_cache
    end

    def children_keys(path, filter = '')
      return @children_cache if defined?(@children_cache)
      filter = filter.source if filter.is_a? ::Regexp
      script = <<-EOH
      Function InSpec-FindChildsRegistryKeys($path, $filter) {
        # get information about the child registry keys
        $items = Get-ChildItem -Path ('Registry::' + $path) -rec -ea SilentlyContinue
        # filter entries
        $items | Where-Object {
            $name = $_.Name
            $simple = $name -replace "HKEY_LOCAL_MACHINE\\\\",""
            $simple = $name -replace "HKEY_USERS\\\\",""
            $simple -Match $filter
        } | % { $_.Name }
      }

      $path = '#{path}'
      $filter = "#{filter}"
      ConvertTo-Json @(InSpec-FindChildsRegistryKeys $path $filter)
      EOH
      cmd = inspec.powershell(script)
      begin
        @children_cache = JSON.parse(cmd.stdout)
      rescue JSON::ParserError => _e
        @children_cache = []
      end
      @children_cache
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

    def generate_registry_key_path_from_options
      path = @options[:hive]
      path += format_key_from_options

      path
    end

    def format_key_from_options
      key = @options[:key]
      return '' unless key

      key.start_with?('\\') ? key : "\\#{key}"
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
