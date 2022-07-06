require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/podman_container"

describe Inspec::Resources::PodmanContainer do
  it "check container parsing" do
    resource = load_resource("podman_container", "sweet_mendeleev")
    _(resource.exist?).must_equal true
    _(resource.command).must_equal "/bin/bash"
    _(resource.status).must_equal "Up 13 hours ago"
    _(resource.running?).must_equal true
    _(resource.labels).must_include("maintainer" => "NGINX Docker Maintainers <docker-maint@nginx.com>")
    _(resource.image).must_equal "docker.io/library/nginx:latest"
    _(resource.ports).must_equal ""
  end

  it "prints as a podman resource" do
    resource = load_resource("podman_container", "sweet_mendeleev")
    _(resource.to_s).must_equal "Podman Container sweet_mendeleev"
  end

  it "prints the resource id of the current resource" do
    resource = load_resource("podman_container", "sweet_mendeleev")
    _(resource.resource_id).must_equal "591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7"
  end

  it "skips the resource for unsupported platform" do
    resource = MockLoader.new(:mock).load_resource("podman_container", "sweet_mendeleev")
    _(resource.resource_skipped?).must_equal true
  end
end
