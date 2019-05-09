#
# Copyright 2017, Christoph Hartmann
#

require 'inspec/utils/filter'
require 'hashie/mash'

module Inspec::Resources
  class DockerContainerFilter
    # use filtertable for containers
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:commands,       field: 'command')
          .register_column(:ids,            field: 'id')
          .register_column(:images,         field: 'image')
          .register_column(:labels,         field: 'labels', style: :simple)
          .register_column(:local_volumes,  field: 'localvolumes')
          .register_column(:mounts,         field: 'mounts')
          .register_column(:names,          field: 'names')
          .register_column(:networks,       field: 'networks')
          .register_column(:ports,          field: 'ports')
          .register_column(:running_for,    field: 'runningfor')
          .register_column(:sizes,          field: 'size')
          .register_column(:status,         field: 'status')
          .register_custom_matcher(:running?) { |x|
            x.where { status.downcase.start_with?('up') }
          }
    filter.install_filter_methods_on_resource(self, :containers)

    attr_reader :containers
    def initialize(containers)
      @containers = containers
    end
  end

  class DockerImageFilter
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:ids,           field: 'id')
          .register_column(:repositories,  field: 'repository')
          .register_column(:tags,          field: 'tag')
          .register_column(:sizes,         field: 'size')
          .register_column(:digests,       field: 'digest')
          .register_column(:created,       field: 'createdat')
          .register_column(:created_since, field: 'createdsize')
    filter.install_filter_methods_on_resource(self, :images)

    attr_reader :images
    def initialize(images)
      @images = images
    end
  end

  class DockerPluginFilter
    filter = FilterTable.create
    filter.add(:ids,      field: 'id')
          .add(:names,    field: 'name')
          .add(:versions, field: 'version')
          .add(:enabled,  field: 'enabled')
    filter.connect(self, :plugins)

    attr_reader :plugins
    def initialize(plugins)
      @plugins = plugins
    end
  end

  class DockerServiceFilter
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:ids,      field: 'id')
          .register_column(:names,    field: 'name')
          .register_column(:modes,    field: 'mode')
          .register_column(:replicas, field: 'replicas')
          .register_column(:images,   field: 'image')
          .register_column(:ports,    field: 'ports')
    filter.install_filter_methods_on_resource(self, :services)

    attr_reader :services
    def initialize(services)
      @services = services
    end
  end

  # This resource helps to parse information from the docker host
  # For compatability with Serverspec we also offer the following resouses:
  # - docker_container
  # - docker_image
  class Docker < Inspec.resource(1)
    name 'docker'
    supports platform: 'unix'
    desc "
      A resource to retrieve information about docker
    "

    example <<~EXAMPLE
      describe docker.containers do
        its('images') { should_not include 'u12:latest' }
      end

      describe docker.images do
        its('repositories') { should_not include 'inssecure_image' }
      end

      describe docker.plugins.where { name == 'rexray/ebs' } do
        it { should exist }
      end

      describe docker.services do
        its('images') { should_not include 'inssecure_image' }
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
    EXAMPLE

    def containers
      DockerContainerFilter.new(parse_containers)
    end

    def images
      DockerImageFilter.new(parse_images)
    end

    def plugins
      DockerPluginFilter.new(parse_plugins)
    end

    def services
      DockerServiceFilter.new(parse_services)
    end

    def version
      return @version if defined?(@version)
      data = {}
      cmd = inspec.command('docker version --format \'{{ json . }}\'')
      data = JSON.parse(cmd.stdout) if cmd.exit_status == 0
      @version = Hashie::Mash.new(data)
    rescue JSON::ParserError => _e
      return Hashie::Mash.new({})
    end

    def info
      return @info if defined?(@info)
      data = {}
      # docke info format is only supported for Docker 17.03+
      cmd = inspec.command('docker info --format \'{{ json . }}\'')
      data = JSON.parse(cmd.stdout) if cmd.exit_status == 0
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

    def parse_json_command(labels, subcommand)
      # build command
      format = labels.map { |label| "\"#{label}\": {{json .#{label}}}" }
      raw = inspec.command("docker #{subcommand} --format '{#{format.join(', ')}}'").stdout
      output = []
      # since docker is not outputting valid json, we need to parse each row
      raw.each_line { |entry|
        # convert all keys to lower_case to work well with ruby and filter table
        row = JSON.parse(entry).map { |key, value|
          [key.downcase, value]
        }.to_h

        # ensure all keys are there
        row = ensure_keys(row, labels)

        # strip off any linked container names
        # Depending on how it was linked, the actual container name may come before
        # or after the link information, so we'll just look for the first name that
        # does not include a slash since that is not a valid character in a container name
        if row['names']
          row['names'] = row['names'].split(',').find { |c| !c.include?('/') }
        end

        # Split labels on ',' or set to empty array
        # Allows for `docker.containers.where { labels.include?('app=redis') }`
        row['labels'] = row.key?('labels') ? row['labels'].split(',') : []

        output.push(row)
      }

      output
    rescue JSON::ParserError => _e
      warn "Could not parse `docker #{subcommand}` output"
      []
    end

    def parse_containers
      # @see https://github.com/moby/moby/issues/20625, works for docker 1.13+
      # raw_containers = inspec.command('docker ps -a --no-trunc --format \'{{ json . }}\'').stdout
      # therefore we stick with older approach
      labels = %w{Command CreatedAt ID Image Labels Mounts Names Ports RunningFor Size Status}

      # Networks LocalVolumes work with 1.13+ only
      if !version.empty? && Gem::Version.new(version['Client']['Version']) >= Gem::Version.new('1.13')
        labels.push('Networks')
        labels.push('LocalVolumes')
      end
      parse_json_command(labels, 'ps -a --no-trunc')
    end

    def parse_services
      parse_json_command(%w{ID Name Mode Replicas Image Ports}, 'service ls')
    end

    def ensure_keys(entry, labels)
      labels.each { |key|
        entry[key.downcase] = nil if !entry.key?(key.downcase)
      }
      entry
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

    def parse_plugins
      plugins = inspec.command('docker plugin ls --format \'{"id": {{json .ID}}, "name": "{{ with split .Name ":"}}{{index . 0}}{{end}}", "version": "{{ with split .Name ":"}}{{index . 1}}{{end}}", "enabled": {{json .Enabled}} }\'').stdout
      c_plugins = []
      plugins.each_line { |entry|
        c_plugins.push(JSON.parse(entry))
      }
      c_plugins
    rescue JSON::ParserError => _e
      warn 'Could not parse `docker plugin ls` output'
      []
    end
  end
end
