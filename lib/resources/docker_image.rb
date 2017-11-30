# encoding: utf-8
#
# Copyright 2017, Christoph Hartmann
#
# author: Christoph Hartmann
# author: Patrick Muench
# author: Dominik Richter

module Inspec::Resources
  class DockerImage < Inspec.resource(1)
    name 'docker_image'
    desc ''
    example "
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
    "

    def initialize(opts = {})
      # do sanitizion of input values
      o = opts.dup
      o = { image: opts } if opts.is_a?(String)
      @opts = sanitize_options(o)
    end

    def exist?
      image_info.exists?
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
      img = @opts[:image] || @opts[:id]
      "Docker Image #{img}"
    end

    private

    def sanitize_options(opts)
      opts.merge!(parse_components_from_image(opts[:image]))

      # assume a "latest" tag if we don't have one
      opts[:tag] ||= 'latest'

      # if the ID isn't nil and doesn't contain a hash indicator (indicated by the presence
      # of a colon, which separates the indicator from the actual hash), we assume it's sha256.
      opts[:id] = 'sha256:' + opts[:id] unless opts[:id].nil? || opts[:id].include?(':')

      # Assemble/reassemble the image from the repo and tag
      opts[:image] = "#{opts[:repo]}:#{opts[:tag]}" unless opts[:repo].nil?

      # return the santized opts back to the caller
      opts
    end

    def image_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.images.where {
        (repository == opts[:repo] && tag == opts[:tag]) || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id])))
      }
    end

    def parse_components_from_image(image_string)
      # if the user did not supply an image string, they likely supplied individual
      # option parameters, such as repo and tag. Return empty data back to the caller.
      return {} if image_string.nil?

      first_colon = image_string.index(':') || -1
      first_slash = image_string.index('/') || -1

      if image_string.count(':') == 2
        # If there are two colons in the image string, it contains a repo-with-port and a tag.
        # example: localhost:5000/chef/inspec:1.46.3
        partitioned_string = image_string.rpartition(':')
        repo = partitioned_string.first
        tag = partitioned_string.last
      elsif image_string.count(':') == 1 && first_colon < first_slash
        # If there's one colon in the image string, and it comes before a forward-slash,
        # it contains a repo-with-port but no tag.
        # example: localhost:5000/ubuntu
        repo = image_string
        tag = nil
      else
        # If there's one colon in the image string and it doesn't preceed a slash, or if
        # there is no colon at all, then it separates the repo from the tag, if there is a tag.
        # example: chef/inspec:1.46.3
        # example: chef/inspec
        # example: ubuntu:14.04
        repo, tag = image_string.split(':')
      end

      # return the repo and tag parsed from the string, which can be merged into
      # the rest of the user-supplied options
      { repo: repo, tag: tag }
    end
  end
end
