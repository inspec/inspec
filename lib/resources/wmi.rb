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
      describe wmi('RSOP_SecuritySettingNumeric', {
        namespace: 'root\\rsop\\computer',
        filter: 'KeyName = \'MinimumPasswordAge\' And precedence=1'
      }) do
         its('Setting') { should eq true }
      end
    "

    include ObjectTraverser
    attr_accessor :content

    def initialize(wmiclass, opts = {})
      # verify that this resource is only supported on Windows
      return skip_resource 'The `windows_feature` resource is not supported on your OS.' unless inspec.os.windows?

      @wmiclass = wmiclass
      @wminamespace = opts[:namespace]
      @wmifilter = opts[:filter]
    end

    # returns nil, if not existant or value
    def method_missing(*keys)
      # catch behavior of rspec its implementation
      # @see https://github.com/rspec/rspec-its/blob/master/lib/rspec/its.rb#L110
      keys.shift if keys.is_a?(Array) && keys[0] == :[]

      # map all symbols to strings
      keys = keys.map(&:to_s) if keys.is_a?(Array)

      value(keys)
    end

    def value(key)
      extract_value(key, info)
    end

    def info
      return @content if defined?(@content)
      @content = {}

      # we should abort execution, if wmi class is not given or wmi resource is
      # executed on a non-windows system
      return @content if @wmiclass.nil?

      # optional params
      cmd_namespace = "-namespace #{@wminamespace}" unless @wminamespace.nil?
      cmd_filter = "-filter \"#{@wmifilter}\"" unless @wmifilter.nil?

      # run wmi command
      cmd = inspec.command("Get-WmiObject -class #{@wmiclass} #{cmd_namespace} #{cmd_filter} | ConvertTo-Json")
      @content = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => _e
      @content
    end

    def to_s
      "WMI #{@wmiclass} where #{@wmifilter}"
    end
  end
end
