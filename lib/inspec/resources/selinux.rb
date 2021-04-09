require "inspec/resources/command"

module Inspec::Resources
  class Selinux < Inspec.resource(1)
    name "selinux"
    supports platform: "linux"

    desc "Use selinux Inspec resource to test state/mode of the selinux policy."

    example <<~EXAMPLE
      describe selinux do
        it { should be_installed }
        it { should be_disabled }
        it { should be_permissive }
        it { should be_enforcing }
      end
    EXAMPLE

    def initialize(selinux_path = "/etc/selinux/config")
      @path = selinux_path
      cmd = inspec.command("sestatus")

      if cmd.exit_status != 0
        return skip_resource "#{cmd.stderr}"
      end

      result = cmd.stdout.delete(" ").gsub(/\n/, ",").gsub(/\r/, "").downcase
      @data = Hash[result.scan(/([^:]+):([^,]+)[,$]/)]

      return if inspec.os.linux?

      @data = []
      skip_resource "The 'selinux' resource is not supported non linux OS."
    end

    def installed?
      inspec.file(@path).exist?
    end

    def disabled?
      @data["selinuxstatus"] == "disabled" unless @data.empty?
    end

    def enforcing?
      @data["currentmode"] == "enforcing" unless @data.empty?
    end

    def permissive?
      @data["currentmode"] == "permissive" unless @data.empty?
    end

    def to_s
      "SELinux"
    end
  end
end
