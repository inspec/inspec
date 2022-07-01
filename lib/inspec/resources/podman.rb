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
    EXAMPLE

    def containers
      PodmanContainerFilter.new(get_containers)
    end

    def images
      PodmanImageFilter.new(get_images)
    end

    def to_s
      "Podman"
    end

    private

    # Calls the run_command method to get all podman containers and parse the json command output.
    # Returns the parsed command output.
    def get_containers
      sub_cmd = "ps -a --no-trunc"
      output = run_command(sub_cmd)
      parse(output)
    end

    # Calls the run_command method to get all podman images and parse the json command output.
    # Returns the parsed command output.
    def get_images
      sub_cmd = "images -a --no-trunc"
      output = run_command(sub_cmd)
      parse(output)
    end

    # Runs the given podman command on the host machine on which podman is installed
    # Returns the command output or raises the command execution error.
    def run_command(subcommand)
      result = inspec.command("podman #{subcommand} --format json")
      if result.stderr.empty?
        result.stdout
      else
        raise "Error while running command podman #{subcommand} #{result.stderr}"
      end
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
      raise Inspec::Exceptions::ResourceFailed, "Unable to parse command output JSON: #{e.message}"
    end
  end

  # class for podman.containers plural resource
  class PodmanContainerFilter
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:commands,   field: "command")
      .register_column(:auto_remove,    field: "autoremove")
      .register_column(:created_at,     field: "createdat")
      .register_column(:ids,            field: "id")
      .register_column(:images,         field: "image")
      .register_column(:names,          field: "names", style: :simple)
      .register_column(:status,         field: "status", style: :simple)
      .register_column(:exited,         field: "exited")
      .register_column(:exit_code,      field: "exitcode")
      .register_column(:image_ids,      field: "imageid")
      .register_column(:labels,         field: "labels")
      .register_column(:mounts,         field: "mounts", style: :simple)
      .register_column(:namespaces,     field: "namespaces", style: :simple)
      .register_column(:pids,           field: "pid")
      .register_column(:pods,           field: "pod")
      .register_column(:podnames,       field: "podname")
      .register_column(:ports,          field: "ports")
      .register_column(:sizes,          field: "size")
      .register_column(:started_at,     field: "startedat")
      .register_column(:states,         field: "state")
      .register_column(:created,        field: "created")
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
    filter.register_column(:ids,        field: "id")
      .register_column(:parent_ids,     field: "parentid")
      .register_column(:repo_tags,      field: "repotags")
      .register_column(:sizes,          field: "size")
      .register_column(:shared_sizes,   field: "sharedsize")
      .register_column(:virtual_sizes,  field: "virtualsize")
      .register_column(:labels,         field: "labels")
      .register_column(:containers,     field: "containers")
      .register_column(:names,          field: "names", style: :simple)
      .register_column(:digests,        field: "digest")
      .register_column(:history,        field: "histroy")
      .register_column(:created,        field: "created")
      .register_column(:created_at,     field: "createdat")
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
end
