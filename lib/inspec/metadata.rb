# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'logger'

module Inspec
  # Extract metadata.rb information
  class Metadata
    attr_reader :ref
    attr_accessor :params
    def initialize(ref, logger = nil)
      @ref = ref
      @logger = logger || Logger.new(nil)
      @params = {}
      @missing_methods = []
    end

    %w{
      name
      title
      maintainer
      maintainer_email
      copyright
      copyright_email
      license
      summary
      description
      version
    }.each do |name|
      define_method name.to_sym do |arg|
        params[name.to_sym] = arg
      end
    end

    def supports(sth, version = nil)
      params[:supports] ||= []
      params[:supports].push(
        {
          os:      sth,
          version: version,
        },
      )
    end

    def valid?
      is_valid = true
      %w{ name version }.each do |field|
        next unless params[field.to_sym].nil?
        @logger.error("Missing profile #{field} in #{ref}")
        is_valid = false
      end
      %w{ title summary maintainer copyright }.each do |field|
        next unless params[field.to_sym].nil?
        @logger.warn("Missing profile #{field} in #{ref}")
        is_valid = false
      end
      is_valid && @missing_methods.empty?
    end

    def method_missing(sth, *args)
      @logger.warn "#{ref} doesn't support: #{sth} #{args}"
      @missing_methods.push(sth)
    end

    def self.symbolize_keys(hash)
      hash.each_with_object({}) {|(k, v), h|
        v = symbolize_keys(v) if v.is_a?(Hash)
        h[k.to_sym] = v
      }
    end

    def self.finalize(metadata, profile_id)
      metadata.params['name'] = profile_id.to_s unless profile_id.to_s.empty?
      metadata.params = symbolize_keys(metadata.params)
      metadata
    end

    def self.from_yaml(ref, contents, profile_id, logger = nil)
      res = Metadata.new(ref, logger)
      res.params = YAML.load(contents)
      finalize(res, profile_id)
    end

    def self.from_ruby(ref, contents, profile_id, logger = nil)
      res = Metadata.new(ref, logger)
      res.instance_eval(contents, ref, 1)
      finalize(res, profile_id)
    end

    def self.from_ref(ref, contents, profile_id, logger = nil)
      case File.basename(ref)
      when 'inspec.yml'
        from_yaml(ref, contents, profile_id, logger)
      when 'metadata.rb'
        from_ruby(ref, contents, profile_id, logger)
      else
        logger ||= Logger.new(nil)
        logger.error "Don't know how to handle metadata in #{ref}"
        nil
      end
    end

    def self.from_file(path, profile_id, logger = nil)
      unless File.file?(path)
        logger ||= Logger.new(nil)
        logger.error "Can't find metadata file #{path}"
        return nil
      end

      from_ref(File.basename(path), File.read(path), profile_id, logger)
    end
  end
end
