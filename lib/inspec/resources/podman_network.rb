require "inspec/resources/command"
require "inspec/utils/podman"
module Inspec::Resources
  class PodmanNetwork < Inspec.resource(1)
    include Inspec::Utils::Podman

    name "podman_network"

    supports platform: "unix"

    desc "InSpec core resource to retrive information about the given Podman network"

    example <<~EXAMPLE
      describe podman_network("podman") do
        it { should exist }
      end
      describe podman_network("3a7c94d937d5f3a0f1a9b1610589945aedfbe56207fd5d32fc8154aa1a8b007f") do
        its("driver") { should eq bridge }
      end
    EXAMPLE

    LABELS = {
      id: "ID",
      name: "Name",
      driver: "Driver",
      labels: "Labels",
      options: "Options",
      ipam_options: "IPAMOptions",
      internal: "Internal",
      created: "Created",
      ipv6_enabled: "IPv6Enabled",
      dns_enabled: "DNSEnabled",
      network_interface: "NetworkInterface",
      subnets: "Subnets",
    }.freeze

    attr_reader :param, :network_info
    def initialize(param)
      skip_resource "The `podman_network` resource is not yet available on your OS." unless inspec.os.unix?

      @param = param
      raise Inspec::Exceptions::ResourceFailed, "Podman is not running. Please make sure it is installed and running." unless podman_running?

      @network_info = get_network_info
    end

    ## This creates all the required properties methods dynamically.
    LABELS.each do |k, v|
      define_method(k) do
        network_info[k.to_s]
      end
    end

    def exist?
      !network_info.empty?
    end

    def resource_id
      id || param || ""
    end

    def to_s
      "podman_network #{resource_id}"
    end

    private

    def get_network_info
      go_template_format = generate_go_template(LABELS)
      result = inspec.command("podman network inspect #{param} --format '{#{go_template_format}}'")

      if result.exit_status == 0
        parse_command_output(result.stdout)
      elsif result.stderr =~ /network not found/
        {}
      else
        raise Inspec::Exceptions::ResourceFailed, "Unable to retrieve podman network information for #{param}.\nError message: #{result.stderr}"
      end
    end
  end
end
