require "inspec/resources/command"
require_relative "docker_object"
require "inspec/utils/podman"

module Inspec::Resources
  class PodmanImage < Inspec.resource(1)
    include Inspec::Resources::DockerObject
    include Inspec::Utils::Podman

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
      raise Inspec::Exceptions::ResourceFailed, "Podman is not running. Please make sure it is installed and running." unless podman_running?

      @image_info = get_image_info
    end

    LABELS = {
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
    }.freeze

    ## This creates all the required properties methods dynamically.
    LABELS.each do |k, v|
      define_method(k) do
        image_info[k.to_s]
      end
    end

    def exist?
      ! image_info.empty?
    end

    def resource_id
      opts[:id] || opts[:image] || ""
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
      current_image = opts[:id] || opts[:image] || opts[:repo] + ":" + opts[:tag]
      json_key_label = generate_go_template(LABELS)
      podman_inspect_cmd = inspec.command("podman image inspect #{current_image} --format '{#{json_key_label}}'")

      if podman_inspect_cmd.exit_status == 0
        parse_command_output(podman_inspect_cmd.stdout)
      elsif podman_inspect_cmd.stderr =~ /failed to find image/
        {}
      else
        raise Inspec::Exceptions::ResourceFailed, "Unable to retrieve podman image information for #{current_image}.\nError message: #{podman_inspect_cmd.stderr}"
      end
    end
  end
end
