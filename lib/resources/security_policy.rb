# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# Security Configuration and Analysis
#
# Export local security policy:
# secedit /export /cfg secpol.cfg
#
# @link http://www.microsoft.com/en-us/download/details.aspx?id=25250
#
# In Windows, some security options are managed differently that the local GPO
# All local GPO parameters can be examined via Registry, but not all security
# parameters. Therefore we need a combination of Registry and secedit output

class SecurityPolicy < Inspec.resource(1)
  name 'security_policy'
  desc 'Use the security_policy InSpec audit resource to test security policies on the Microsoft Windows platform.'
  example "
    describe security_policy do
      its('SeNetworkLogonRight') { should eq '*S-1-5-11' }
    end
  "
  def initialize
    @loaded = false
    @policy = nil
    @exit_status = nil
  end

  # load security content
  def load
    # export the security policy
    cmd = inspec.command('secedit /export /cfg win_secpol.cfg')
    return nil if cmd.exit_status.to_i != 0

    # store file content
    cmd = inspec.command('Get-Content win_secpol.cfg')
    @exit_status = cmd.exit_status.to_i
    return nil if @exit_status != 0
    @policy = cmd.stdout
    @loaded = true
    
    # delete temp file
    cmd = inspec.command('Remove-Item win_secpol.cfg')
    return nil if cmd.exit_status.to_i != 0

    # returns self
    self
  end

  def method_missing(method)
    # load data if needed
    if @loaded == false
      load
    end

    # find line with key
    key = Regexp.escape(method.to_s)
    target = ''
    @policy.each_line {|s|
      target = s.strip if s.match(/^\s*#{key}\s*=\s*(.*)\b/)
    }

    # extract variable value
    result = target.match(/[=]{1}\s*(?<value>.*)/)

    if !result.nil?
      val = result[:value]
      val = val.to_i if val.match(/^\d+$/)
    else
      # TODO: we may need to return skip or failure if the
      # requested value is not available
      val = nil
    end

    val
  end

  def to_s
    'Security Policy'
  end
end
