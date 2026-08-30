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

require "hashie"
require "inspec/resources/command"
require "inspec/utils/simpleconfig"
require "inspec/log"

module Inspec::Resources
  # known and supported MS privilege rights
  # @see https://technet.microsoft.com/en-us/library/dd277311.aspx
  # @see https://msdn.microsoft.com/en-us/library/windows/desktop/bb530716(v=vs.85).aspx
  MS_PRIVILEGES_RIGHTS = [
    "SeNetworkLogonRight",
    "SeBackupPrivilege",
    "SeChangeNotifyPrivilege",
    "SeSystemtimePrivilege",
    "SeCreatePagefilePrivilege",
    "SeDebugPrivilege",
    "SeRemoteShutdownPrivilege",
    "SeAuditPrivilege",
    "SeIncreaseQuotaPrivilege",
    "SeIncreaseBasePriorityPrivilege",
    "SeLoadDriverPrivilege",
    "SeBatchLogonRight",
    "SeServiceLogonRight",
    "SeInteractiveLogonRight",
    "SeSecurityPrivilege",
    "SeSystemEnvironmentPrivilege",
    "SeProfileSingleProcessPrivilege",
    "SeSystemProfilePrivilege",
    "SeAssignPrimaryTokenPrivilege",
    "SeRestorePrivilege",
    "SeShutdownPrivilege",
    "SeTakeOwnershipPrivilege",
    "SeUndockPrivilege",
    "SeManageVolumePrivilege",
    "SeRemoteInteractiveLogonRight",
    "SeImpersonatePrivilege",
    "SeCreateGlobalPrivilege",
    "SeIncreaseWorking",
    "SeTimeZonePrivilege",
    "SeCreateSymbolicLinkPrivilege",
    "SeDenyNetworkLogonRight", # Deny access to this computer from the network
    "SeDenyInteractiveLogonRight", # Deny logon locally
    "SeDenyBatchLogonRight", # Deny logon as a batch job
    "SeDenyServiceLogonRight", # Deny logon as a service
    "SeTcbPrivilege",
    "SeMachineAccountPrivilege",
    "SeCreateTokenPrivilege",
    "SeCreatePermanentPrivilege",
    "SeEnableDelegationPrivilege",
    "SeLockMemoryPrivilege",
    "SeSyncAgentPrivilege",
    "SeUnsolicitedInputPrivilege",
    "SeTrustedCredManAccessPrivilege",
    "SeRelabelPrivilege", # the privilege to change a Windows integrity label (new to Windows Vista)
    "SeDenyRemoteInteractiveLogonRight", # Deny logon through Terminal Services
  ].freeze

  class SecurityPolicy < Inspec.resource(1)
    name "security_policy"
    supports platform: "windows"
    desc "Use the security_policy InSpec audit resource to test security policies on the Microsoft Windows platform."
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
      Inspec::Log.debug("SecurityPolicy: Initialized with translate_sid=#{@translate_sid}")
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
      Inspec::Log.debug("SecurityPolicy: method_missing called for '#{name}'")

      if params.nil?
        Inspec::Log.debug("SecurityPolicy: params is nil for '#{name}'")
        return nil
      end

      # deep search for hash key
      params.extend Hashie::Extensions::DeepFind
      res = params.deep_find(name.to_s)
      Inspec::Log.debug("SecurityPolicy: deep_find result for '#{name}': #{res.inspect}")

      # return an empty array if configuration does not include rights configuration
      if res.nil? && MS_PRIVILEGES_RIGHTS.include?(name.to_s)
        Inspec::Log.debug("SecurityPolicy: Returning empty array for privilege '#{name}' (not found in policy but is a valid privilege)")
        return []
      end

      Inspec::Log.debug("SecurityPolicy: Returning result for '#{name}': #{res.inspect}")
      res
    end

    def to_s
      "Security Policy"
    end

    def resource_id
      "Security Policy"
    end

    private

    def read_content
      return @content if defined?(@content)

      # using process pid to prevent any race conditions with multiple runners
      export_file = "win_secpol-#{Process.pid}.cfg"
      Inspec::Log.debug("SecurityPolicy: Exporting security policy to #{export_file}")

      # export the security policy
      cmd = inspec.command("secedit /export /cfg #{export_file}")
      Inspec::Log.debug("SecurityPolicy: secedit export exit status: #{cmd.exit_status}")

      if cmd.exit_status.to_i != 0
        Inspec::Log.warn("SecurityPolicy: Failed to export security policy. Exit status: #{cmd.exit_status}, stderr: #{cmd.stderr}")
        return nil
      end

      # store file content
      cmd = inspec.command("Get-Content #{export_file}")
      Inspec::Log.debug("SecurityPolicy: Get-Content exit status: #{cmd.exit_status}")

      if cmd.exit_status.to_i != 0
        Inspec::Log.error("SecurityPolicy: Can't read security policy file. Exit status: #{cmd.exit_status}, stderr: #{cmd.stderr}")
        return skip_resource "Can't read security policy"
      end

      @content = cmd.stdout
      Inspec::Log.debug("SecurityPolicy: Successfully read security policy content (#{@content.lines.count} lines)")
      @content
    ensure
      # delete temp file
      delete_result = inspec.command("Remove-Item #{export_file}").exit_status.to_i
      Inspec::Log.debug("SecurityPolicy: Temp file cleanup exit status: #{delete_result}")
    end

    def read_params
      return @params if defined?(@params)

      if read_content.nil?
        Inspec::Log.debug("SecurityPolicy: read_content returned nil, returning empty params hash")
        return @params = {}
      end

      Inspec::Log.debug("SecurityPolicy: Parsing security policy content")
      conf = SimpleConfig.new(
        @content,
        assignment_regex: /^\s*(.*)=\s*(\S*)\s*$/
      )
      @params = convert_hash(conf.params)
      Inspec::Log.debug("SecurityPolicy: Parsed params with #{@params.keys.count} top-level keys")
      @params
    end

    # extracts the values, this methods detects:
    # numbers and SIDs and optimizes them for further usage
    def extract_value(key, val)
      Inspec::Log.debug("SecurityPolicy: Extracting value for key='#{key}', val='#{val}'")

      if val =~ /^\d+$/
        result = val.to_i
        Inspec::Log.debug("SecurityPolicy: Extracted as integer: #{result}")
        result
      # special handling for SID array
      elsif val =~ /[,]{0,1}\*\S/
        Inspec::Log.debug("SecurityPolicy: Detected SID array format, translate_sid=#{@translate_sid}")
        if @translate_sid
          result = val.split(",").map do |v|
            sid = v.sub("*S", "S")
            Inspec::Log.debug("SecurityPolicy: Translating SID: #{sid}")
            cmd = inspec.command("(New-Object System.Security.Principal.SecurityIdentifier(\"#{sid}\")).Translate( [System.Security.Principal.NTAccount]).Value")
            object_name = cmd.stdout.to_s.strip
            Inspec::Log.debug("SecurityPolicy: SID translation - input: #{sid}, output: #{object_name}, exit_status: #{cmd.exit_status}")

            if object_name.empty? || object_name.nil?
              Inspec::Log.warn("SecurityPolicy: Failed to translate SID #{sid}, using SID as-is")
              sid
            else
              object_name
            end
          end
          Inspec::Log.debug("SecurityPolicy: Translated SID array result: #{result.inspect}")
          result
        else
          result = val.split(",").map do |v|
            v.sub("*S", "S")
          end
          Inspec::Log.debug("SecurityPolicy: Raw SID array result: #{result.inspect}")
          result
        end
      # special handling for string values with "
      elsif !(m = /^\"(.*)\"$/.match(val)).nil?
        result = m[1]
        Inspec::Log.debug("SecurityPolicy: Extracted quoted string: #{result}")
        result
      # We get some values of Registry Path as MACHINE\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Setup\\RecoveryConsole\\SecurityLevel=4,0
      # which we are not going to split as there are chances that it will break if anyone is using string comparison.
      # In some cases privilege value which does not have corresponding SID it returns the values in comma seprated which breakes it for some of
      # the privileges like SeServiceLogonRight as it returns array if previlege values are SID
      elsif !key.include?("\\") && val.match(/,/)
        result = val.split(",")
        Inspec::Log.debug("SecurityPolicy: Split comma-separated value: #{result.inspect}")
        result
      else
        Inspec::Log.debug("SecurityPolicy: Using raw value: #{val}")
        val
      end
    end

    def convert_hash(hash)
      Inspec::Log.debug("SecurityPolicy: Converting hash with #{hash.keys.count} keys")
      new_hash = {}
      hash.each do |k, v|
        v.is_a?(Hash) ? value = convert_hash(v) : value = extract_value(k, v)
        new_hash[k.strip] = value
      end
      Inspec::Log.debug("SecurityPolicy: Converted hash keys: #{new_hash.keys.join(", ")}")
      new_hash
    end
  end
end
