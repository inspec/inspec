require "inspec/resources/command"
require "inspec/utils/filter"
require "hashie/mash"

module Inspec::Resources
  class Podman < Inspec.resource(1)
    # Resource requires an internal name.
    name "podman"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    supports platform: "unix"

    desc "A resource to retrieve information about podman"

    example <<~EXAMPLE
      describe podman.containers do
        its('images') { should include "docker.io/library/ubuntu:latest" }
      end

      describe podman.images do
        its('names') { should_not include "docker.io/library/ubuntu:latest" }
      end

      describe podman.pods do
        its("ids") { should include "95cadbb84df71e6374fceb3fd89ee3b8f2c7e1a831062cd9cea7d0e3e4b1dbcc" }
      end

      describe podman.info.host do
        its("os") { should eq "linux"}
      end

      describe podman.version do
        its("Client.Version") { should eq "4.1.0"}
      end

      podman.containers.ids.each do |id|
        # call podman inspect for a specific container id
        describe podman.object(id) do
          its("State.OciVersion") { should eq "1.0.2-dev" }
          its("State.Running") { should eq true}
        end
      end
    EXAMPLE

    def containers
      PodmanContainerFilter.new(parse_containers)
    end

    def images
      PodmanImageFilter.new(parse_images)
    end

    def networks
      PodmanNetworkFilter.new(parse_networks)
    end

    def pods
      PodmanPodFilter.new(parse_pods)
    end

    def volumes
      PodmanVolumeFilter.new(parse_volumes)
    end

    def version
      return @version if defined?(@version)

      sub_cmd = "version --format json"
      output = run_command(sub_cmd)
      @version = Hashie::Mash.new(JSON.parse(output))
    rescue JSON::ParserError => _e
      Hashie::Mash.new({})
    end

    def info
      return @info if defined?(@info)

      sub_cmd = "info --format json"
      output = run_command(sub_cmd)
      @info = Hashie::Mash.new(JSON.parse(output))
    rescue JSON::ParserError => _e
      Hashie::Mash.new({})
    end

    # returns information about podman objects
    def object(id)
      return @inspect if defined?(@inspect)

      output = run_command("inspect #{id} --format json")
      data = JSON.parse(output)
      data = data[0] if data.is_a?(Array)
      @inspect = Hashie::Mash.new(data)
    rescue JSON::ParserError => _e
      Hashie::Mash.new({})
    end

    def to_s
      "Podman"
    end

    private

    # Calls the run_command method to get all podman containers and parse the command output.
    # Returns the parsed command output.
    def parse_containers
      labels = %w{ID Image ImageID Command CreatedAt RunningFor Status Pod Ports Size Names Networks Labels Mounts}
      parse_json_command(labels, "ps -a --no-trunc --size")
    end

    # Calls the run_command method to get all podman images and parse the command output.
    # Returns the parsed command output.
    def parse_images
      labels = %w{ID Repository Tag Size Digest CreatedAt CreatedSince History}
      parse_json_command(labels, "images -a --no-trunc")
    end

    # Calls the run_command method to get all podman network list and parse the command output.
    # Returns the parsed command output.
    def parse_networks
      labels = %w{ID Name Driver Labels Options IPAMOptions Created Internal IPv6Enabled DNSEnabled NetworkInterface Subnets}
      parse_json_command(labels, "network ls --no-trunc")
    end

    # Calls the run_command method to get all podman pod list and parse the command output.
    # Returns the parsed command output.
    def parse_pods
      sub_cmd = "pod ps --no-trunc --format json"
      output = run_command(sub_cmd)
      parse(output)
    end

    # Calls the run_command method to get all podman volume list and parse the command output.
    # Returns the parsed command output.
    def parse_volumes
      sub_cmd = "volume ls --format json"
      output = run_command(sub_cmd)
      parse(output)
    end

    # Runs the given podman command on the host machine on which podman is installed
    # Returns the command output or raises the command execution error.
    def run_command(subcommand)
      result = inspec.command("podman #{subcommand}")
      if result.stderr.empty?
        result.stdout
      else
        raise "Error while running command \'podman #{subcommand}\' : #{result.stderr}"
      end
    end

    def parse_json_command(labels, subcommand)
      # build command
      format = labels.map { |label| "\"#{label}\": {{json .#{label}}}" }
      raw = inspec.command("podman #{subcommand} --format '{#{format.join(", ")}}'").stdout
      output = []

      raw.each_line do |entry|
        # convert all keys to lower_case to work well with ruby and filter table
        row = JSON.parse(entry).map do |key, value|
          [key.downcase, value]
        end.to_h

        # ensure all keys are there
        row = ensure_keys(row, labels)
        output.push(row)
      end

      output
    rescue JSON::ParserError => _e
      warn "Could not parse `podman #{subcommand}` output"
      []
    end

    def ensure_keys(entry, labels)
      labels.each do |key|
        entry[key.downcase] = nil unless entry.key?(key.downcase)
      end
      entry
    end

    # Method to parse JDON content.
    # Returns: Parsed data.
    def parse(content)
      require "json" unless defined?(JSON)
      output = JSON.parse(content)
      parsed_output = []
      output.each do |entry|
        entry = entry.map do |k, v|
          [k.downcase, v]
        end.to_h
        parsed_output << entry
      end
      parsed_output
    rescue => e
      raise Inspec::Exceptions::ResourceFailed, "Unable to parse command JSON output: #{e.message}"
    end
  end

  # class for podman.containers plural resource
  class PodmanContainerFilter
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:commands,   field: "command")
      .register_column(:ids,            field: "id")
      .register_column(:created_at,     field: "createdat")
      .register_column(:images,         field: "image")
      .register_column(:names,          field: "names")
      .register_column(:status,         field: "status")
      .register_column(:image_ids,      field: "image_id")
      .register_column(:labels,         field: "labels", style: :simple)
      .register_column(:mounts,         field: "mounts")
      .register_column(:networks,       field: "networks")
      .register_column(:pods,           field: "pod")
      .register_column(:ports,          field: "ports")
      .register_column(:sizes,          field: "size")
      .register_column(:running_for,    field: "running_for")
      .register_custom_matcher(:running?) do |x|
        x.where { status.downcase.start_with?("up") }
      end
    filter.install_filter_methods_on_resource(self, :containers)

    attr_reader :containers
    def initialize(containers)
      @containers = containers
    end

    def to_s
      "Podman Containers"
    end

    def resource_id
      "Podman Containers"
    end
  end

  # class for podman.images plural resource
  class PodmanImageFilter
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:ids,       field: "id")
      .register_column(:repositories,  field: "repository")
      .register_column(:tags,          field: "tag")
      .register_column(:sizes,         field: "size")
      .register_column(:digests,       field: "digest")
      .register_column(:created_at,    field: "createdat")
      .register_column(:created_since, field: "createdsince")
      .register_column(:history,       field: "history")
    filter.install_filter_methods_on_resource(self, :images)

    attr_reader :images
    def initialize(images)
      @images = images
    end

    def to_s
      "Podman Images"
    end

    def resource_id
      "Podman Images"
    end
  end

  class PodmanNetworkFilter
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
      .register_column(:ids,                  field: "id")
      .register_column(:names,                field: "name")
      .register_column(:drivers,              field: "driver")
      .register_column(:network_interfaces,   field: "networkinterface")
      .register_column(:created,              field: "created")
      .register_column(:subnets,              field: "subnets")
      .register_column(:ipv6_enabled,         field: "ipv6enabled")
      .register_column(:internal,             field: "internal")
      .register_column(:dns_enabled,          field: "dnsenabled")
      .register_column(:ipam_options,         field: "ipamoptions")
      .register_column(:options,              field: "options")
      .register_column(:labels,               field: "labels")
    filter.install_filter_methods_on_resource(self, :networks)

    attr_reader :networks
    def initialize(networks)
      @networks = networks
    end

    def to_s
      "Podman Networks"
    end

    def resource_id
      "Podman Networks"
    end
  end

  class PodmanPodFilter
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
      .register_column(:ids,                  field: "id")
      .register_column(:cgroups,              field: "cgroup")
      .register_column(:containers,           field: "containers")
      .register_column(:created,              field: "created")
      .register_column(:infraids,             field: "infraid")
      .register_column(:names,                field: "name")
      .register_column(:namespaces,           field: "namespace")
      .register_column(:networks,             field: "networks")
      .register_column(:status,               field: "status")
      .register_column(:labels,               field: "labels")
    filter.install_filter_methods_on_resource(self, :pods)

    attr_reader :pods
    def initialize(pods)
      @pods = pods
    end

    def to_s
      "Podman Pods"
    end

    def resource_id
      "Podman Pods"
    end
  end

  class PodmanVolumeFilter
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
      .register_column(:names,              field: "name")
      .register_column(:drivers,            field: "driver")
      .register_column(:mountpoints,        field: "mountpoint")
      .register_column(:createdat,          field: "createdat")
      .register_column(:labels,             field: "labels")
      .register_column(:scopes,             field: "scope")
      .register_column(:options,            field: "options")
      .register_column(:mountcount,         field: "mountcount")
      .register_column(:needscopyup,        field: "needscopyup")
      .register_column(:needschown,         field: "needschown")
    filter.install_filter_methods_on_resource(self, :volumes)

    attr_reader :volumes
    def initialize(volumes)
      @volumes = volumes
    end

    def to_s
      "Podman Volumes"
    end

    def resource_id
      "Podman Volumes"
    end
  end
end
