# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'utils/object_traversal'

module Inspec::Resources
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

    # This would be the same as:
    # WMIC /NAMESPACE:\\root\rsop\computer PATH RSOP_SecuritySettingNumeric WHERE "KeyName = 'MinimumPasswordAge' And precedence=1" GET Setting
    attr_accessor :content
    def initialize(wmiclass, opts = {})
      @wmiclass = wmiclass
      @wminamespace = opts[:namespace]
      @wmifilter = opts[:filter]

      # verify that this resource is only supported on Windows
      return skip_resource 'The `windows_feature` resource is not supported on your OS.' unless inspec.os.windows?
    end

    # returns nil, if not existant or value
    def method_missing(*keys)
      # catch bahavior of rspec its implementation
      # @see https://github.com/rspec/rspec-its/blob/master/lib/rspec/its.rb#L110
      keys.shift if keys.is_a?(Array) && keys[0] == :[]
      value(keys)
    end

    def value(key)
      extract_value(key, info)
    end

    def info
      return @content if defined?(@content)
      @content = {}

      # optional params
      cmd_namespace = "-namespace #{@wminamespace}" unless @wminamespace.nil?
      cmd_filter = "-filter \"#{@wmifilter}\"" unless @wmifilter.nil?

      # run wmi command
      cmd = inspec.command("Get-WmiObject -class #{@wmiclass} #{cmd_namespace} #{cmd_filter} | ConvertTo-Json")
      @content = JSON.parse(cmd.stdout)
    rescue JSON::ParserError => e
      @content
    end

    def to_s
      "WMI #{@wmiclass} where #{@wmifilter}"
    end
  end
end
