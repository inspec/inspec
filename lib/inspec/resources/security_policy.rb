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
require 'inspec/resources/command'
require 'inspec/utils/simpleconfig'

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
    supports platform: 'windows'
    desc 'Use the security_policy InSpec audit resource to test security policies on the Microsoft Windows platform.'
    example <<~EXAMPLE
      describe security_policy do
        its('SeNetworkLogonRight') { should include 'S-1-5-11' }
      end

      describe security_policy(translate_sid: true) do
        its('SeNetworkLogonRight') { should include 'NT AUTHORITY\\Authenticated Users' }
      end
    EXAMPLE

    def initialize(opts = {})
      @translate_sid = opts[:translate_sid] || false
    end

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

      # using process pid to prevent any race conditions with multiple runners
      export_file = "win_secpol-#{Process.pid}.cfg"

      # export the security policy
      cmd = inspec.command("secedit /export /cfg #{export_file}")
      return nil if cmd.exit_status.to_i != 0

      # store file content
      cmd = inspec.command("Get-Content #{export_file}")
      return skip_resource "Can't read security policy" if cmd.exit_status.to_i != 0

      @content = cmd.stdout
    ensure
      # delete temp file
      inspec.command("Remove-Item #{export_file}").exit_status.to_i
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
      elsif val =~ /[,]{0,1}\*\S/
        if @translate_sid
          val.split(',').map { |v|
            object_name = inspec.command("(New-Object System.Security.Principal.SecurityIdentifier(\"#{v.sub('*S', 'S')}\")).Translate( [System.Security.Principal.NTAccount]).Value").stdout.to_s.strip
            object_name.empty? || object_name.nil? ? v.sub('*S', 'S') : object_name
          }
        else
          val.split(',').map { |v|
            v.sub('*S', 'S')
          }
        end
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
