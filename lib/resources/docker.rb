# encoding: utf-8
#
# Copyright 2017, Christoph Hartmann
#
# author: Christoph Hartmann
# author: Dominik Richter
# author: Patrick Muench

require 'yaml'

module Inspec::Resources
  # This resource helps to parse information from the docker daemon
  class Docker < Inspec.resource(1)
    name 'docker'

    desc "
      A resource to retrieve information about docker
    "

    example "
      describe docker.version do
        it { should cmp >= '1.12'}
      end

      describe docker.inspect('e0825339329b') do
        its(%w(HostConfig Privileged)) { should eq false }
        its(%w(HostConfig Privileged)) { should_not eq true }
      end

      docker.ps.each do |id|
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

    # return a list on container ids
    def ps_ids
      inspec.command('docker ps --format "{{.ID}}"').stdout.split
    end

    def ps
      raw_containers = inspec.command('docker ps -a --no-trunc --format \'{{ json . }}\'').stdout
      ps = []
      # since docker is not outputting valid json, we need to parse each row
      raw_containers.each_line { |entry|
        ps.push(JSON.parse(entry))
      }
      ps
    end

    def images
      raw_images = inspec.command('docker images -a --no-trunc --format \'{ "id": {{json .ID}}, "repository": {{json .Repository}}, "tag": {{json .Tag}}, "size": {{json .Size}}, "digest": {{json .Digest}}, "createdat": {{json .CreatedAt}}, "createdsize": {{json .CreatedSince}} }\'').stdout
      c_images = []
      raw_images.each_line { |entry|
        c_images.push(JSON.parse(entry))
      }
      c_images
    end

    # returns the json output of `docker inspect`
    def inspect(id)
      data = JSON.parse(inspec.command("docker inspect #{id}").stdout)
      # we'll return the first value only
      return data[0] if data.is_a?(Array)
      data
    end

    # returns the json object of the info
    def version
      JSON.parse(inspec.command('docker version --format \'{{ json . }}\'').stdout)
    end

    # version returns the daemon version
    def server_version
      return if version.nil? || version['Server'].nil?
      version['Server']['Version']
    end

    # client_version returns the version of the CLI client
    def client_version
      return if version.nil? || version['Server'].nil?
      version['Client']['Version']
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

    private

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

    # attr_reader :name
    def initialize(opts = {})
      # fallback for simple strings
      @opts = { name: opts } if opts.is_a?(String)
    end

    def exist?
      !(info.nil? || info['ID'].nil?)
    end

    def id
      info['ID'] unless info.nil?
    end

    def running?
      info['Status'].downcase.start_with?('up') unless info.nil?
    end

    def labels
      [info['Labels']].flatten.reject(&:empty?) unless info.nil?
    end

    def ports
      [info['Ports']].flatten.reject(&:empty?) unless info.nil?
    end

    def command
      # remove quotes
      info['Command'].slice(1, info['Command'].length - 2) unless info.nil?
    end

    def image
      info['Image'] unless info.nil?
    end

    def repo
      info['Image'].split(':')[0] unless info.nil?
    end

    def tag
      info['Image'].split(':')[1] unless info.nil?
    end

    def to_s
      "Docker Container #{image}"
    end

    private

    def info
      return @info if defined?(@info)
      # search for container
      inspec.docker.ps.each { |container|
        @info = container if [container['Names']].flatten.compact.include?(@opts[:name])
        @info = container if !container['ID'].nil? && container['ID'] == @opts[:id]
      }
      @info
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

    # attr_reader :name
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

      # if id or repo is not available, we need to fail
      return skip_resource 'Id or repository is missing for docker_image' if @opts[:repo].nil? && @opts[:id].nil?
    end

    def exist?
      !(info.nil? || info['id'].nil?)
    end

    def id
      info['id'] unless info.nil?
    end

    def image
      "#{info['repository']}:#{info['tag']}" unless info.nil?
    end

    def repo
      info['repository'] unless info.nil?
    end

    def tag
      info['tag'] unless info.nil?
    end

    def to_s
      "Docker Image #{image}"
    end

    private

    def info
      return @info if defined?(@info)
      # search for image
      inspec.docker.images.each { |image|
        if [image['repository']].flatten.compact.include?(@opts[:repo]) &&
           [image['tag']].flatten.compact.include?(@opts[:tag])
          @info = image
        end
        @info = image if !image['id'].nil? && image['id'] == @opts[:id]
      }
      @info
    end
  end
end
