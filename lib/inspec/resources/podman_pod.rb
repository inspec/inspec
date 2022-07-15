require "inspec/resources/command"
require "inspec/utils/podman"

module Inspec::Resources
  class PodmanPod < Inspec.resource(1)
    include Inspec::Utils::Podman

    name "podman_pod"
    supports platform: "unix"

    desc "InSpec core resource to retrieve information about podman pod"

    example <<~EXAMPLE
      describe podman_pod("nginx-frontend") do
        it { should exist }
        its("id") { should eq "fcfe4d471cfface0d1b39bce23af7d31ab8736cd68c0360ade0b4afe364f79d4" }
        its("name") { should eq "nginx-frontend" }
        its("created_at") { should eq "2022-07-14T15:47:47.978078124+05:30" }
        its("create_command") { should include "new:nginx-frontend" }
        its("state") { should eq "Running" }
        its("hostname") { should eq "" }
        its("create_cgroup") { should eq true }
        its("cgroup_parent") { should eq "user.slice" }
        its("cgroup_path") { should eq "user.slice/user-libpod_pod_fcfe4d471cfface0d1b39bce23af7d31ab8736cd68c0360ade0b4afe364f79d4.slice" }
        its("create_infra") { should eq true }
        its("infra_container_id") { should eq "727538044b32a165934729dc2d47d9d5e981b6496aebfad7de470f7e76ea4251" }
        its("infra_config") { should include "DNSOption" }
        its("shared_namespaces") { should include "ipc" }
        its("num_containers") { should eq 2 }
        its("containers") { should_not be nil }
      end

      describe podman_pod("non-existing-pod") do
        it { should_not exist }
      end
    EXAMPLE

    attr_reader :pod_info, :pod_id

    def initialize(pod_id)
      skip_resource "The `podman_pod` resource is not yet available on your OS." unless inspec.os.unix?
      raise Inspec::Exceptions::ResourceFailed, "Podman is not running. Please make sure it is installed and running." unless podman_running?

      @pod_id = pod_id
      @pod_info = get_pod_info
    end

    LABELS = {
      "id" => "ID",
      "name" => "Name",
      "created_at" => "Created",
      "create_command" => "CreateCommand",
      "state" => "State",
      "hostname" => "Hostname",
      "create_cgroup" => "CreateCgroup",
      "cgroup_parent" => "CgroupParent",
      "cgroup_path" => "CgroupPath",
      "create_infra" => "CreateInfra",
      "infra_container_id" => "InfraContainerID",
      "infra_config" => "InfraConfig",
      "shared_namespaces" => "SharedNamespaces",
      "num_containers" => "NumContainers",
      "containers" => "Containers",
    }.freeze

    # This creates all the required properties methods dynamically.
    LABELS.each do |k, _|
      define_method(k) do
        pod_info[k.to_s]
      end
    end

    def exist?
      !pod_info.empty?
    end

    def resource_id
      pod_id
    end

    def to_s
      "Podman Pod #{resource_id}"
    end

    private

    def get_pod_info
      json_key_label = generate_go_template(LABELS)

      inspect_pod_cmd = inspec.command("podman pod inspect #{pod_id} --format '{#{json_key_label}}'")

      if inspect_pod_cmd.exit_status == 0
        parse_command_output(inspect_pod_cmd.stdout)
      elsif inspect_pod_cmd.stderr =~ /no pod with name or ID/
        {}
      else
        raise Inspec::Exceptions::ResourceFailed, "Unable to retrieve podman pod information for #{pod_id}.\nError message: #{inspect_pod_cmd.stderr}"
      end
    end
  end
end
