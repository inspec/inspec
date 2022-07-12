module Inspec::Resources
  class PodmanNetwork < Inspec.resource(1)
    name "podman_network"

    supports platform: "unix"

    desc "InSpec core resource to retrive information about the given Podman network"

    example <<~EXAMPLE
      describe podman_network("podman") do
        it { should exist }
      end
      describe podman_network("3a7c94d937d5f3a0f1a9b1610589945aedfbe56207fd5d32fc8154aa1a8b007f") do
        it { should be_purple }
      end
    EXAMPLE

    def initialize(id)
      skip_resource "The `podman_network` resource is not yet available on your OS." unless inspec.os.unix?
      @id = id
      @network_info = network_info
    end

    def exist?
      false
    end

    def id
      "abc"
    end

    def name
      "abc"
    end

    def network_interface
      "abc"
    end

    def driver
      "abc"
    end

    def labels
      "abc"
    end

    def options
      {}
    end

    def ipv6_enabled
      false
    end

    def ipam_options
      {}
    end

    def dns_enabled
      false
    end

    def subnets
      []
    end

    def internal
      false
    end

    def created
      "timestamp"
    end

    def resource_id
      id || ""
    end

    # Define how you want your resource to appear in test reports. Commonly, this is just the resource name and the resource ID.
    def to_s
      "podman_network"
    end

    private

    def network_info
      # Run podman command to get nework information
    end
  end
end
