# If we can load the InSpec globals definition file...
require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/podman_image"

describe Inspec::Resources::PodmanImage do
  it "test podman image properties and matchers" do
    resource = MockLoader.new("unix".to_sym).load_resource("podman_image", "docker.io/library/busybox")
    _(resource.exist?).must_equal true
    _(resource.id).must_equal "3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6"
    _(resource.repo_tags).must_include "docker.io/library/busybox:latest"
    _(resource.created_at).must_equal "2022-06-08T00:39:28.175020858Z"
    _(resource.version).must_equal "20.10.12"
    _(resource.size).must_equal 1636053
    _(resource.digest).must_equal "sha256:3614ca5eacf0a3a1bcc361c939202a974b4902b9334ff36eb29ffe9011aaad83"
    _(resource.names_history).must_include "docker.io/library/busybox:latest"
    _(resource.repo_digests).must_include "docker.io/library/busybox@sha256:2c5e2045f35086c019e80c86880fd5b7c7a619878b59e3b7592711e1781df51a"
    _(resource.architecture).must_equal "arm64"
    _(resource.os).must_equal "linux"
    _(resource.virtual_size).must_equal 1636053
    _(resource.resource_id).must_equal "docker.io/library/busybox:latest"
    _(resource.to_s).must_equal "podman_image docker.io/library/busybox:latest"
  end

  it "test for a non-existing container image" do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("podman_image", "not-exist")
    _(resource.exist?).must_equal false
    assert_nil resource.repo_tags
    assert_nil resource.size
    assert_nil resource.digest
    assert_nil resource.names_history
    assert_nil resource.os
    assert_nil resource.virtual_size
    assert_nil resource.architecture
    assert_nil resource.repo_digests
  end
end
