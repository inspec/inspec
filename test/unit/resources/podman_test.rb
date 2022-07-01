require "helper"
require "inspec/resource"
require "inspec/resources/podman"

describe Inspec::Resources::Podman do
  let(:resource) { load_resource("podman") }

  it "prints as a Podman resource" do
    _(resource.to_s).must_equal "Podman"
  end

  it "prints as Podman Containers resource" do
    _(resource.containers.to_s).must_equal "Podman Containers"
  end

  it "prints the resource id of current resource" do
    _(resource.containers.resource_id).must_equal "Podman Containers"
  end

  it "returns the parsed details of Podman containers" do
    _(resource.containers.ids).must_equal %w{591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7 64b5562346d6b52fd40d790b34e9f18ba3b8745649c302b79ba5399d4ea00b36 437e70c45633de74be7a87ed8d94c442a3bfe0a1cdd293d5184a4af1765d8cf5}
    _(resource.containers.images).must_equal %w{docker.io/library/nginx:latest docker.io/library/ubuntu:latest registry.fedoraproject.org/fedora:latest}
    _(resource.containers.names).must_equal %w{sweet_mendeleev wizardly_torvalds confident_bell}
    _(resource.containers.status).must_equal ["Created", "Exited (137) 25 hours ago"]
    _(resource.containers.exited).must_equal [false, false, true]
    _(resource.containers.exit_code).must_equal [0, 0, 137]
    _(resource.containers.image_ids).must_equal %w{55f4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb 27941809078cc9b2802deb2b0bb6feed6c236cde01e487f200e24653533701ee 3a66698e604003f7822a0c73e9da50e090fda9a99fe1f2e1e2e7fe796cc803d5}
    _(resource.containers.labels).must_equal [{ "maintainer" => "NGINX Docker Maintainers <docker-maint@nginx.com>" }, nil, { "license" => "MIT", "name" => "fedora", "vendor" => "Fedora Project", "version" => "36" }]
    _(resource.containers.mounts).must_equal []
    _(resource.containers.namespaces).must_equal [{}]
    _(resource.containers.pids).must_equal [0, 0, 0]
    _(resource.containers.pods).must_equal ["", "", ""]
    _(resource.containers.podnames).must_equal ["", "", ""]
    _(resource.containers.ports).must_equal [nil, nil, nil]
    _(resource.containers.sizes).must_equal [nil, nil, nil]
    _(resource.containers.started_at).must_equal [1656414251, 1656472725, 1656490220]
    _(resource.containers.states).must_equal %w{created created exited}
    _(resource.containers.created).must_equal [1656414250, 1656472725, 1656490220]
    _(resource.containers.auto_remove).must_equal [false, false, false]
    _(resource.containers.created_at).must_equal ["47 hours ago", "31 hours ago", "26 hours ago"]
  end

  # it "returns the parsed details of podman images" do
  #   _(resource.images.ids).must_equal ""
  # end
end
