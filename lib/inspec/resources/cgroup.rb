require "inspec/resources/command"
module Inspec::Resources
  class Cgroup < Inspec.resource(1)
    name "cgroup"
    # Restrict to only run on the below platform
    supports platform: "linux"
    desc "Use the cgroup InSpec audit resource to test cgroup subsytem's parameters."

    example <<~EXAMPLE
      describe cgroup("foo") do
        its("cpuset.cpus") { should eq 0 }
        its("memory.limit_in_bytes") { should eq 499712 }
      end
      describe cgroup("bar") do
        its("cpuset.cpus") { should eq 1 }
        its("memory.limit_in_bytes") { should be <= 500000 }
      end
    EXAMPLE

    # Resource initialization.
    def initialize(cgroup_name)
      @cgroup_name = cgroup_name
      @subsystem_unassigned = true
      @subsystem = ""
      @subsystem_params = ""
      return if inspec.os.linux?

      @unsupported_os = true
      skip_resource "The `cgroup` resource is not supported on your OS yet."
    end

    def resource_id
      @cgroup_name
    end

    def to_s
      "cgroup #{resource_id}"
    end

    def method_missing(param)
      return skip_resource "The `cgroup` resource is not supported on your OS yet." if @unsupported_os

      if @subsystem_unassigned
        @subsystem = param.to_s
        @subsystem_unassigned = false
        self
      else
        @subsystem_unassigned = true
        @subsystem_params = param.to_s
        find_cgroup_info
      end

    end

    private

    # Method to find cgget
    def find_cgget_or_error
      %w{/usr/sbin/cgget /sbin/cgget cgget}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `cgget`"
    end

    def find_cgroup_info
      bin = find_cgget_or_error
      cgget_cmd = format("%s -n -r %s.%s %s | awk '{print $2}'", bin, @subsystem, @subsystem_params, @cgroup_name).strip
      cmd = inspec.command(cgget_cmd)
      return nil if cmd.exit_status.to_i != 0 || cmd.stdout == ""

      param_value = cmd.stdout.strip
      param_value.match(/^\d+$/) ? param_value.to_i : param_value
    end
  end
end
