require "inspec/resources/podman"
require_relative "docker_object"

# Change module if required
module Inspec::Resources
  class PodmanContainer < Inspec.resource(1)
    include Inspec::Resources::DockerObject
    name "podman_container"
    supports platform: "unix"

    desc "Inspec core resource to retrieve information about podman container"

    example <<~EXAMPLE
        describe podman_container("sweet_mendeleev") do
          it { should exist }
          it { should be_running }
          its("id") { should eq "591270d8d80d26671fd6ed622f367fbe19004d16e3b519c292313feb5f22e7f7" }
          its("image") { should eq "docker.io/library/nginx:latest" }
          its("labels") { should include "maintainer"=>"NGINX Docker Maintainers <docker-maint@nginx.com>" }
          its("ports") { should eq nil }
        end

        describe podman_container(id: "591270d8d80d2667") do
          it { should exist }
          it { should be_running }
        end
    EXAMPLE

    def initialize(opts = {})
      skip_resource "The `podman_container` resource is not yet available on your OS." unless inspec.os.unix?

      # if a string is provided, we expect it is the name
      if opts.is_a?(String)
        @opts = { name: opts }
      else
        @opts = opts
      end
    end

    def running?
      status.downcase.start_with?("up") if object_info.entries.length == 1
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

      object_info.commands[0]
    end

    def image
      object_info.images[0] if object_info.entries.length == 1
    end

    def resource_id
      object_info.ids[0] || @opts[:id] || @opts[:name] || ""
    end

    def to_s
      name = @opts[:name] || @opts[:id]
      "Podman Container #{name}"
    end

    private

    def object_info
      return @info if defined?(@info)

      opts = @opts
      @info = inspec.podman.containers.where { names == opts[:name] || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id]))) }
    end
  end
end
