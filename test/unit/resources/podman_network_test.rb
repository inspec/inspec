require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/podman_network"

describe Inspec::Resources::PodmanNetwork do
  describe "when Podman Network with given name exist" do
    let(:resource) { MockLoader.new(:unix).load_resource("podman_network", "minikube") }

    describe "exist?" do
      it "returns true" do
        _(resource.exist?).must_equal true
      end
    end

    describe "id" do
      it "returns the id of the network" do
        _(resource.id).must_equal "3a7c94d937d5f3a0f1a9b1610589945aedfbe56207fd5d32fc8154aa1a8b007f"
      end
    end

    describe "name" do
      it "returns the name of the network" do
        _(resource.name).must_equal "minikube"
      end
    end

    describe "network_interface" do
      it "returns the network_interface of the network" do
        _(resource.network_interface).must_equal "podman1"
      end
    end

    describe "driver" do
      it "returns the driver details of the network" do
        _(resource.driver).must_equal "bridge"
      end
    end

    describe "labels" do
      it "returns the labels of the network" do
        _(resource.labels).must_equal "created_by.minikube.sigs.k8s.io" => "true", "name.minikube.sigs.k8s.io" => "minikube"
      end
    end

    describe "options" do
      it "returns the options of the network" do
        assert_nil resource.options
      end
    end

    describe "ipv6_enabled" do
      it "returns the true if the ipv6 is enabled for the network" do
        _(resource.ipv6_enabled).must_equal false
      end
    end

    describe "ipam_options" do
      it "returns the ipam options values for the Network" do
        _(resource.ipam_options).must_equal "driver" => "host-local"
      end
    end

    describe "dns_enabled" do
      it "returns true if dns is enabled for the network" do
        _(resource.dns_enabled).must_equal true
      end
    end

    describe "subnets" do
      it "returns the subnet list for the network" do
        _(resource.subnets).must_equal [{ "subnet" => "192.168.49.0/24", "gateway" => "192.168.49.1" }]
      end
    end

    describe "internal" do
      it "returns true if the network is internal" do
        _(resource.internal).must_equal false
      end
    end

    describe "created" do
      it "returns the timestamp when the network was created" do
        _(resource.created).must_equal "2022-07-10T19:37:11.656610731+05:30"
      end
    end

    describe "to_s" do
      it "returns the Podman Nework resource name string" do
        _(resource.to_s).must_equal "podman_network 3a7c94d937d5f3a0f1a9b1610589945aedfbe56207fd5d32fc8154aa1a8b007f"
      end
    end

    describe "resource_id" do
      it "returns the resource id for the current resource" do
        _(resource.resource_id).must_equal "3a7c94d937d5f3a0f1a9b1610589945aedfbe56207fd5d32fc8154aa1a8b007f"
      end
    end
  end

  describe "when Podman Network with given name does not exist" do
    let(:resource) { MockLoader.new(:unix).load_resource("podman_network", "not-exist") }

    describe "exist?" do
      it "returns false" do
        _(resource.exist?).must_equal false
      end
    end

    describe "all other properties" do
      it "returns nil" do
        assert_nil resource.name
        assert_nil resource.driver
        assert_nil resource.ipv6_enabled
        assert_nil resource.dns_enabled
        assert_nil resource.options
        assert_nil resource.ipam_options
        assert_nil resource.subnets
        assert_nil resource.created
        assert_nil resource.internal
        assert_nil resource.network_interface
        assert_nil resource.labels
      end
    end
  end
end
