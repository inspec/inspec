require "inspec/resources/command"
module Inspec::Resources
  class Lxc < Inspec.resource(1)
    name "lxc"
    # Restrict to only run on the below platforms
    supports platform: "linux"
    desc "Use the lxc InSpec audit resource to test if container exists and/or is running for linux container"
    example <<~EXAMPLE
      describe lxc("ubuntu-container") do
        it { should exist }
        it { should be_running }
        its("name") { should eq "ubuntu-container" }
        its("status") { should cmp "Running" }
        its("type") { should eq "container" }
        its("architecture") { should eq "x86_64" }
        its("pid") { should eq 1378 }
        its("created_at") { should eq "2022/08/16 12:07 UTC" }
        its("last_used_at") { should eq "2022/08/17 05:06 UTC" }
        its("resources") { should include "Disk usage" }
      end
    EXAMPLE

    attr_reader :container_info, :container_name

    # Resource initialization.
    def initialize(container_name)
      @container_name = container_name

      raise Inspec::Exceptions::ResourceSkipped, "The `lxc` resource is not supported on your OS yet." unless inspec.os.linux?

      @container_info = populate_container_info
    end

    def resource_id
      @container_name
    end

    def to_s
      "lxc #{resource_id}"
    end

    def exists?
      !@container_info.empty?
    end

    def running?
      @container_info.key?("Status") && @container_info["Status"].casecmp("Running") == 0
    end

    def name
      @container_info["Name"]
    end

    def status
      @container_info["Status"]
    end

    def type
      @container_info["Type"]
    end

    def architecture
      @container_info["Architecture"]
    end

    def pid
      @container_info["PID"]
    end

    def created_at
      @container_info["Created"]
    end

    def last_used_at
      @container_info["Last Used"]
    end

    def resources
      @container_info["Resources"]
    end

    private

    def populate_container_info
      lxc_util = find_lxc_or_error
      lxc_info_cmd = inspec.command("#{lxc_util} info #{@container_name}")

      if lxc_info_cmd.exit_status.to_i == 0
        parse_command_output(lxc_info_cmd.stdout)
      elsif lxc_info_cmd.stderr =~ /Error: Instance not found/
        {}
      else
        raise Inspec::Exceptions::ResourceFailed, "Unable to retrieve information for #{container_name}.\n#{lxc_info_cmd.stderr}"
      end
    end

    def find_lxc_or_error
      %w{/usr/sbin/lxc /sbin/lxc lxc}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `lxc`"
    end

    def parse_command_output(output)
      require "yaml" unless defined?(YAML)
      YAML.load(output)
    rescue Psych::SyntaxError => e
      warn "Could not parse the command output.\n#{e.message}"
      {}
    end
  end
end
