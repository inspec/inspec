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

    attr_reader :opts, :image_info

    def initialize(opts)
      skip_resource "The `podman_image` resource is not yet available on your OS." unless inspec.os.unix?
      opts = { image: opts } if opts.is_a?(String)
      @opts = sanitize_options(opts)
      @image_info = get_image_info
    end

    def exist?
      get_value("id") != nil
    end

    def id
      get_value("id")
    end

    def repo_tags
      get_value("repo_tags")
    end

    def size
      # TODO: Convert bytes to KB or MB; if required
      get_value("size")
    end

    def digest
      get_value("digest")
    end

    def created_at
      get_value("created_at")
    end

    def version
      get_value("version")
    end

    def names_history
      get_value("names_history")
    end

    def repo_digests
      get_value("repo_digests")
    end

    def architecture
      get_value("architecture")
    end

    def os
      get_value("os")
    end

    def virtual_size
      # TODO: Convert bytes to KB or MB
      get_value("virtual_size")
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

    def get_image_info
      current_image = @opts[:id] || @opts[:image] || @opts [:repo] + ":" + @opts[:tag]
      json_key_label = get_json_key_label
      podman_inspect_cmd = inspec.command("podman image inspect --format '{#{json_key_label}}' #{current_image}")

      if podman_inspect_cmd.exit_status != 0
        raise Inspec::Exceptions::ResourceFailed, "Unable to retrieve podman image info for #{current_image}.\nError message: #{podman_inspect_cmd.stderr}"
      else
        require "json" unless defined?(JSON)
        JSON.parse(podman_inspect_cmd.stdout)
      end
    end

    def get_value(key)
      return nil if image_info.nil?

      image_info[key]
    end

    def get_json_key_label
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
      json_key_label_array = labels.map { |k, v| "\"#{k}\": {{json .#{v}}}" }
      json_key_label_array.join(", ")
    end
  end
end