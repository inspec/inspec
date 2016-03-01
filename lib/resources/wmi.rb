# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

class WMI < Inspec.resource(1)
  name 'wmi'
  desc 'request wmi information'
  example "
    describe wmi('RSOP_SecuritySettingNumeric', {
      namespace: 'root\\rsop\\computer',
      filter: 'KeyName = 'MinimumPasswordAge' And precedence=1'
    }) do
       its('Setting') { should eq true }
    end
  "

  # This would be the same as:
  # WMIC /NAMESPACE:\\root\rsop\computer PATH RSOP_SecuritySettingNumeric WHERE "KeyName = 'MinimumPasswordAge' And precedence=1" GET Setting
  attr_accessor :content
  def initialize(wmiclass, opts)
    @wmiclass = wmiclass
    @wminamespace = opts[:namespace]
    @wmifilter = opts[:filter]

    # verify that this resource is only supported on Windows
    return skip_resource 'The `windows_feature` resource is not supported on your OS.' unless inspec.os.windows?
  end

  # returns nil, if not existant or value
  def method_missing(property)
    info[property.to_s]
  end

  def to_s
    "WMI #{@wmiclass} where #{@wmifilter}"
  end

  def info
    return @content if defined?(@content)
    @content = {}
    cmd = inspec.command("Get-WmiObject -namespace #{@wminamespace} -class #{@wmiclass} -filter \"#{@wmifilter}\" | ConvertTo-Json")
    @content = JSON.parse(cmd.stdout)
    # sometimes we get multiple values
    if @content.is_a?(Array)
      # select the first entry
      @content = @content.first
    end
  rescue JSON::ParserError => e
    @content
  end
end
