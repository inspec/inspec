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

  def initialize
    @loaded = false
    @policy = nil
    @exit_status = nil
  end

  # load security content
  def load
    # export the security policy
    inspec.command('secedit /export /cfg win_secpol.cfg')
    # store file content
    command_result ||= inspec.command('type win_secpol.cfg')
    # delete temp file
    inspec.command('del win_secpol.cfg')

    @exit_status = command_result.exit_status.to_i
    @policy = command_result.stdout
    @loaded = true

    # returns self
    self
  end

  def method_missing(method)
    # load data if needed
    if (@loaded == false)
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
