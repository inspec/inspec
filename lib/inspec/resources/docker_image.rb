#
# Copyright 2017, Christoph Hartmann

require 'inspec/resources/docker'
require_relative 'docker_object'

module Inspec::Resources
  class DockerImage < Inspec.resource(1)
    include Inspec::Resources::DockerObject

    name 'docker_image'
    supports platform: 'unix'
    desc ''
    example <<~EXAMPLE
      describe docker_image('alpine:latest') do
        it { should exist }
        its('id') { should_not eq '' }
        its('image') { should eq 'alpine:latest' }
        its('repo') { should eq 'alpine' }
        its('tag') { should eq 'latest' }
      end

      describe docker_image('alpine:latest') do
        it { should exist }
      end

      describe docker_image(id: '4a415e366388') do
        it { should exist }
      end
    EXAMPLE

    def initialize(opts = {})
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

    def to_s
      img = @opts[:image] || @opts[:id]
      "Docker Image #{img}"
    end

    private

    def sanitize_options(opts)
      opts.merge!(parse_components_from_image(opts[:image]))

      # assume a "latest" tag if we don't have one
      opts[:tag] ||= 'latest'

      # if the ID isn't nil and doesn't contain a hash indicator (indicated by the presence
      # of a colon, which separates the indicator from the actual hash), we assume it's sha256.
      opts[:id] = 'sha256:' + opts[:id] unless opts[:id].nil? || opts[:id].include?(':')

      # Assemble/reassemble the image from the repo and tag
      opts[:image] = "#{opts[:repo]}:#{opts[:tag]}" unless opts[:repo].nil?

      # return the santized opts back to the caller
      opts
    end

    def object_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.images.where {
        (repository == opts[:repo] && tag == opts[:tag]) || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id])))
      }
    end
  end
end
