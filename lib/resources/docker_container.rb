# encoding: utf-8
#
# Copyright 2017, Christoph Hartmann
#
# author: Christoph Hartmann
# author: Patrick Muench
# author: Dominik Richter

module Inspec::Resources
  class DockerContainer < Inspec.resource(1)
    name 'docker_container'
    desc ''
    example "
      describe docker_container('an-echo-server') do
        it { should exist }
        it { should be_running }
        its('id') { should_not eq '' }
        its('image') { should eq 'busybox:latest' }
        its('repo') { should eq 'busybox' }
        its('tag') { should eq 'latest' }
        its('ports') { should eq [] }
        its('command') { should eq 'nc -ll -p 1234 -e /bin/cat' }
      end

      describe docker_container(id: 'e2c52a183358') do
        it { should exist }
        it { should be_running }
      end
    "

    def initialize(opts = {})
      # if a string is provided, we expect it is the name
      if opts.is_a?(String)
        @opts = { name: opts }
      else
        @opts = opts
      end
    end

    def exist?
      container_info.exists?
    end

    # is allways returning the full id
    def id
      container_info.ids[0] if container_info.entries.length == 1
    end

    def running?
      status.downcase.start_with?('up') if container_info.entries.length == 1
    end

    def status
      container_info.status[0] if container_info.entries.length == 1
    end

    def labels
      container_info.labels[0] if container_info.entries.length == 1
    end

    def ports
      container_info.ports[0] if container_info.entries.length == 1
    end

    def command
      if container_info.entries.length == 1
        cmd = container_info.commands[0]
        cmd.slice(1, cmd.length - 2)
      end
    end

    def image
      container_info.images[0] if container_info.entries.length == 1
    end

    def repo
      image.split(':')[0] unless image.nil?
    end

    def tag
      image.split(':')[1] unless image.nil?
    end

    def to_s
      name = @opts[:name] || @opts[:id]
      "Docker Container #{name}"
    end

    private

    def container_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.containers.where { names == opts[:name] || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id]))) }
    end
  end
end
