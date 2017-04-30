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

require 'hashie'

module Inspec::Resources
  # known and supported MS privilege rights
  # @see https://technet.microsoft.com/en-us/library/dd277311.aspx
  # @see https://msdn.microsoft.com/en-us/library/windows/desktop/bb530716(v=vs.85).aspx
  MS_PRIVILEGES_RIGHTS = [
    'SeNetworkLogonRight',
    'SeBackupPrivilege',
    'SeChangeNotifyPrivilege',
    'SeSystemtimePrivilege',
    'SeCreatePagefilePrivilege',
    'SeDebugPrivilege',
    'SeRemoteShutdownPrivilege',
    'SeAuditPrivilege',
    'SeIncreaseQuotaPrivilege',
    'SeIncreaseBasePriorityPrivilege',
    'SeLoadDriverPrivilege',
    'SeBatchLogonRight',
    'SeServiceLogonRight',
    'SeInteractiveLogonRight',
    'SeSecurityPrivilege',
    'SeSystemEnvironmentPrivilege',
    'SeProfileSingleProcessPrivilege',
    'SeSystemProfilePrivilege',
    'SeAssignPrimaryTokenPrivilege',
    'SeRestorePrivilege',
    'SeShutdownPrivilege',
    'SeTakeOwnershipPrivilege',
    'SeUndockPrivilege',
    'SeManageVolumePrivilege',
    'SeRemoteInteractiveLogonRight',
    'SeImpersonatePrivilege',
    'SeCreateGlobalPrivilege',
    'SeIncreaseWorking',
    'SeTimeZonePrivilege',
    'SeCreateSymbolicLinkPrivilege',
    'SeDenyNetworkLogonRight', # Deny access to this computer from the network
    'SeDenyInteractiveLogonRight', # Deny logon locally
    'SeDenyBatchLogonRight', # Deny logon as a batch job
    'SeDenyServiceLogonRight', # Deny logon as a service
    'SeTcbPrivilege',
    'SeMachineAccountPrivilege',
    'SeCreateTokenPrivilege',
    'SeCreatePermanentPrivilege',
    'SeEnableDelegationPrivilege',
    'SeLockMemoryPrivilege',
    'SeSyncAgentPrivilege',
    'SeUnsolicitedInputPrivilege',
    'SeTrustedCredManAccessPrivilege',
    'SeRelabelPrivilege', # the privilege to change a Windows integrity label (new to Windows Vista)
    'SeDenyRemoteInteractiveLogonRight', # Deny logon through Terminal Services
  ].freeze

  class SecurityPolicy < Inspec.resource(1)
    name 'security_policy'
    desc 'Use the security_policy InSpec audit resource to test security policies on the Microsoft Windows platform.'
    example "
      describe security_policy do
        its('SeNetworkLogonRight') { should include 'S-1-5-11' }
      end
    "

    def content
      read_content
    end

    def params(*opts)
      opts.inject(read_params) do |res, nxt|
        res.respond_to?(:key) ? res[nxt] : nil
      end
    end

    def method_missing(name)
      params = read_params
      return nil if params.nil?

      # deep search for hash key
      params.extend Hashie::Extensions::DeepFind
      res = params.deep_find(name.to_s)

      # return an empty array if configuration does not include rights configuration
      return [] if res.nil? && MS_PRIVILEGES_RIGHTS.include?(name.to_s)
      res
    end

    def to_s
      'Security Policy'
    end

    private

    def read_content
      return @content if defined?(@content)

      # export the security policy
      cmd = inspec.command('secedit /export /cfg win_secpol.cfg')
      return nil if cmd.exit_status.to_i != 0

      # store file content
      cmd = inspec.command('Get-Content win_secpol.cfg')
      return skip_resource "Can't read security policy" if cmd.exit_status.to_i != 0
      @content = cmd.stdout

      if @content.empty? && !file.empty?
        return skip_resource "Can't read security policy"
      end
      @content
    ensure
      # delete temp file
      inspec.command('Remove-Item win_secpol.cfg').exit_status.to_i
    end

    def read_params
      return @params if defined?(@params)
      return @params = {} if read_content.nil?

      conf = SimpleConfig.new(
        @content,
        assignment_regex: /^\s*(.*)=\s*(\S*)\s*$/,
      )
      @params = convert_hash(conf.params)
    end

    # extracts the values, this methods detects:
    # numbers and SIDs and optimizes them for further usage
    def extract_value(val)
      if val =~ /^\d+$/
        val.to_i
      # special handling for SID array
      elsif val =~ /^\*\S/
        val.split(',').map { |v|
          v.sub('*S', 'S')
        }
      # special handling for string values with "
      elsif !(m = /^\"(.*)\"$/.match(val)).nil?
        m[1]
      else
        val
      end
    end

    def convert_hash(hash)
      new_hash = {}
      hash.each do |k, v|
        v.is_a?(Hash) ? value = convert_hash(v) : value = extract_value(v)
        new_hash[k.strip] = value
      end
      new_hash
    end
  end
end
