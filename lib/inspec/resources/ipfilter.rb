require "inspec/resources/command"
module Inspec::Resources
  class IpFilter < Inspec.resource(1)
    name "ipfilter"
    supports platform: "bsd"
    supports platform: "solaris"
    desc "Use the ipfilter InSpec audit resource to test rules that are defined for ipfilter, which maintains the IP rule set"
    example <<~EXAMPLE
      describe ipfilter do
        it { should have_rule("pass in quick on lo0 all") }
      end
    EXAMPLE

    def initialize
      # checks if the instance is either bsd or solaris
      return if (inspec.os.bsd? && !inspec.os.darwin?) || inspec.os.solaris?

      # ensures, all calls are aborted for non-supported os
      @ipfilter_cache = []
      skip_resource "The `ipfilter` resource is not supported on your OS yet."
    end

    def has_rule?(rule = nil)
      # checks if the rule is part of the ruleset
      retrieve_rules.any? { |line| line.casecmp(rule) == 0 }
    end

    def retrieve_rules
      # this would be true if the OS family was not bsd/solaris when checked in initliaze
      return @ipfilter_cache if defined?(@ipfilter_cache)

      # construct ipfstat command to read all rules
      bin = find_ipfstat_or_error
      ipfstat_cmd = "#{bin} -io"
      cmd = inspec.command(ipfstat_cmd)

      # Return empty array when command is not executed successfully
      # or there is no output since no rules are active
      return [] if cmd.exit_status.to_i != 0 || cmd.stdout == ""

      # split rules, returns array or rules
      @ipfilter_cache = cmd.stdout.split("\n").map(&:strip)
    end

    def resource_id
      "Ipfilter"
    end

    def to_s
      "Ipfilter"
    end

    private

    def find_ipfstat_or_error
      %w{/usr/sbin/ipfstat /sbin/ipfstat ipfstat}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `ipfstat`"
    end
  end
end
