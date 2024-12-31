require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/podman_volume"

describe Inspec::Resources::PodmanVolume do
  it "checks podman volume parameter and works correctly" do
    resource = MockLoader.new("unix".to_sym).load_resource("podman_volume", "my_volume")
    _(resource.exist?).must_equal true
    _(resource.name).must_equal "my_volume"
    _(resource.driver).must_equal "local"
    _(resource.mountpoint).must_equal "/var/home/core/.local/share/containers/storage/volumes/my_volume/_data"
    _(resource.created_at).must_equal "2022-07-14T13:21:19.965421792+05:30"
    _(resource.labels).must_equal({})
    _(resource.scope).must_equal "local"
    _(resource.options).must_equal({})
    _(resource.mount_count).must_equal 0
    _(resource.needs_copy_up).must_equal true
    _(resource.needs_chown).must_equal true
    _(resource.resource_id).must_equal "my_volume"
    _(resource.to_s).must_equal "podman_volume my_volume"
  end

  it "checks for a non-existing podman volume" do
    resource = MockLoader.new("unix".to_sym).load_resource("podman_volume", "non_existing_volume")
    _(resource.exist?).must_equal false
    assert_nil resource.name
    assert_nil resource.driver
    assert_nil resource.mountpoint
    assert_nil resource.created_at
    assert_nil resource.labels
    assert_nil resource.scope
    assert_nil resource.options
    assert_nil resource.mount_count
    assert_nil resource.needs_copy_up
    assert_nil resource.needs_chown
    _(resource.resource_id).must_equal "non_existing_volume"
    _(resource.to_s).must_equal "podman_volume non_existing_volume"
  end
end

