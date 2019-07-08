require "inspec/resources/command"

# Usage:
# describe ip6tables do
#   it { should have_rule('-P INPUT ACCEPT') }
# end
#
# The following serverspec sytax is not implemented:
# describe ip6tables do
#   it { should have_rule('-P INPUT ACCEPT').with_table('mangle').with_chain('INPUT') }
# end
# Please use the new sytax:
# describe ip6tables(table:'mangle', chain: 'input') do
#   it { should have_rule('-P INPUT ACCEPT') }
# end
#
# Note: Docker containers normally do not have ip6tables installed
#
# @see http://ipset.netfilter.org/ip6tables.man.html
# @see http://ipset.netfilter.org/ip6tables.man.html
module Inspec::Resources
  class Ip6Tables < Inspec.resource(1)
    name "ip6tables"
    supports platform: "linux"
    desc "Use the ip6tables InSpec audit resource to test rules that are defined in ip6tables, which maintains tables of IP packet filtering rules. There may be more than one table. Each table contains one (or more) chains (both built-in and custom). A chain is a list of rules that match packets. When the rule matches, the rule defines what target to assign to the packet."
    example <<~EXAMPLE
      describe ip6tables do
        it { should have_rule('-P INPUT ACCEPT') }
      end
    EXAMPLE

    def initialize(params = {})
      @table = params[:table]
      @chain = params[:chain]

      # we're done if we are on linux
      return if inspec.os.linux?

      # ensures, all calls are aborted for non-supported os
      @ip6tables_cache = []
      skip_resource "The `ip6tables` resource is not supported on your OS yet."
    end

    def has_rule?(rule = nil, _table = nil, _chain = nil)
      # checks if the rule is part of the ruleset
      # for now, we expect an exact match
      retrieve_rules.any? { |line| line.casecmp(rule) == 0 }
    end

    def retrieve_rules
      return @ip6tables_cache if defined?(@ip6tables_cache)

      # construct ip6tables command to read all rules
      bin = find_ip6tables_or_error
      table_cmd = "-t #{@table}" if @table
      ip6tables_cmd = format("%s %s -S %s", bin, table_cmd, @chain).strip

      cmd = inspec.command(ip6tables_cmd)
      return [] if cmd.exit_status.to_i != 0

      # split rules, returns array or rules
      @ip6tables_cache = cmd.stdout.split("\n").map(&:strip)
    end

    def to_s
      format("Ip6tables %s %s", @table && "table: #{@table}", @chain && "chain: #{@chain}").strip
    end

    private

    def find_ip6tables_or_error
      %w{/usr/sbin/ip6tables /sbin/ip6tables ip6tables}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `ip6tables`"
    end
  end
end
