require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/podman_pod"

describe Inspec::Resources::PodmanPod do
  it "checks podman pod parameter and works correctly" do
    resource = MockLoader.new("unix".to_sym).load_resource("podman_pod", "nginx-frontend")
    _(resource.exist?).must_equal true
    _(resource.id).must_equal "fcfe4d471cfface0d1b39bce23af7d31ab8736cd68c0360ade0b4afe364f79d4"
    _(resource.name).must_equal "nginx-frontend"
    _(resource.created_at).must_equal "2022-07-14T15:47:47.978078124+05:30"
    _(resource.create_command).must_include "new:nginx-frontend"
    _(resource.create_command).must_include "podman"
    _(resource.state).must_equal "Running"
    _(resource.hostname).must_equal ""
    _(resource.create_cgroup).must_equal true
    _(resource.cgroup_parent).must_equal "user.slice"
    _(resource.cgroup_path).must_equal "user.slice/user-libpod_pod_fcfe4d471cfface0d1b39bce23af7d31ab8736cd68c0360ade0b4afe364f79d4.slice"
    _(resource.create_infra).must_equal true
    _(resource.infra_container_id).must_equal "727538044b32a165934729dc2d47d9d5e981b6496aebfad7de470f7e76ea4251"
    _(resource.infra_config).must_include "DNSOption"
    _(resource.shared_namespaces).must_include "net"
    _(resource.shared_namespaces).must_include "ipc"
    _(resource.num_containers).must_equal 2
    _(resource.containers).must_be_kind_of Array
    _(resource.resource_id).must_equal "nginx-frontend"
    _(resource.to_s).must_equal "Podman Pod nginx-frontend"
  end

  it "checks for a non-existing podman pod" do
    resource = MockLoader.new("unix".to_sym).load_resource("podman_pod", "non_existing_pod")
    _(resource.exist?).must_equal false
    assert_nil resource.name
    assert_nil resource.created_at
    assert_nil resource.create_command
    assert_nil resource.state
    assert_nil resource.hostname
    assert_nil resource.create_cgroup
    assert_nil resource.cgroup_parent
    assert_nil resource.cgroup_path
    assert_nil resource.create_infra
    assert_nil resource.infra_container_id
    assert_nil resource.infra_config
    assert_nil resource.shared_namespaces
    assert_nil resource.num_containers
    assert_nil resource.containers
    _(resource.resource_id).must_equal "non_existing_pod"
    _(resource.to_s).must_equal "Podman Pod non_existing_pod"
  end
end
