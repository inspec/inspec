require "helper"
require "inspec/resource"
require "inspec/resources/podman"

describe Inspec::Resources::Podman do
  let(:resource) { load_resource("podman") }

  it "prints as a Podman resource" do
    _(resource.to_s).must_equal "Podman"
  end

  it "prints as Podman containers plural resource" do
    _(resource.containers.to_s).must_equal "Podman Containers"
  end

  it "prints the resource id of Podman containers plural resource" do
    _(resource.containers.resource_id).must_equal "Podman Containers"
  end

  it "returns the parsed details of Podman containers" do
    _(resource.containers.exists?).must_equal true
    _(resource.containers.commands).must_equal %w{/bin/bash}
    _(resource.containers.ids).must_equal %w{591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7 64b5562346d6b52fd40d790b34e9f18ba3b8745649c302b79ba5399d4ea00b36 437e70c45633de74be7a87ed8d94c442a3bfe0a1cdd293d5184a4af1765d8cf5}
    _(resource.containers.images).must_equal %w{docker.io/library/nginx:latest docker.io/library/ubuntu:latest registry.fedoraproject.org/fedora:latest}
    _(resource.containers.names).must_equal %w{sweet_mendeleev wizardly_torvalds confident_bell}
    _(resource.containers.status).must_equal ["Created", "Created", "Exited (137) 25 hours ago"]
    _(resource.containers.exited).must_equal [false, false, true]
    _(resource.containers.exitcode).must_equal [0, 0, 137]
    _(resource.containers.imageids).must_equal %w{55f4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb 27941809078cc9b2802deb2b0bb6feed6c236cde01e487f200e24653533701ee 3a66698e604003f7822a0c73e9da50e090fda9a99fe1f2e1e2e7fe796cc803d5}
    _(resource.containers.labels).must_equal [{ "maintainer" => "NGINX Docker Maintainers <docker-maint@nginx.com>" }, nil, { "license" => "MIT", "name" => "fedora", "vendor" => "Fedora Project", "version" => "36" }]
    _(resource.containers.mounts).must_equal []
    _(resource.containers.namespaces).must_equal [{}]
    _(resource.containers.pids).must_equal [0, 0, 0]
    _(resource.containers.pods).must_equal ["", "", ""]
    _(resource.containers.podnames).must_equal ["", "", ""]
    _(resource.containers.ports).must_equal [nil, nil, nil]
    _(resource.containers.sizes).must_equal [nil, nil, nil]
    _(resource.containers.startedat).must_equal [1656414251, 1656472725, 1656490220]
    _(resource.containers.states).must_equal %w{created created exited}
    _(resource.containers.created).must_equal [1656414250, 1656472725, 1656490220]
    _(resource.containers.autoremove).must_equal [false, false, false]
    _(resource.containers.createdat).must_equal ["47 hours ago", "31 hours ago", "26 hours ago"]
  end

  it "returns false if container with specific id does not exist" do
    _(resource.containers.where(id: "979453ff4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb").exists?).must_equal false
  end

  it "prints as Podman images plural resource" do
    _(resource.images.to_s).must_equal "Podman Images"
  end

  it "prints the resource id of Podman images plural resource" do
    _(resource.images.resource_id).must_equal "Podman Images"
  end

  it "returns the parsed details of podman images" do
    _(resource.images.exists?).must_equal true
    _(resource.images.ids).must_equal %w{55f4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb 27941809078cc9b2802deb2b0bb6feed6c236cde01e487f200e24653533701ee 3a66698e604003f7822a0c73e9da50e090fda9a99fe1f2e1e2e7fe796cc803d5}
    _(resource.images.parentids).must_equal ["", "", ""]
    _(resource.images.repodigests).must_include "docker.io/library/nginx@sha256:10f14ffa93f8dedf1057897b745e5ac72ac5655c299dade0aa434c71557697ea"
    _(resource.images.repotags).must_equal [nil, nil, nil]
    _(resource.images.sizes).must_equal [145937268, 80344929, 168993849]
    _(resource.images.sharedsizes).must_equal [0, 0, 0]
    _(resource.images.virtualsizes).must_equal [145937268, 80344929, 168993849]
    _(resource.images.labels).must_equal [{ "maintainer" => "NGINX Docker Maintainers <docker-maint@nginx.com>" }, nil, { "license" => "MIT", "name" => "fedora", "vendor" => "Fedora Project", "version" => "36" }]
    _(resource.images.containers).must_equal [1, 1, 1]
    _(resource.images.names).must_equal %w{docker.io/library/nginx:latest docker.io/library/ubuntu:latest registry.fedoraproject.org/fedora:latest}
    _(resource.images.digests).must_equal %w{sha256:10f14ffa93f8dedf1057897b745e5ac72ac5655c299dade0aa434c71557697ea sha256:b6b83d3c331794420340093eb706a6f152d9c1fa51b262d9bf34594887c2c7ac sha256:38813cf0913241b7f13c7057e122f7c3cfa2e7c427dca3194f933d94612e280b}
    _(resource.images.history).must_equal [nil, nil, nil]
    _(resource.images.created).must_equal [1655957604, 1654554086, 1651831918]
    _(resource.images.createdat).must_equal %w{2022-06-23T04:13:24Z 2022-06-06T22:21:26Z 2022-05-06T10:11:58Z}
  end

  it "returns false if image with specific id does not exist" do
    _(resource.images.where(id: "979453ff4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb").exists?).must_equal false
  end

  it "prints as Podman networks plural resource" do
    _(resource.networks.to_s).must_equal "Podman Networks"
  end

  it "prints the resource id of Podman networks plural resource" do
    _(resource.networks.resource_id).must_equal "Podman Networks"
  end

  it "returns the parsed details of podman networks" do
    _(resource.networks.exists?).must_equal true
    _(resource.networks.ids).must_equal %w{2f259bab93aaaaa2542ba43ef33eb990d0999ee1b9924b557b7be53c0b7a1bb9}
    _(resource.networks.names).must_equal %w{podman}
    _(resource.networks.drivers).must_equal %w{bridge}
    _(resource.networks.network_interfaces).must_equal %w{podman0}
    _(resource.networks.created).must_equal %w{2022-07-01T17:05:20.015804994+05:30}
    _(resource.networks.subnets).must_equal [{ "subnet" => "10.88.0.0/16", "gateway" => "10.88.0.1" }]
    _(resource.networks.ipv6_enabled).must_equal [false]
    _(resource.networks.internal).must_equal [false]
    _(resource.networks.dns_enabled).must_equal [false]
    _(resource.networks.ipam_options).must_equal [{ "driver" => "host-local" }]
  end

  it "returns false if network with specific id does not exist" do
    _(resource.networks.where(id: "979453ff4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb").exists?).must_equal false
  end

  it "returns true if network with specific id exist" do
    _(resource.networks.where(id: "2f259bab93aaaaa2542ba43ef33eb990d0999ee1b9924b557b7be53c0b7a1bb9").exists?).must_equal true
  end

  it "prints as Podman pods plural resource" do
    _(resource.pods.to_s).must_equal "Podman Pods"
  end

  it "prints the resource id of Podman pods plural resource" do
    _(resource.pods.resource_id).must_equal "Podman Pods"
  end

  it "returns the parsed details of podman pods" do
    _(resource.pods.ids).must_equal %w{95cadbb84df71e6374fceb3fd89ee3b8f2c7e1a831062cd9cea7d0e3e4b1dbcc}
    _(resource.pods.cgroups).must_equal %w{user.slice}
    _(resource.pods.containers).must_equal [{ "Id" => "a218dfc58fa28e0c58c55e508e5b57084876b42e894b98073c69c45dea06cbb2", "Names" => "95cadbb84df7-infra", "Status" => "running" }, { "Id" => "b36abf69b8af6f8a8305ab2d9b209c2acaeece41dbc4f242f8e45caf6e02504b", "Names" => "pensive_mccarthy", "Status" => "running" }]
    _(resource.pods.created).must_equal %w{2022-07-01T13:08:09.662082101+05:30}
    _(resource.pods.infraids).must_equal %w{a218dfc58fa28e0c58c55e508e5b57084876b42e894b98073c69c45dea06cbb2}
    _(resource.pods.names).must_equal %w{cranky_allen}
    _(resource.pods.namespaces).must_equal [""]
    _(resource.pods.networks).must_equal %w{podman}
    _(resource.pods.status).must_equal %w{Running}
    _(resource.pods.labels).must_equal [{}]
  end

  it "returns false if pod with specific id does not exist" do
    _(resource.pods.where(id: "979453ff4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb").exists?).must_equal false
  end

  it "checks podman info parsing" do
    _(resource.info.host.os).must_equal "linux"
    _(resource.info.version.Version).must_equal "4.1.0"
  end

  it "checks podman version parsing" do
    _(resource.version.Server.Version).must_equal "4.1.0"
    _(resource.version.Client.Version).must_equal "4.1.0"
  end

  it "prints as Podman volumes plural resource" do
    _(resource.volumes.to_s).must_equal "Podman Volumes"
  end

  it "prints the resource id of Podman volumes plural resource" do
    _(resource.volumes.resource_id).must_equal "Podman Volumes"
  end

  it "returns parsed details of podman volumes" do
    _(resource.volumes.names).must_equal %w{ae6be9ba838b9b150de47657229bb9b67142dbdb3d1ddbc5efa245cf1e95536a}
    _(resource.volumes.drivers).must_equal %w{local}
    _(resource.volumes.mountpoints).must_equal %w{/var/home/core/.local/share/containers/storage/volumes/ae6be9ba838b9b150de47657229bb9b67142dbdb3d1ddbc5efa245cf1e95536a/_data}
    _(resource.volumes.createdat).must_equal %w{2022-07-02T12:40:37.012062614+05:30}
    _(resource.volumes.labels).must_equal [{}]
    _(resource.volumes.scopes).must_equal %w{local}
    _(resource.volumes.options).must_equal [{}]
    _(resource.volumes.mountcount).must_equal [0]
    _(resource.volumes.needscopyup).must_equal [true]
    _(resource.volumes.needschown).must_equal [true]
  end

  it "returns false if volume with specific name does not exist" do
    _(resource.volumes.where(name: "6bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb").exists?).must_equal false
  end

  it "check podman object parsing" do
    _(resource.object("591270d8d80d").Id).must_equal "591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7"
    _(resource.object("591270d8d80d").Path).must_equal "/docker-entrypoint.sh"
  end
end
