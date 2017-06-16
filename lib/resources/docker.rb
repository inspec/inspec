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
      describe docker.containers do
        its('images') { should_not include 'u12:latest' }
      end

      describe docker.images do
        its('repositories') { should_not include 'inssecure_image' }
      end

      describe docker.version do
        its('Server.Version') { should cmp >= '1.12'}
        its('Client.Version') { should cmp >= '1.12'}
      end

      describe docker.object(id) do
        its('Configuration.Path') { should eq 'value' }
      end

      docker.containers.ids.each do |id|
        # call docker inspect for a specific container id
        describe docker.object(id) do
          its(%w(HostConfig Privileged)) { should cmp false }
          its(%w(HostConfig Privileged)) { should_not cmp true }
        end
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
    rescue JSON::ParserError => _e
      return Hashie::Mash.new({})
    end

    def info
      return @info if defined?(@info)
      data = JSON.parse(inspec.command('docker info --format \'{{ json . }}\'').stdout)
      @info = Hashie::Mash.new(data)
    rescue JSON::ParserError => _e
      return Hashie::Mash.new({})
    end

    # returns information about docker objects
    def object(id)
      return @inspect if defined?(@inspect)
      data = JSON.parse(inspec.command("docker inspect #{id}").stdout)
      data = data[0] if data.is_a?(Array)
      @inspect = Hashie::Mash.new(data)
    rescue JSON::ParserError => _e
      return Hashie::Mash.new({})
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
    rescue JSON::ParserError => _e
      warn 'Could not parse `docker ps` output'
      []
    end

    def parse_images
      # docker does not support the `json .` function here, therefore we need to emulate that behavior.
      raw_images = inspec.command('docker images -a --no-trunc --format \'{ "id": {{json .ID}}, "repository": {{json .Repository}}, "tag": {{json .Tag}}, "size": {{json .Size}}, "digest": {{json .Digest}}, "createdat": {{json .CreatedAt}}, "createdsize": {{json .CreatedSince}} }\'').stdout
      c_images = []
      raw_images.each_line { |entry|
        c_images.push(JSON.parse(entry))
      }
      c_images
    rescue JSON::ParserError => _e
      warn 'Could not parse `docker images` output'
      []
    end
  end
end
