# If we can load the InSpec globals definition file...
require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/podman_image"

describe Inspec::Resources::PodmanImage do
  it "test podman image properties and matchers" do
    resource = MockLoader.new("unix".to_sym).load_resource("podman_image", "docker.io/library/nginx")
    _(resource.exist?).must_equal true
    _(resource.id).must_equal "sha256:55f4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb"
    _(resource.tag).must_equal "latest"
    _(resource.image).must_equal "docker.io/library/nginx:latest"
    _(resource.repo).must_equal "docker.io/library/nginx"
    _(resource.resource_id).must_equal "sha256:55f4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb"
  end
end
