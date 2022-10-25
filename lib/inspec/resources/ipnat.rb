require "inspec/resources/command"
module Inspec::Resources
  class IpNat < Inspec.resource(1)
    name "ipnat"
    supports platform: "bsd"
    supports platform: "solaris"
    desc "Use the ipnat InSpec audit resource to test rules that are defined for IP NAT"
    example <<~EXAMPLE
      describe ipnat do
        it { should have_rule("map net1 192.168.0.0/24 -> 0/32") }
      end
    EXAMPLE

    def initialize
      # checks if the instance is either bsd or solaris
      return if (inspec.os.bsd? && !inspec.os.darwin?) || inspec.os.solaris?

      # ensures, all calls are aborted for non-supported os
      @ipnat_cache = []
      skip_resource "The `ipnat` resource is not supported on your OS yet."
    end

    def has_rule?(rule = nil)
      # checks if the rule is part of the ruleset
      retrieve_rules.any? { |line| line.casecmp(rule) == 0 }
    end

    def retrieve_rules
      # this would be true if the OS family was not bsd/solaris when checked in initliaze
      return @ipnat_cache if defined?(@ipnat_cache)

      # construct ipnat command to show the list of current IP NAT table entry mappings
      bin = find_ipnat_or_error
      ipnat_cmd = "#{bin} -l"
      cmd = inspec.command(ipnat_cmd)

      # Return empty array when command is not executed successfully
      return [] if cmd.exit_status.to_i != 0

      # split rules, returns array or rules
      @ipnat_cache = cmd.stdout.split("\n").map(&:strip)
    end

    def resource_id
      "Ipnat"
    end

    def to_s
      "Ipnat"
    end

    private

    def find_ipnat_or_error
      %w{/usr/sbin/ipnat /sbin/ipnat ipnat}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `ipnat`"
    end
  end
end
