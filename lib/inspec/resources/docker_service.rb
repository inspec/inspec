#
# Copyright 2017, Christoph Hartmann

require 'inspec/resources/docker'
require_relative 'docker_object'

module Inspec::Resources
  class DockerService < Inspec.resource(1)
    include Inspec::Resources::DockerObject

    name 'docker_service'
    supports platform: 'unix'
    desc 'Swarm-mode service'
    example <<~EXAMPLE
      describe docker_service('service1') do
        it { should exist }
        its('id') { should_not eq '' }
        its('image') { should eq 'alpine:latest' }
        its('repo') { should eq 'alpine' }
        its('tag') { should eq 'latest' }
      end

      describe docker_service(id: '4a415e366388') do
        it { should exist }
      end

      describe docker_service(image: 'alpine:latest') do
        it { should exist }
      end
    EXAMPLE

    def initialize(opts = {})
      # do sanitizion of input values
      o = opts.dup
      o = { name: opts } if opts.is_a?(String)
      @opts = sanitize_options(o)
    end

    def name
      object_info.names[0] if object_info.entries.size == 1
    end

    def image
      object_info.images[0] if object_info.entries.size == 1
    end

    def image_name
      parse_components_from_image(image)[:image_name] if object_info.entries.size == 1
    end

    def repo
      parse_components_from_image(image)[:repo] if object_info.entries.size == 1
    end

    def tag
      parse_components_from_image(image)[:tag] if object_info.entries.size == 1
    end

    def mode
      object_info.modes[0] if object_info.entries.size == 1
    end

    def replicas
      object_info.replicas[0] if object_info.entries.size == 1
    end

    def ports
      object_info.ports[0] if object_info.entries.size == 1
    end

    def to_s
      service = @opts[:name] || @opts[:id]
      "Docker Service #{service}"
    end

    private

    def sanitize_options(opts)
      opts.merge(parse_components_from_image(opts[:image]))
    end

    def object_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.services.where {
        name == opts[:name] || image == opts[:image] || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id])))
      }
    end
  end
end
