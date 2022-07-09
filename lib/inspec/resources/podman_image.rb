require "inspec/resources/command"
require_relative "docker_object"

module Inspec::Resources
  class PodmanImage < Inspec.resource(1)
    include Inspec::Resources::DockerObject
    name "podman_image"
    supports platform: "unix"

    desc "InSpec core resource to retrieve information about podman image"

    example <<~EXAMPLE
      describe podman_image("docker.io/library/busybox") do
        it { should exist }
        its("repo_tags") { should include "docker.io/library/busybox:latest" }
        its("size") { should eq 1636053 }
        its("resource_id") { should eq "docker.io/library/busybox:latest" }
      end

      describe podman_image("docker.io/library/busybox:latest") do
        it { should exist }
      end

      describe podman_image(repo: "docker.io/library/busybox", tag: "latest") do
        it { should exist }
      end

      describe podman_image(id: "3c19bafed223") do
        it { should exist }
      end
    EXAMPLE

    attr_reader :opts, :inspect_info

    def initialize(opts)
      skip_resource "The `podman_image` resource is not yet available on your OS." unless inspec.os.unix?
      opts = { image: opts } if opts.is_a?(String)
      @opts = sanitize_options(opts)
      @inspect_info = get_inspect_info
    end

    def exist?
      inspect_info.key?("id")
    end

    def repo_tags
      inspect_info["repo_tags"]
    end

    def size
      # TODO: Convert bytes to KB or MB; if required
      inspect_info["size"]
    end

    def digest
      inspect_info["digest"]
    end

    def created_at
      inspect_info["created_at"]
    end

    def version
      inspect_info["version"]
    end

    def names_history
      inspect_info["names_history"]
    end

    def repo_digests
      inspect_info["repo_digests"]
    end

    def architecture
      inspect_info["architecture"]
    end

    def os
      inspect_info["os"]
    end

    def virtual_size
      # TODO: Convert bytes to KB or MB
      inspect_info["virtual_size"]
    end

    def resource_id
      @opts[:id] || @opts[:image] || ""
    end

    def to_s
      "podman_image #{resource_id}"
    end

    private

    def sanitize_options(opts)
      opts.merge!(parse_components_from_image(opts[:image]))

      # assume a "latest" tag if we don't have one
      opts[:tag] ||= "latest"

      # Assemble/reassemble the image from the repo and tag
      opts[:image] = "#{opts[:repo]}:#{opts[:tag]}" unless opts[:repo].nil?

      opts
    end

    def get_inspect_info
      current_image = @opts[:id] || @opts[:image] || @opts [:repo] + ":" + @opts[:tag]
      labels = {
        "id" => "ID",
        "repo_tags" => "RepoTags",
        "size" => "Size",
        "digest" => "Digest",
        "created_at" => "Created",
        "version" => "Version",
        "names_history" => "NamesHistory",
        "repo_digests" => "RepoDigests",
        "architecture" => "Architecture",
        "os" => "Os",
        "virtual_size" => "VirtualSize",
      }
      json_label_format = labels.map { |k, v| "\"#{k}\": {{json .#{v}}}" }
      podman_inspect_cmd = inspec.command("podman image inspect --format '{#{json_label_format.join(", ")}}' #{current_image}")

      raise Inspec::Exceptions::ResourceFailed, "Unable to retrieve podman image info for #{current_image}" if podman_inspect_cmd.exit_status != 0

      require "json" unless defined?(JSON)
      JSON.parse(podman_inspect_cmd.stdout)
    end
  end
end
