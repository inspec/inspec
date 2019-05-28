module Inspec::Resources
  class DockerPlugin < Inspec.resource(1)
    name 'docker_plugin'
    supports platform: 'unix'
    desc 'Retrieves info about docker plugins'
    example <<~EXAMPLE
      describe docker_plugin('rexray/ebs') do
        it { should exist }
        its('id') { should_not eq '0ac30b93ad40' }
        its('version') { should eq '0.11.1' }
        it { should be_enabled }
      end

      describe docker_plugin('alpine:latest') do
        it { should exist }
      end

      describe docker_plugin(id: '4a415e366388') do
        it { should exist }
      end
    EXAMPLE

    def initialize(opts = {})
      # do sanitizion of input values
      o = opts.dup
      o = { name: opts } if opts.is_a?(String)
      @opts = o
    end

    def exist?
      object_info.entries.size == 1
    end

    def enabled?
      object_info.enabled[0]
    end

    def id
      object_info.ids[0] if object_info.entries.size == 1
    end

    def version
      object_info.versions[0] if object_info.entries.size == 1
    end

    def to_s
      plugin = @opts[:name] || @opts[:id]
      "Docker plugin #{plugin}"
    end

    private

    def object_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.plugins.where {
        (name == opts[:name]) || (!id.nil? && !opts[:id].nil? && (id == opts[:id]))
      }
    end
  end
end
