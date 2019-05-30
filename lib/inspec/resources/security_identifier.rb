# frozen_string_literal: true

require 'inspec/resources/command'

module Inspec::Resources
  class SecurityIdentifier < Inspec.resource(1)
    name 'security_identifier'
    supports platform: 'windows'
    desc 'Resource that returns a Security Identifier for a given entity name in Windows.'
    example <<~EXAMPLE
      describe security_identifier(group: 'Everyone') do
        it { should exist }
        its('sid') { should eq 'S-1-1-0' }
      end
    EXAMPLE

    def initialize(opts = {})
      supported_opt_keys = [:user, :group, :unspecified]
      raise ArgumentError, "Invalid security_identifier param '#{opts}'. Please pass a hash with these supported keys: #{supported_opt_keys}" unless opts.respond_to?(:keys)
      raise ArgumentError, "Unsupported security_identifier options '#{opts.keys - supported_opt_keys}'. Supported keys: #[supported_opt_keys]" unless (opts.keys - supported_opt_keys).empty?
      raise ArgumentError, 'Specifying more than one of :user :group or :unspecified for security_identifier is not supported' unless opts.keys && (opts.keys & supported_opt_keys).length == 1
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
      raise ArgumentError, 'Specify one of :user :group or :unspecified for security_identifier' unless @name
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

    private

    def fetch_sids
      @sids = {}
      case @type
      when :group
        sid_data = wmi_results(:group)
      when :user
        sid_data = wmi_results(:user)
      when :unspecified
        # try group first, then user
        sid_data = wmi_results(:group)
        if sid_data.empty?
          sid_data = wmi_results(:user)
        end
      else
        raise "Unhandled entity type '#{@type}'"
      end
      sid_data.each { |sid| @sids[sid[1]] = sid[2] }
    end

    def wmi_results(type)
      query = 'wmic '
      case type
      when :group
        query += 'group'
      when :user
        query += 'useraccount'
      end
      query += " where 'Name=\"#{@name}\"' get Name\",\"SID /format:csv"
      # Example output:
      #     inspec> command("wmic useraccount where 'Name=\"Administrator\"' get Name\",\"SID /format:csv").stdout
      #     => "\r\n\r\nNode,Name,SID\r\n\r\nComputer1,Administrator,S-1-5-21-650485088-1194226989-968533923-500\r\n\r\n"
      # Remove the \r characters, split on \n\n, ignore the CSV header row
      inspec.command(query).stdout.strip.tr("\r", '').split("\n\n")[1..-1].map { |entry| entry.split(',') }
    end
  end
end
