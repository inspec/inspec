# encoding: utf-8
#
# Copyright 2017, Christoph Hartmann
#
# author: Christoph Hartmann
# author: Patrick Muench
# author: Dominik Richter

require 'utils/filter'
require 'hashie/mash'

module Inspec::Resources
  class DockerContainerFilter
    # use filtertable for containers
    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:commands,       field: 'command')
          .add(:ids,            field: 'id')
          .add(:images,         field: 'image')
          .add(:labels,         field: 'labels')
          .add(:local_volumes,  field: 'localvolumes')
          .add(:mounts,         field: 'mounts')
          .add(:names,          field: 'names')
          .add(:networks,       field: 'networks')
          .add(:ports,          field: 'ports')
          .add(:running_for,    field: 'runningfor')
          .add(:sizes,          field: 'size')
          .add(:status,         field: 'status')
          .add(:exists?) { |x| !x.entries.empty? }
          .add(:running?) { |x|
            x.where { status.downcase.start_with?('up') }
          }
    filter.connect(self, :containers)

    attr_reader :containers
    def initialize(containers)
      @containers = containers
    end
  end

  class DockerImageFilter
    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:ids,              field: 'id')
          .add(:repositories,     field: 'repository')
          .add(:tags,             field: 'tag')
          .add(:sizes,            field: 'size')
          .add(:digests,          field: 'digest')
          .add(:created,          field: 'createdat')
          .add(:created_since,    field: 'createdsize')
          .add(:exists?) { |x| !x.entries.empty? }
    filter.connect(self, :images)

    attr_reader :images
    def initialize(images)
      @images = images
    end
  end

  # This resource helps to parse information from the docker host
  # For compatability with Serverspec we also offer the following resouses:
  # - docker_container
  # - docker_image
  class Docker < Inspec.resource(1)
    name 'docker'

    desc "
      A resource to retrieve information about docker
    "

    example "
      describe docker.version do
        its('Client.Version') { should cmp >= '1.12'}
      end

      describe docker.info do
        its('Containers') { should cmp <= 100 }
        its('Containers.Running') { should cmp <= 20 }
      end
    "

    def containers
      DockerContainerFilter.new(parse_containers)
    end

    def images
      DockerImageFilter.new(parse_images)
    end

    def version
      return @version if defined?(@version)
      data = JSON.parse(inspec.command('docker version --format \'{{ json . }}\'').stdout)
      @version = Hashie::Mash.new(data)
    end

    def info
      return @info if defined?(@info)
      data = JSON.parse(inspec.command('docker info --format \'{{ json . }}\'').stdout)
      @info = Hashie::Mash.new(data)
    end

    # returns information about docker objects
    def object(id)
      return @inspect if defined?(@inspect)
      data = JSON.parse(inspec.command("docker inspect #{id}").stdout)
      data = data[0] if data.is_a?(Array)
      @inspect = Hashie::Mash.new(data)
    end

    def to_s
      'Docker Host'
    end

    private

    def parse_containers
      raw_containers = inspec.command('docker ps -a --no-trunc --format \'{{ json . }}\'').stdout
      ps = []
      # since docker is not outputting valid json, we need to parse each row
      raw_containers.each_line { |entry|
        j = JSON.parse(entry)
        # convert all keys to lower_case to work well with ruby and filter table
        j = j.map { |k, v|
          [k.downcase, v]
        }.to_h
        ps.push(j)
      }
      ps
    end

    def parse_images
      # docker does not support the `json .` function here, therefore we need to emulate that behavior.
      raw_images = inspec.command('docker images -a --no-trunc --format \'{ "id": {{json .ID}}, "repository": {{json .Repository}}, "tag": {{json .Tag}}, "size": {{json .Size}}, "digest": {{json .Digest}}, "createdat": {{json .CreatedAt}}, "createdsize": {{json .CreatedSince}} }\'').stdout
      c_images = []
      raw_images.each_line { |entry|
        c_images.push(JSON.parse(entry))
      }
      c_images
    end
  end

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
      "Docker Container #{id}"
    end

    private

    def container_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.containers.where { names == opts[:name] || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id]))) }
    end
  end

  class DockerImage < Inspec.resource(1)
    name 'docker_image'
    desc ''
    example "
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
    "

    def initialize(opts = {})
      # do sanitizion of input values
      o = opts.dup
      o = { image: opts } if opts.is_a?(String)
      @opts = sanitize_options(o)
    end

    def exist?
      image_info.exists?
    end

    def id
      image_info.ids[0] if image_info.entries.size == 1
    end

    def image
      "#{repo}:#{tag}" if image_info.entries.size == 1
    end

    def repo
      image_info.repositories[0] if image_info.entries.size == 1
    end

    def tag
      image_info.tags[0] if image_info.entries.size == 1
    end

    def to_s
      "Docker Image #{id}"
    end

    private

    def sanitize_options(opts)
      if !opts[:image].nil?
        if !opts[:image].index(':').nil?
          repo, tag = opts[:image].split(':')
        else
          opts[:repo] = opts[:image]
          opts[:image] = nil
        end
        opts[:repo] ||= repo
        opts[:tag] ||= tag
      end

      if !opts[:id].nil?
        if opts[:id].index(':').nil?
          opts[:id] = 'sha256:' + opts[:id]
        end
      end

      opts[:tag] ||= 'latest'
      opts[:image] ||= "#{opts[:repo]}:#{opts[:tag]}" unless opts[:repo].nil?
      opts
    end

    def image_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.images.where {
        (repository == opts[:repo] && tag == opts[:tag]) || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id])))
      }
    end
  end
end
