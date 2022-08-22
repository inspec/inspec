require "inspec/resources/command"
require "inspec/utils/podman"

module Inspec::Resources
  class PodmanVolume < Inspec.resource(1)
    include Inspec::Utils::Podman

    name "podman_volume"
    supports platform: "unix"

    desc "InSpec core resource to retrieve information about podman volume"

    example <<~EXAMPLE
      describe podman_volume("my_volume") do
        it { should exist }
        its("name") { should eq "my_volume" }
        its("driver") { should eq "local" }
        its("mountpoint") { should eq "/var/home/core/.local/share/containers/storage/volumes/my_volume/_data" }
        its("created_at") { should eq "2022-07-14T13:21:19.965421792+05:30" }
        its("labels") { should eq({}) }
        its("scope") { should eq "local" }
        its("options") { should eq({}) }
        its("mount_count") { should eq 0 }
        its("needs_copy_up") { should eq true }
        its("needs_chown") { should eq true }
      end
    EXAMPLE

    attr_reader :volume_info, :volume_name

    def initialize(volume_name)
      skip_resource "The `podman_volume` resource is not yet available on your OS." unless inspec.os.unix?
      raise Inspec::Exceptions::ResourceFailed, "Podman is not running. Please make sure it is installed and running." unless podman_running?

      @volume_name = volume_name
      @volume_info = get_volume_info
    end

    LABELS = {
      "name" => "Name",
      "driver" => "Driver",
      "mountpoint" => "Mountpoint",
      "created_at" => "CreatedAt",
      "labels" => "Labels",
      "scope" => "Scope",
      "options" => "Options",
      "mount_count" => "MountCount",
      "needs_copy_up" => "NeedsCopyUp",
      "needs_chown" => "NeedsChown",
    }.freeze

    # This creates all the required properties methods dynamically.
    LABELS.each do |k, _|
      define_method(k) do
        volume_info[k.to_s]
      end
    end

    def exist?
      !volume_info.empty?
    end

    def resource_id
      volume_name
    end

    def to_s
      "podman_volume #{resource_id}"
    end

    private

    def get_volume_info
      json_key_label = generate_go_template(LABELS)

      inspect_volume_cmd = inspec.command("podman volume inspect #{volume_name} --format '{#{json_key_label}}'")

      if inspect_volume_cmd.exit_status == 0
        parse_command_output(inspect_volume_cmd.stdout)
      elsif inspect_volume_cmd.stderr =~ /inspecting object: no such/
        {}
      else
        raise Inspec::Exceptions::ResourceFailed, "Unable to retrieve podman volume information for #{volume_name}.\nError message: #{inspect_volume_cmd.stderr}"
      end
    end
  end
end
