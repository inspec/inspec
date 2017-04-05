# encoding: utf-8
#
# Copyright 2017, Christoph Hartmann
#
# author: Christoph Hartmann
# author: Patrick Muench
# author: Dominik Richter

require 'utils/filter'
require 'hashie/mash'

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
  filter.connect(self, :containers)

  attr_reader(:containers)
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

  attr_reader(:images)
  def initialize(images)
    @images = images
  end
end

# For compatability with Serverspec we also offer the following resouses:
# - docker_container
# - docker_image
module Inspec::Resources
  # This resource helps to parse information from the docker host
  class Docker < Inspec.resource(1)
    name 'docker'

    desc "
      A resource to retrieve information about docker
    "

    example "
      describe docker.version do
        its('Client.Version') { should cmp >= '1.12'}
      end

      describe docker.inspect('e0825339329b') do
        its(%w(HostConfig Privileged)) { should eq false }
        its(%w(HostConfig Privileged)) { should_not eq true }
      end

      docker.containers.ids.each do |id|
        describe docker.inspect(id) do
          its(%w(HostConfig Privileged)) { should eq false }
          its(%w(HostConfig Privileged)) { should_not eq true }
        end
      end

      describe file(docker.path) do
        it { should exist }
        it { should be_file }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
      end

      describe file(docker.socket) do
        it { should exist }
        it { should be_file }
        it { should be_owned_by 'root' }
        it { should be_grouped_into 'root' }
      end
    "

    def containers
      DockerContainerFilter.new(parse_containers)
    end

    def images
      DockerImageFilter.new(parse_images)
    end

    # returns the path of the docker service
    # only works for Debian 8+, Ubuntu 16.04+ and CentOS 7+ where systemd is installed
    def path
      # TODO: use exception, once https://github.com/chef/inspec/issues/1205 is fixed
      return nil unless is_systemd_system

      cmd = inspec.command('systemctl show -p FragmentPath docker.service')
      return nil if cmd.exit_status.to_i.nonzero?

      # parse data
      params = parse_systemd_values(cmd.stdout.chomp)

      # return the value
      params['FragmentPath']
    end

    # returns the docker socket
    # only works for Debian 8+, Ubuntu 16.04+ and CentOS 7+ where systemd is installed
    def socket
      # TODO: use exception, once https://github.com/chef/inspec/issues/1205 is fixed
      return nil unless is_systemd_system

      cmd = inspec.command('systemctl show -p FragmentPath docker.socket')
      return nil if cmd.exit_status.to_i.nonzero?

      # parse data
      params = parse_systemd_values(cmd.stdout.chomp)

      # return the value
      params['FragmentPath']
    end

    def to_s
      'Docker Host'
    end

    # returns the json output of `docker inspect`
    def inspect(id)
      return @inspect if defined?(@inspect)
      data = JSON.parse(inspec.command("docker inspect #{id}").stdout)
      # we'll return the first value only
      data = data[0] if data.is_a?(Array)
      @inspect = Hashie::Mash.new(data)
    end

    # returns the json object of the info
    def version
      return @version if defined?(@version)
      data = JSON.parse(inspec.command('docker version --format \'{{ json . }}\'').stdout)
      @version = Hashie::Mash.new(data)
    end

    private

    def parse_containers
      raw_containers = inspec.command('docker ps -a --no-trunc --format \'{{ json . }}\'').stdout
      ps = []
      # since docker is not outputting valid json, we need to parse each row
      raw_containers.each_line { |entry|
        j = JSON.parse(entry)
        # convert all keys to lower_case to work well with ruby and filter table
        j = j.map {|k, v|
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

    # checks if the system is Debian 8+, Ubuntu 16.04+ and RHEL 7+
    def is_systemd_system
      return true if inspec.os.redhat? && inspec.os.release.to_i >= 7
      return true if inspec.os.name == 'ubuntu' && inspec.os.release.to_f >= 16.04
      return true if inspec.os.name == 'debian' && inspec.os.release.to_i >= 8
      false
    end

    # returns parsed params
    def parse_systemd_values(stdout)
      SimpleConfig.new(
        stdout,
        assignment_re: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
        multiple_values: false,
      ).params
    end
  end

  class DockerContainer < Inspec.resource(1)
    name 'docker_container'
    desc ''
    example "
      describe docker_container('simple_container') do
        it { should exist }
        it { should be_running }
        its('command') { should eq '/bin/sh' }
      end
    "

    # TODO: we need to define if a simple string is a ID or NAME
    # TODO: handle short ids
    def initialize(opts = {})
      # fallback for simple strings
      if opts.is_a?(String)
        @opts = { name: opts }
      else
        @opts = opts
      end
    end

    def exist?
      !id.nil?
    end

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
      container_info.commands[0] if container_info.entries.length == 1
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
      'Docker Container'
    end

    private

    def container_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.containers.where { id == opts[:id] || names == opts[:name] }
    end
  end

  class DockerImage < Inspec.resource(1)
    name 'docker_image'
    desc ''
    example "
      describe docker_image(image: 'busybox:latest') do
        it { should exist }
      end
    "

    # TODO: handle short image ids
    def initialize(opts = {})
      @opts = opts

      # do sanitizion of input values
      @opts = { image: opts } if opts.is_a?(String)

      unless @opts[:image].nil?
        unless @opts[:image].index(':').nil?
          repo, tag = @opts[:image].split(':')
        else
          @opts[:repo] = @opts[:image]
          @opts[:image] = nil
        end
        @opts[:repo] ||= repo
        @opts[:tag] ||= tag
      end

      @opts[:tag] ||= 'latest'
      @opts[:image] ||= "#{@opts[:repo]}:#{@opts[:tag]}" unless @opts[:repo].nil?
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
      "Docker Image #{image}"
    end

    private

    def image_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.images.where { repository == opts[:repo] && tag == opts[:tag] }
    end
  end
end
