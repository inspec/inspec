# frozen_string_literal: true

require "inspec/resources/command"

module Inspec::Resources
  class SecurityIdentifier < Inspec.resource(1)
    name "security_identifier"
    supports platform: "windows"
    desc "Resource that returns a Security Identifier for a given entity name in Windows."
    example <<~EXAMPLE
      describe security_identifier(group: 'Everyone') do
        it { should exist }
        its('sid') { should eq 'S-1-1-0' }
      end
    EXAMPLE

    def initialize(opts = {})
      supported_opt_keys = %i{user group unspecified}
      raise ArgumentError, "Invalid security_identifier param '#{opts}'. Please pass a hash with these supported keys: #{supported_opt_keys}" unless opts.respond_to?(:keys)
      raise ArgumentError, "Unsupported security_identifier options '#{opts.keys - supported_opt_keys}'. Supported keys: #[supported_opt_keys]" unless (opts.keys - supported_opt_keys).empty?
      raise ArgumentError, "Specifying more than one of :user :group or :unspecified for security_identifier is not supported" unless opts.keys && (opts.keys & supported_opt_keys).length == 1

      if opts[:user]
        @type = :user
        @name = opts[:user]
      end
      if opts[:group]
        @type = :group
        @name = opts[:group]
      end
      if opts[:unspecified]
        @type = :unspecified
        @name = opts[:unspecified]
      end
      raise ArgumentError, "Specify one of :user :group or :unspecified for security_identifier" unless @name

      @sids = nil
    end

    def sid
      fetch_sids unless @sids
      @sids[@name] # nil if not found
    end

    def exist?
      fetch_sids unless @sids
      @sids.key?(@name)
    end

    def to_s
      "Security Identifier"
    end

    private

    def fetch_sids
      @sids = {}
      case @type
      when :group
        sid_data = cim_results(:group)
      when :user
        sid_data = cim_results(:user)
      when :unspecified
        # try group first, then user
        sid_data = cim_results(:group)
        if sid_data.empty?
          sid_data = cim_results(:user)
        end
      else
        raise "Unhandled entity type '#{@type}'"
      end
      sid_data.each { |sid| @sids[sid[1]] = sid[2] }
    end

    def cim_results(type)
      case type
      when :group
        cmd = "Get-CimInstance -ClassName Win32_Account | Select-Object -Property Domain, Name, SID | Where-Object { $_.Name -eq '#{@name}' -and { $_.SIDType -eq 4 -or $_.SIDType -eq 5 } } | ConvertTo-Csv -NoTypeInformation"
      when :user
        cmd = "Get-CimInstance -ClassName Win32_Account | Select-Object -Property Domain, Name, SID, SIDType | Where-Object { $_.Name -eq '#{@name}' -and $_.SIDType -eq 1 } | ConvertTo-Csv -NoTypeInformation"
      end
      inspec.command(cmd).stdout.strip.gsub("\"", "").tr("\r", "").split("\n")[1..-1].map { |entry| entry.split(",") }
    end
  end
end
