# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Usage:
# describe iptables do
#   it { should have_rule('-P INPUT ACCEPT') }
# end
#
# The following serverspec sytax is not implemented:
# describe iptables do
#   it { should have_rule('-P INPUT ACCEPT').with_table('mangle').with_chain('INPUT') }
# end
# Please use the new sytax:
# describe iptables(table:'mangle', chain: 'input') do
#   it { should have_rule('-P INPUT ACCEPT') }
# end
#
# Note: Docker containers normally do not have iptables installed
#
# @see http://ipset.netfilter.org/iptables.man.html
# @see http://ipset.netfilter.org/iptables.man.html
# @see https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html
module Inspec::Resources
  class IpTables < Inspec.resource(1)
    name 'iptables'
    desc 'Use the iptables InSpec audit resource to test rules that are defined in iptables, which maintains tables of IP packet filtering rules. There may be more than one table. Each table contains one (or more) chains (both built-in and custom). A chain is a list of rules that match packets. When the rule matches, the rule defines what target to assign to the packet.'
    example "
      describe iptables do
        it { should have_rule('-P INPUT ACCEPT') }
      end
    "

    def initialize(params = {})
      @table = params[:table]
      @chain = params[:chain]

      # we're done if we are on linux
      return if inspec.os.linux?

      # ensures, all calls are aborted for non-supported os
      @iptables_cache = []
      skip_resource 'The `iptables` resource is not supported on your OS yet.'
    end

    def has_rule?(rule = nil, _table = nil, _chain = nil)
      # checks if the rule is part of the ruleset
      # for now, we expect an exact match
      retrieve_rules.any? { |line| line.casecmp(rule) == 0 }
    end

    def retrieve_rules
      return @iptables_cache if defined?(@iptables_cache)

      # construct iptables command to read all rules
      table_cmd = "-t #{@table}" if @table
      iptables_cmd = format('iptables %s -S %s', table_cmd, @chain).strip

      cmd = inspec.command(iptables_cmd)
      return [] if cmd.exit_status.to_i != 0

      # split rules, returns array or rules
      @iptables_cache = cmd.stdout.split("\n").map(&:strip)
    end

    def to_s
      format('Iptables %s %s', @table && "table: #{@table}", @chain && "chain: #{@chain}").strip
    end
  end
end
