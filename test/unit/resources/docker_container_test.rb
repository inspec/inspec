require "helper"
require "inspec/resource"
require "inspec/resources/docker_container"

describe "Inspec::Resources::DockerContainer" do
  describe "docker_container" do
    it "check container parsing for alpine" do
      resource = load_resource("docker_container", "laughing_austin")
      _(resource.id).must_equal "d94f854370d2b02912e8fc636502bc72b74fbd567a7eba3fc6a52045bb28904e"
      _(resource.image).must_equal "alpine"
      _(resource.repo).must_equal "alpine"
      _(resource.tag).must_be_nil
      _(resource.command).must_equal "/bin/sh"
      _(resource.ports).must_equal ""
      _(resource.resource_id).must_equal "d94f854370d2b02912e8fc636502bc72b74fbd567a7eba3fc6a52045bb28904e"
    end

    it "check container parsing for alpine" do
      resource = load_resource("docker_container", "sleepy_khorana")
      _(resource.id).must_equal "3def9aa450f8bd772c3d5b07e27ec934e5f58575e955367a0aca2d93e0687536"
      _(resource.image).must_equal "ubuntu:12.04"
      _(resource.repo).must_equal "ubuntu"
      _(resource.tag).must_equal "12.04"
      _(resource.command).must_equal "/bin/bash"
      _(resource.ports).must_equal ""
      _(resource.labels).must_equal ["app=example", "version=1.5.4"]
      _(resource.resource_id).must_equal "3def9aa450f8bd772c3d5b07e27ec934e5f58575e955367a0aca2d93e0687536"
    end

    it "returns an empty array when parsing a container with no labels specified" do
      resource = load_resource("docker_container", "heuristic_almeida")
      _(resource.labels).must_equal []
    end

    it "check image containing repo with port and tag gives correct repo, image, and tag" do
      resource = load_resource("docker_container", "heuristic_almeida")
      _(resource.repo).must_equal "repo.example.com:5000/ubuntu"
      _(resource.image).must_equal "repo.example.com:5000/ubuntu:14.04"
      _(resource.tag).must_equal "14.04"
    end

    it "check image containing repo with port and no tag gives correct repo, image, and tag" do
      resource = load_resource("docker_container", "laughing_lamport")
      _(resource.repo).must_equal "repo.example.com:5000/ubuntu"
      _(resource.image).must_equal "repo.example.com:5000/ubuntu"
      _(resource.tag).must_be_nil
    end

    it "prints as a docker resource" do
      resource = load_resource("docker_container", "laughing_austin")
      _(resource.to_s).must_equal "Docker Container laughing_austin"
    end

    # Test case for has_volume? matcher - Case 1: Volumes are mounted on the container
    it "checks if a volume has been mounted for the docker resource" do
      resource = load_resource("docker_container", "trusting_williams")
      _(resource.has_volume?("/app", "/var/lib/docker/volumes/myvol2/_data")).must_equal true
      _(resource.has_volume?("/app2", "/var/lib/docker/volumes/myvol3/_data")).must_equal true
    end

    # Test case for has_volume? matcher - Case 2: Volumes are not mounted on the container
    it "checks exception when no volume has been mounted for the docker resource" do
      resource = load_resource("docker_container", "fried_water")
      ex = _ { resource.has_volume?("/app", "/var/lib/docker/volumes/myvol2/_data") }.must_raise(Inspec::Exceptions::ResourceFailed)
      _(ex.message).must_include "Could not find any mounted volumes for your container"
    end

    # Test case for has_volume? matcher - Case 3: The container doesn't exist
    it "checks exception when no volume has been mounted for the docker resource and the container doesnt'e exist" do
      resource = load_resource("docker_container", "non_existing_container")
      ex = _ { resource.has_volume?("/app", "/var/lib/docker/volumes/myvol2/_data") }.must_raise(NoMethodError)
      _(ex.message).must_include "undefined method `[]' for nil"
    end
  end
end
