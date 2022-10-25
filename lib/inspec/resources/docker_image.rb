#
# Copyright 2017, Christoph Hartmann

require "inspec/resources/docker"
require_relative "docker_object"

module Inspec::Resources
  class DockerImage < Inspec.resource(1)
    include Inspec::Resources::DockerObject

    name "docker_image"
    supports platform: "unix"
    desc ""
    example <<~EXAMPLE
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
    EXAMPLE

    def initialize(opts = {})
      # do sanitizion of input values
      o = opts.dup
      o = { image: opts } if opts.is_a?(String)
      @opts = sanitize_options(o)
    end

    def image
      "#{repo}:#{tag}" if object_info.entries.size == 1
    end

    def repo
      object_info.repositories[0] if object_info.entries.size == 1
    end

    def tag
      object_info.tags[0] if object_info.entries.size == 1
    end

    # method_missing handles when hash_keys are invoked to check information obtained on docker inspect [image_name]
    def method_missing(*hash_keys)
      # User can test the low-level inspect information in three ways:
      # Way 1: Serverspec style: its(['Config.Cmd']) { should include some_value }
      #        here, the value for hash_keys recieved is [:[], "Config.Cmd"]
      # Way 2: InSpec style: its(['Config','Cmd']) { should include some_value }
      #        here, the value for hash_keys recieved is [:[], "Config", "Cmd"]
      # Way 3: Mix of both: its(['GraphDriver.Data','MergedDir']) { should include some_value }
      #        here, the value for hash_keys recieved is [:[], "GraphDriver.Data", "MergedDir"]

      # hash_keys are passed to this method to evaluate the value
      image_hash_inspection(hash_keys)
    end

    # inspection property allows to test any of the hash key-value pairs as part of the image_inspect_info
    def inspection
      image_inspect_info
    end

    def to_s
      img = @opts[:image] || @opts[:id]
      "Docker Image #{img}"
    end

    def resource_id
      object_info.ids[0] || @opts[:id] || @opts[:image] || ""
    end

    private

    def sanitize_options(opts)
      opts.merge!(parse_components_from_image(opts[:image]))

      # assume a "latest" tag if we don't have one
      opts[:tag] ||= "latest"

      # if the ID isn't nil and doesn't contain a hash indicator (indicated by the presence
      # of a colon, which separates the indicator from the actual hash), we assume it's sha256.
      opts[:id] = "sha256:" + opts[:id] unless opts[:id].nil? || opts[:id].include?(":")

      # Assemble/reassemble the image from the repo and tag
      opts[:image] = "#{opts[:repo]}:#{opts[:tag]}" unless opts[:repo].nil?

      # return the santized opts back to the caller
      opts
    end

    def object_info
      return @info if defined?(@info)

      opts = @opts
      @info = inspec.docker.images.where do
        (repository == opts[:repo] && tag == opts[:tag]) || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id])))
      end
    end

    # image_inspect_info returns the complete inspect hash_values of the image
    def image_inspect_info
      return @inspect_info if defined?(@inspect_info)

      @inspect_info = inspec.docker.object(@opts[:image] || (!@opts[:id].nil? && @opts[:id]))
    end

    # image_hash_inspection formats the input hash_keys and checks if any value exists for such keys in @inspect_info(image_inspect_info)
    def image_hash_inspection(hash_keys)
      # The hash_keys recieved are in three formats as mentioned in method_missing
      # The hash_keys recieved must be in array format [] and the zeroth index must be :[]
      # Check for the conditions and remove the zeroth element from the hash_keys

      hash_keys.shift if hash_keys.is_a?(Array) && hash_keys[0] == :[]

      # When received hash_keys in Serverspec style or mix of both
      # The hash_keys are to be splitted at '.' (dot) and flatten it so that it doesn't become array of arrays
      # After splitting and flattening is done, hash_keys is now an array with individual keys
      hash_keys = hash_keys.map { |key| key.split(".") }.flatten

      # image_inspect_info returns the complete inspect hash_values of the image
      # dig() finds the nested value specified by the sequence of the key object by calling dig at each step.
      # hash_keys is the key object. If one of the key is bad, value will be nil.
      hash_value = image_inspect_info.dig(*hash_keys)

      # If one of the key is bad, hash_value will be nil, so raise exception which throws it in rescue block
      # else return hash_value
      raise Inspec::Exceptions::ResourceFailed if hash_value.nil?

      hash_value
    rescue
      raise Inspec::Exceptions::ResourceFailed, "#{hash_keys.join(".")} is not a valid key for your image or has nil value."
    end
  end
end
