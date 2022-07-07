require "inspec/resources/podman"
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
        its("id") { should eq "sha256:3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6" }
        its("image") { should eq "docker.io/library/busybox:latest" }
        its("repo") { should eq "docker.io/library/busybox" }
        its("tag") { should eq "latest" }
        its("resource_id") { should eq "sha256:3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6" }
      end

      describe podman_image(repo: "docker.io/library/busybox", tag: "latest") do
        it { should exist }
        its("id") { should eq "sha256:3c19bafed22355e11a608c4b613d87d06b9cdd37d378e6e0176cbc8e7144d5c6" }
        its("image") { should eq "docker.io/library/busybox:latest" }
      end

      describe podman_image(id: "8847e9bf6df8") do
        it { should exist }
      end
    EXAMPLE

    def initialize(opts = {})
      skip_resource "The `podman_image` resource is not yet available on your OS." unless inspec.os.unix?
      # do sanitizion of input values
      o = opts.dup
      o = { image: opts } if opts.is_a?(String)
      @opts = sanitize_options(o)
    end

    def image
      "#{repo}:#{tag}" if object_info.entries.size == 1
    end

    def repo
      object_info.repositories[0] if object_info.entries.size == 1
    end

    def tag
      object_info.tags[0] if object_info.entries.size == 1
    end

    def size
      object_info.sizes[0] if object_info.entries.size == 1
    end

    def digest
      object_info.digests[0] if object_info.entries.size == 1
    end

    def created_at
      object_info.created_at[0] if object_info.entries.size == 1
    end

    def created_since
      object_info.created_since[0] if object_info.entries.size == 1
    end

    def history
      object_info.history[0] if object_info.entries.size == 1
    end

    def resource_id
      object_info.ids[0] || @opts[:id] || @opts[:image] || ""
    end

    def to_s
      "podman_image #{resource_id}"
    end

    private

    def sanitize_options(opts)
      opts.merge!(parse_components_from_image(opts[:image]))

      # assume a "latest" tag if we don't have one
      opts[:tag] ||= "latest"

      # if the ID isn't nil and doesn't contain a hash indicator (indicated by the presence
      # of a colon, which separates the indicator from the actual hash), we assume it's sha256.
      opts[:id] = "sha256:" + opts[:id] unless opts[:id].nil? || opts[:id].include?(":")

      # Assemble/reassemble the image from the repo and tag
      opts[:image] = "#{opts[:repo]}:#{opts[:tag]}" unless opts[:repo].nil?

      # return the santized opts back to the caller
      opts
    end

    def object_info
      return @info if defined?(@info)

      opts = @opts
      @info = inspec.podman.images.where do
        (repository == opts[:repo] && tag == opts[:tag]) || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id])))
      end
    end
  end
end
