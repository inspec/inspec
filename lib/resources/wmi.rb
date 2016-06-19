# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'utils/object_traversal'

module Inspec::Resources
  # This resource simplifies the access to wmi
  # on CLI you would use:
  # WMIC /NAMESPACE:\\root\rsop\computer PATH RSOP_SecuritySettingNumeric WHERE "KeyName = 'MinimumPasswordAge' And precedence=1" GET Setting
  # We use Get-WmiObject via Powershell to retrieve all values.
  class WMI < Inspec.resource(1)
    name 'wmi'
    desc 'request wmi information'
    example "
      describe wmi({
        class: 'RSOP_SecuritySettingNumeric',
        namespace: 'root\\rsop\\computer',
        filter: 'KeyName = \'MinimumPasswordAge\' And precedence=1'
      }) do
         its('Setting') { should eq true }
      end
    "

    include ObjectTraverser
    attr_accessor :content

    def initialize(wmiclass = nil, opts = nil)
      # verify that this resource is only supported on Windows
      return skip_resource 'The `windows_feature` resource is not supported on your OS.' unless inspec.os.windows?

      @options = opts || {}
      # if wmiclass is not a hash, we have to handle deprecation behavior
      if wmiclass.is_a?(Hash)
        @options.merge!(wmiclass)
      else
        warn '[DEPRECATION] `wmi(\'wmiclass\')` is deprecated.  Please use `wmi({class: \'wmiclass\'})` instead.'
        @options[:class] = wmiclass
      end
    end

    # returns nil, if not existant or value
    def method_missing(*keys)
      # catch behavior of rspec its implementation
      # @see https://github.com/rspec/rspec-its/blob/master/lib/rspec/its.rb#L110
      keys.shift if keys.is_a?(Array) && keys[0] == :[]

      # map all symbols to strings
      keys = keys.map { |x| x.to_s.downcase } if keys.is_a?(Array)

      value(keys)
    end

    def value(key)
      extract_value(key, params)
    end

    def params
      return @content if defined?(@content)
      @content = {}

      # abort if no options are available
      return @content unless defined?(@options)

      # filter for supported options
      args = @options.select { |key, _value| [:class, :namespace, :query, :filter].include?(key) }

      # convert to Get-WmiObject arguments
      params = ''
      args.each { |key, value| params += " -#{key} \"#{value}\"" }

      # run wmi command and filter empty wmi
      script = <<-EOH
      Filter Aggregate
      {
          $arr = @{}
          $_.properties | % {
              $arr.Add($_.name, $_.value)
          }
          $arr
      }
      Get-WmiObject #{params} | Aggregate | ConvertTo-Json
      EOH

      # run wmi command
      cmd = inspec.powershell(script)
      @content = JSON.parse(cmd.stdout)

      # make all keys case-insensitive
      @content = lowercase_keys(@content)
    rescue JSON::ParserError => _e
      @content
    end

    def to_s
      "WMI with #{@options}"
    end

    private

    def lowercase_keys(content)
      if content.is_a?(Hash)
        content.keys.each do |key|
          new_key = key.to_s.downcase
          content[new_key] = content.delete(key)
          lowercase_keys(content[new_key])
        end
      elsif content.respond_to?(:each)
        content.each { |item| lowercase_keys(item) }
      end
      content
    end
  end
end
