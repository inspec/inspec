require "inspec/resources/command"
module Inspec::Resources
  class LinuxAuditSystem < Inspec.resource(1)
    # Resource's internal name.
    name "linux_audit_system"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    supports platform: "linux"

    desc "Use the `linux_audit_system` Chef InSpec audit resource to test the configuration of linux audit system."

    example <<~EXAMPLE
      describe "linux_audit_system" do
        its("shoe_size") { should cmp 10 }
      end
      describe "linux_audit_system" do
        it { should be_purple }
      end
    EXAMPLE

    attr_reader :auditctl_utility

    # Resource initialization.
    def initialize
      skip_resource "The `linux_audit_system` resource is not yet available on your OS." unless inspec.os.linux?
      @auditctl_utility = find_auditctl_or_error
    end

    # Resource appearance in test reports.
    def to_s
      "linux_audit_system"
    end

    def enabled?
      auditctl_cmd = inspec.command("#{auditctl_utility} -s | grep enabled")

      raise Inspec::Exceptions::ResourceFailed, "Executing #{auditctl_utility} -s | grep enabled failed: #{auditctl_cmd.stderr}" if auditctl_cmd.exit_status.to_i != 0

      auditctl_enabled_status = auditctl_cmd.stdout.strip.split
      auditctl_enabled_status[1].to_i == 1
    end

    def running?
      true
    end

    def rules
      "some_value"
    end

    private

    # Method to help the resource's matchers and property
    def find_auditctl_or_error
      %w{/usr/sbin/auditctl /sbin/auditctl auditctl}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `auditctl`. This resource requires `auditctl` utility to be available on the system."
    end
  end
end
