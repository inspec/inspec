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
      if !opts[:image].nil?
        if !opts[:image].index(':').nil?
          repo, tag = opts[:image].split(':')
        else
          opts[:repo] = opts[:image]
          opts[:image] = nil
        end
        opts[:repo] ||= repo
        opts[:tag] ||= tag
      end

      if !opts[:id].nil?
        if opts[:id].index(':').nil?
          opts[:id] = 'sha256:' + opts[:id]
        end
      end

      opts[:tag] ||= 'latest'
      opts[:image] ||= "#{opts[:repo]}:#{opts[:tag]}" unless opts[:repo].nil?
      opts
    end

    def image_info
      return @info if defined?(@info)
      opts = @opts
      @info = inspec.docker.images.where {
        (repository == opts[:repo] && tag == opts[:tag]) || (!id.nil? && !opts[:id].nil? && (id == opts[:id] || id.start_with?(opts[:id])))
      }
    end
  end
end
