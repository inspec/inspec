require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/podman"

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
    _(resource.containers.commands).must_equal ["/bin/bash", "/bin/bash", "/bin/bash", "", "bash"]
    _(resource.containers.ids).must_equal %w{591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7 64b5562346d6b52fd40d790b34e9f18ba3b8745649c302b79ba5399d4ea00b36 437e70c45633de74be7a87ed8d94c442a3bfe0a1cdd293d5184a4af1765d8cf5 a218dfc58fa28e0c58c55e508e5b57084876b42e894b98073c69c45dea06cbb2 b36abf69b8af6f8a8305ab2d9b209c2acaeece41dbc4f242f8e45caf6e02504b}
    _(resource.containers.images).must_equal %w{docker.io/library/nginx:latest docker.io/library/ubuntu:latest registry.fedoraproject.org/fedora:latest localhost/podman-pause:4.1.0-1651853754 docker.io/library/ubuntu:latest}
    _(resource.containers.names).must_equal %w{sweet_mendeleev wizardly_torvalds confident_bell 95cadbb84df7-infra pensive_mccarthy}
    _(resource.containers.status).must_equal ["Up 13 hours ago", "Up 13 hours ago", "Created", "Created", "Created"]
    _(resource.containers.image_ids).must_include "55f4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb"
    _(resource.containers.labels).must_include "maintainer" => "NGINX Docker Maintainers <docker-maint@nginx.com>"
    _(resource.containers.mounts).must_include []
    _(resource.containers.pods).must_include "95cadbb84df71e6374fceb3fd89ee3b8f2c7e1a831062cd9cea7d0e3e4b1dbcc"
    _(resource.containers.ports).must_include ""
    _(resource.containers.sizes).must_include "12B (virtual 142MB)"
    _(resource.containers.created_at).must_include "2022-06-29 08:48:45.195339311 +0530 IST"
    _(resource.containers.networks).must_include "podman"
    _(resource.containers.running_for).must_include "8 days ago"

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
    _(resource.images.ids).must_equal %w{sha256:c7db653c4397e6a4d1e468bb7c6400c022c62623bdb87c173d54bac7995b6d8f sha256:55f4b40fe486a5b734b46bb7bf28f52fa31426bf23be068c8e7b19e58d9b8deb sha256:27941809078cc9b2802deb2b0bb6feed6c236cde01e487f200e24653533701ee sha256:3a66698e604003f7822a0c73e9da50e090fda9a99fe1f2e1e2e7fe796cc803d5}
    _(resource.images.repositories).must_equal %w{localhost/podman-pause docker.io/library/nginx docker.io/library/ubuntu registry.fedoraproject.org/fedora}
    _(resource.images.tags).must_equal %w{4.1.0-1651853754 latest latest latest}
    _(resource.images.sizes).must_equal ["816 kB", "146 MB", "80.3 MB", "169 MB"]
    _(resource.images.digests).must_equal %w{sha256:e6e9fffed42f600c811af34569268c07d063f12507457493c608d944a1fdac3f sha256:10f14ffa93f8dedf1057897b745e5ac72ac5655c299dade0aa434c71557697ea sha256:b6b83d3c331794420340093eb706a6f152d9c1fa51b262d9bf34594887c2c7ac sha256:38813cf0913241b7f13c7057e122f7c3cfa2e7c427dca3194f933d94612e280b}
    _(resource.images.history).must_equal %w{localhost/podman-pause:4.1.0-1651853754 docker.io/library/nginx:latest docker.io/library/ubuntu:latest registry.fedoraproject.org/fedora:latest}
    _(resource.images.created_since).must_equal ["5 days ago", "13 days ago", "4 weeks ago", "2 months ago"]
    _(resource.images.created_at).must_equal ["2022-07-01 07:38:09 +0000 UTC", "2022-06-23 04:13:24 +0000 UTC", "2022-06-06 22:21:26 +0000 UTC", "2022-05-06 10:11:58 +0000 UTC"]
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
    _(resource.networks.created).must_equal %w{2022-07-06T10:32:00.879655095+05:30}
    _(resource.networks.subnets).must_equal [[{ "subnet" => "10.88.0.0/16", "gateway" => "10.88.0.1" }]]
    _(resource.networks.ipv6_enabled).must_equal [false]
    _(resource.networks.internal).must_equal [false]
    _(resource.networks.dns_enabled).must_equal [false]
    _(resource.networks.ipam_options).must_equal [{ "driver" => "host-local" }]
    _(resource.networks.labels).must_equal [""]
    _(resource.networks.options).must_include nil
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
    _(resource.pods.containers).must_equal [[{ "Id" => "a218dfc58fa28e0c58c55e508e5b57084876b42e894b98073c69c45dea06cbb2", "Names" => "95cadbb84df7-infra", "Status" => "running" }, { "Id" => "b36abf69b8af6f8a8305ab2d9b209c2acaeece41dbc4f242f8e45caf6e02504b", "Names" => "pensive_mccarthy", "Status" => "running" }]]
    _(resource.pods.created).must_equal %w{2022-07-01T13:08:09.662082101+05:30}
    _(resource.pods.infraids).must_equal %w{a218dfc58fa28e0c58c55e508e5b57084876b42e894b98073c69c45dea06cbb2}
    _(resource.pods.names).must_equal %w{cranky_allen}
    _(resource.pods.namespaces).must_equal [""]
    _(resource.pods.networks).must_equal [["podman"]]
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
