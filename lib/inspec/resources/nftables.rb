require "inspec/resources/command"
require "json" unless defined?(JSON)

# @see https://wiki.nftables.org/
# @see https://www.netfilter.org/projects/nftables/manpage.html

# rubocop:disable Style/ClassVars

module Inspec::Resources
  class NfTables < Inspec.resource(1)
    name "nftables"
    supports platform: "linux"
    desc "Use the nftables InSpec audit resource to test rules and sets that are defined in nftables, which maintains tables of IP packet filtering rules. There may be more than one table. Each table contains one (or more) chains. A chain is a list of rules that match packets. When the rule matches, the rule defines what target to assign to the packet."
    example <<~EXAMPLE
      describe nftables(family:'inet', table:'filter', chain: 'INPUT') do
        its('type') { should eq 'filter' }
        its('hook') { should eq 'input' }
        its('prio') { should eq 0 } # filter
        its('policy') { should eq 'drop' }
        it { should have_rule('tcp dport { 22, 80, 443 } accept') }
      end
    describe nftables(family: 'inet', table: 'filter', set: 'OPEN_PORTS') do
      its('type') { should eq 'ipv4_addr . inet_proto . inet_service' }
      its('flags') { should include 'interval' }
      it { should have_element('1.1.1.1 . tcp . 25-27') }
    end
    EXAMPLE

    @@bin = nil
    @@nft_params = {}
    @@nft_params["json"] = ""
    @@nft_params["stateless"] = ""
    @@nft_params["num"] = ""

    def initialize(params = {})
      @family = params[:family] || nil
      @table = params[:table] || nil
      @chain = params[:chain] || nil
      @set = params[:set] || nil
      @ignore_comments = params[:ignore_comments] || false
      unless @@bin
        @@bin = find_nftables_or_error
      end

      # Some old versions of `nft` do not support JSON output or stateless modifier
      res = inspec.command("#{@@bin} --version").stdout
      version = Gem::Version.new(/^nftables v(\S+) .*/.match(res)[1])
      case
      when version < Gem::Version.new("0.8.0")
        @@nft_params["num"] = "-nn"
      when version < Gem::Version.new("0.9.0")
        @@nft_params["stateless"] = "-s"
        @@nft_params["num"] = "-nn"
      when version < Gem::Version.new("0.9.3")
        @@nft_params["json"] = "-j"
        @@nft_params["stateless"] = "-s"
        @@nft_params["num"] = "-nn"
      when version >= Gem::Version.new("0.9.3")
        @@nft_params["json"] = "-j"
        @@nft_params["stateless"] = "-s"
        @@nft_params["num"] = "-y"
        ## --terse
      end

      # family and table attributes are mandatory
      fail_resource "nftables family and table are mandatory." if @family.nil? || @family.empty? || @table.nil? || @table.empty?
      # chain name or set name has to be specified and are mutually exclusive
      fail_resource "You must specify either a chain or a set name." if (@chain.nil? || @chain.empty?) && (@set.nil? || @set.empty?)
      fail_resource "You must specify either a chain or a set name, not both." if !(@chain.nil? || @chain.empty?) && !(@set.nil? || @set.empty?)

      # we're done if we are on linux
      return if inspec.os.linux?

      # ensures, all calls are aborted for non-supported os
      @nftables_cache = {}
      skip_resource "The `nftables` resource is not supported on your OS yet."
    end

    # Let's have a generic method to retrieve attributes for chains and sets
    def _get_attr(name)
      # Some attributes are valid for chains only, for sets only or for both
      valid = {
        "chains" => %w{hook policy prio type},
        "sets" => %w{flags size type},
      }

      target_obj = @set.nil? ? "chains" : "sets"

      if valid[target_obj].include?(name)
        attrs = @set.nil? ? retrieve_chain_attrs : retrieve_set_attrs
      else
        raise Inspec::Exceptions::ResourceSkipped, "`#{name}` attribute is not valid for #{target_obj}"
      end
      # flags attribute is an array, if not retrieved ensure we return an empty array
      # otherwise return an empty string
      default = name == "flags" ? [] : ""
      val = attrs.key?(name) ? attrs[name] : default
      # When set type is has multiple data types it's retrieved as an array, make humans life easier
      # by returning a string representation
      if name == "type" && target_obj == "sets" && val.is_a?(Array)
        return val.join(" . ")
      end

      val
    end

    # Create a method for each attribute
    %i{flags hook policy prio size type}.each do |attr_method|
      define_method attr_method do
        _get_attr(attr_method.to_s)
      end
    end

    def has_rule?(rule = nil, _family = nil, _table = nil, _chain = nil)
      # checks if the rule is part of the chain
      # for now, we expect an exact match
      retrieve_chain_rules.any? { |line| line.casecmp(rule) == 0 }
    end

    def has_element?(element = nil, _family = nil, _table = nil, _chain = nil)
      # checks if the element is part of the set
      # for now, we expect an exact match
      retrieve_set_elements.any? { |line| line.casecmp(element) == 0 }
    end

    def retrieve_set_elements
      idx = "set_#{@family}_#{@table}_#{@set}"
      return @nftables_cache[idx] if defined?(@nftables_cache) && @nftables_cache.key?(idx)

      @nftables_cache = {} unless defined?(@nftables_cache)

      elem_cmd = "list set #{@family} #{@table} #{@set}"
      nftables_cmd = format("%s %s %s", @@bin, @@nft_params["stateless"], elem_cmd).strip

      cmd = inspec.command(nftables_cmd)
      return [] if cmd.exit_status.to_i != 0

      @nftables_cache[idx] = cmd.stdout.gsub("\t", "").split("\n").reject { |line| line =~ /^(table|set|type|size|flags|typeof|auto-merge)/ || line =~ /^}$/ }.map { |line| line.sub("elements = {", "").sub("}", "").split(",") }.flatten.map(&:strip)
    end

    def retrieve_chain_rules
      idx = "rule_#{@family}_#{@table}_#{@chain}"
      return @nftables_cache[idx] if defined?(@nftables_cache) && @nftables_cache.key?(idx)

      @nftables_cache = {} unless defined?(@nftables_cache)

      # construct nftables command to read all rules of the given chain
      chain_cmd = "list chain #{@family} #{@table} #{@chain}"
      nftables_cmd = format("%s %s %s %s", @@bin, @@nft_params["stateless"], @@nft_params["num"], chain_cmd).strip

      cmd = inspec.command(nftables_cmd)
      return [] if cmd.exit_status.to_i != 0

      rules = cmd.stdout.gsub("\t", "").split("\n").reject { |line| line =~ /^(table|chain)/ || line =~ /^}$/ }

      if @ignore_comments
        # split rules, returns array or rules without any comment
        @nftables_cache[idx] = remove_comments_from_rules(rules)
      else
        # split rules, returns array or rules
        @nftables_cache[idx] = rules.map(&:strip)
      end
    end

    def retrieve_chain_attrs
      idx = "chain_attrs_#{@family}_#{@table}_#{@chain}"
      return @nftables_cache[idx] if defined?(@nftables_cache) && @nftables_cache.key?(idx)

      @nftables_cache = {} unless defined?(@nftables_cache)

      chain_cmd = "list chain #{@family} #{@table} #{@chain}"
      nftables_cmd = format("%s %s %s %s", @@bin, @@nft_params["stateless"], @@nft_params["json"], chain_cmd).strip

      cmd = inspec.command(nftables_cmd)
      return {} if cmd.exit_status.to_i != 0

      if @@nft_params["json"].empty?
        res = cmd.stdout.gsub("\t", "").split("\n").select { |line| line =~ /^type/ }[0]
        parsed = /type (\S+) hook (\S+) priority (\S+); policy (\S+);/.match(res)
        @nftables_cache[idx] = { "type" => parsed[1], "hook" => parsed[2], "prio" => parsed[3].to_i, "policy" => parsed[4] }
      else
        @nftables_cache[idx] = JSON.parse(cmd.stdout)["nftables"].select { |line| line.key?("chain") }[0]["chain"]
      end
    end

    def retrieve_set_attrs
      idx = "set_attrs_#{@family}_#{@table}_#{@chain}"
      return @nftables_cache[idx] if defined?(@nftables_cache) && @nftables_cache.key?(idx)

      @nftables_cache = {} unless defined?(@nftables_cache)

      chain_cmd = "list set #{@family} #{@table} #{@set}"
      nftables_cmd = format("%s %s %s %s", @@bin, @@nft_params["stateless"], @@nft_params["json"], chain_cmd).strip

      cmd = inspec.command(nftables_cmd)
      return {} if cmd.exit_status.to_i != 0

      if @@nft_params["json"].empty?
        type = ""
        size = 0
        flags = []
        res = cmd.stdout.gsub("\t", "").split("\n").select { |line| line =~ /^(type|size|flags)/ }
        res.each do |line|
          parsed = /^type (.*)/.match(line)
          if parsed
            type = parsed[1]
          end
          parsed = /^flags (.*)/.match(line)
          if parsed
            flags = parsed[1].split(",")
          end
          parsed = /^size (.*)/.match(line)
          if parsed
            size = parsed[1].to_i
          end
        end
        @nftables_cache[idx] = { "type" => type, "size" => size, "flags" => flags }
      else
        @nftables_cache[idx] = JSON.parse(cmd.stdout)["nftables"].select { |line| line.key?("set") }[0]["set"]
      end
    end

    def resource_id
      to_s || "nftables"
    end

    def to_s
      format("nftables (%s %s %s %s)", @family && "family: #{@family}", @table && "table: #{@table}", @chain && "chain: #{@chain}", @set && "set: #{@set}").strip
    end

    private

    def remove_comments_from_rules(rules)
      rules.each do |rule|
        next if rule.nil?

        rule.gsub!(/ comment "([^"]*)"/, "")
        rule.strip
      end
      rules
    end

    def find_nftables_or_error
      %w{/usr/sbin/nft /sbin/nft nft}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `nft`"
    end
  end
end
