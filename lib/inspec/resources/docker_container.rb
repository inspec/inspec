#
# Copyright 2017, Christoph Hartmann

require 'inspec/resources/docker'
require_relative 'docker_object'

module Inspec::Resources
  class DockerContainer < Inspec.resource(1)
    include Inspec::Resources::DockerObject

    name 'docker_container'
    supports platform: 'unix'
    desc ''
    example <<~EXAMPLE
      describe docker_container('an-echo-server') do
        it { should exist }
        it { should be_running }
        its('id') { should_not eq '' }
        its('image') { should eq 'busybox:latest' }
        its('repo') { should eq 'busybox' }
        its('tag') { should eq 'latest' }
        its('ports') { should eq [] }
        its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
        its('labels') { should include 'app=example' }
      end

      describe docker_container(id: 'e2c52a183358') do
        it { should exist }
        it { should be_running }
      end
    EXAMPLE

    def initialize(opts = {})
      # if a string is provided, we expect it is the name
      if opts.is_a?(String)
        @opts = { name: opts }
      else
        @opts = opts
      end
    end

    def running?
      status.downcase.start_with?('up') if object_info.entries.length == 1
    end

    def status
      object_info.status[0] if object_info.entries.length == 1
    end

    def labels
      object_info.labels
    end

    def ports
      object_info.ports[0] if object_info.entries.length == 1
    end

    def command
      return unless object_info.entries.length == 1

      cmd = object_info.commands[0]
      cmd.slice(1, cmd.length - 2)
    end

    def image
      object_info.images[0] if object_info.entries.length == 1
    end

    def repo
      parse_components_from_image(image)[:repo] if object_info.entries.size == 1
    end

    def tag
      parse_components_from_image(image)[:tag] if object_info.entries.size == 1
    end

    def to_s
      name = @opts[:name] || @opts[:id]
      "Docker Container #{name}"
    end

    private

    def object_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.containers.where { names == opts[:name] || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id]))) }
    end
  end
end
