
require 'inspec/utils/object_traversal'

module Inspec::Resources
  # This resource simplifies the access to wmi
  # on CLI you would use:
  # WMIC /NAMESPACE:\\root\rsop\computer PATH RSOP_SecuritySettingNumeric WHERE "KeyName = 'MinimumPasswordAge' And precedence=1" GET Setting
  # We use Get-WmiObject via Powershell to retrieve all values.
  class WMI < Inspec.resource(1)
    name 'wmi'
    supports platform: 'windows'
    desc 'request wmi information'
    example <<~EXAMPLE
      describe wmi({
        class: 'RSOP_SecuritySettingNumeric',
        namespace: 'root\\rsop\\computer',
        filter: 'KeyName = \'MinimumPasswordAge\' And precedence=1'
      }) do
         its('Setting') { should eq true }
      end
    EXAMPLE

    include ObjectTraverser
    attr_accessor :content

    def initialize(wmiclass = nil, opts = nil)
      @options = opts || {}
      if wmiclass.is_a?(Hash)
        @options.merge!(wmiclass)
      else
        Inspec.deprecate(:wmi_non_hash_usage, 'Using `wmi(\'wmisclass\')` is deprecated. Please use`wmi({class: \'wmisclass\'})`')
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
      args.each { |key, value| params += " -#{key} \"#{value.gsub('"', '`"')}\"" }

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
