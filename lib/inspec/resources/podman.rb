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

    def get_containers
      sub_cmd = "ps -a --no-trunc"
      output = run_command(sub_cmd)
      parse(output)
    end

    def get_images
      sub_cmd = "images -a --no-trunc"
      output = run_command(sub_cmd)
      parse(output)
    end

    def run_command(subcommand)
      result = inspec.command("podman #{subcommand} --format json")
      if result.stderr.empty?
        result.stdout
      else
        raise "Error while running command podman #{subcommand} #{result.stderr}"
      end
    end

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
      raise Inspec::Exceptions::ResourceFailed, "Unable to parse JSON: #{e.message}"
    end
  end

  class PodmanContainerFilter
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:commands,   field: "command")
      .register_column(:auto_remove,    field: "autoremove")
      .register_column(:created_at,     field: "createdat")
      .register_column(:ids,            field: "id")
      .register_column(:images,         field: "image")
      .register_column(:names,          field: "names", style: :simple)
      .register_column(:status,         field: "status", style: :simple         )
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

  class PodmanImageFilter
  #   {
  #     "Id": "3a66698e604003f7822a0c73e9da50e090fda9a99fe1f2e1e2e7fe796cc803d5",
  #     "ParentId": "",
  #     "RepoTags": null,
  #     "RepoDigests": [
  #         "registry.fedoraproject.org/fedora@sha256:2fda47c322448f24874f051e9f1f20ff5fb8c54c97391a68091e3941e1cc18dd",
  #         "registry.fedoraproject.org/fedora@sha256:38813cf0913241b7f13c7057e122f7c3cfa2e7c427dca3194f933d94612e280b"
  #     ],
  #     "Size": 168993849,
  #     "SharedSize": 0,
  #     "VirtualSize": 168993849,
  #     "Labels": {
  #         "license": "MIT",
  #         "name": "fedora",
  #         "vendor": "Fedora Project",
  #         "version": "36"
  #     },
  #     "Containers": 1,
  #     "Names": [
  #         "registry.fedoraproject.org/fedora:latest"
  #     ],
  #     "Digest": "sha256:38813cf0913241b7f13c7057e122f7c3cfa2e7c427dca3194f933d94612e280b",
  #     "History": [
  #         "registry.fedoraproject.org/fedora:latest"
  #     ],
  #     "Created": 1651831918,
  #     "CreatedAt": "2022-05-06T10:11:58Z"
  # }
    filter = FilterTable.create
    filter.register_custom_matcher(:exists?) { |x| !x.entries.empty? }
    filter.register_column(:ids,        field: "id")
      .register_column(:parent_ids,     field: "parentid")
      .register_column(:repo_tags,      field: "repotags")
      .register_column(:sizes,          field: "size")
      .register_column(:shared_sizes,   field: "shared_size")
      .register_column(:virtual_sizes,  field: "virtual_size")
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

