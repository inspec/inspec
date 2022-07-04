require "helper"
require "inspec/resource"
require "inspec/resources/podman_container"

describe Inspec::Resources::PodmanContainer do
  it "check container parsing" do
    resource = load_resource("podman_container", "sweet_mendeleev")
    _(resource.exist?).must_equal true
    _(resource.command).must_equal "/bin/bash"
    _(resource.status).must_equal "Created"
    _(resource.ports).must_equal nil
    _(resource.running?).must_equal false
    _(resource.labels).must_include("maintainer" => "NGINX Docker Maintainers <docker-maint@nginx.com>")
    _(resource.image).must_equal "docker.io/library/nginx:latest"
  end

  it "prints as a podman resource" do
    resource = load_resource("podman_container", "sweet_mendeleev")
    _(resource.to_s).must_equal "Podman Container sweet_mendeleev"
  end

  it "prints the resource id of the current resource" do
    resource = load_resource("podman_container", "sweet_mendeleev")
    _(resource.resource_id).must_equal "591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7"
  end
end
