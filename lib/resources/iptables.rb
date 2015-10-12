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
class IpTables < Vulcano.resource(1)
  name 'iptables'

  def initialize(params = {})
    @table = params[:table] || nil
    @chain = params[:chain] || nil

    # we're done if we are on linux
    return if vulcano.os.linux?

    # ensures, all calls are aborted for non-supported os
    @iptables_cache = []
    skip_resource 'The `iptables` resource is not supported on your OS yet.'
  end

  def has_rule?(rule = nil, _table = nil, _chain = nil)
    found = false
    retrieve_rules.each { |line|
      # checks if the rule is part of the ruleset
      # for now, we expect an excact match
      found = true if line.downcase == rule.downcase
    }
    found
  end

  def retrieve_rules
    return @iptables_cache if defined?(@iptables_cache)

    # construct iptables command to read all rules
    @table.nil? ? table_cmd = '' : table_cmd = " -t #{@table} "
    @chain.nil? ? chain_cmd = '' : chain_cmd = " #{@chain}"
    cmd = vulcano.command(format('iptables %s -S %s', table_cmd, chain_cmd).strip)
    return [] if cmd.exit_status.to_i != 0

    # split rules, returns array or rules
    @iptables_cache = cmd.stdout.chomp.split("\n")
  end

  def to_s
    format('iptables %s %s', @table.nil? ? '' : "table: #{@table}", @chain.nil? ? '' : "chain: #{@chain}").strip
  end
end
