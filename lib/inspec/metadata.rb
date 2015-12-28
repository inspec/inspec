# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'logger'

module Inspec
  # Extract metadata.rb information
  class Metadata
    attr_reader :path
    attr_accessor :params
    def initialize(path, logger = nil)
      @path = path
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
        @logger.error("Missing profile #{field} in #{path}")
        is_valid = false
      end
      %w{ title summary maintainer copyright }.each do |field|
        next unless params[field.to_sym].nil?
        @logger.warn("Missing profile #{field} in #{path}")
        is_valid = false
      end
      is_valid && @missing_methods.empty?
    end

    def method_missing(sth, *args)
      @logger.warn "#{path} doesn't support: #{sth} #{args}"
      @missing_methods.push(sth)
    end

    def self.symbolize_keys(hash)
      hash.each_with_object({}) {|(k, v), h|
        v = symbolize_keys(v) if v.is_a?(Hash)
        h[k.to_sym] = v
      }
    end

    def self.from_file(path, profile_id, logger = nil)
      logger ||= Logger.new(nil)
      unless File.file?(path)
        logger.error "Can't find metadata file #{path}"
        return nil
      end

      pathname = Pathname.new(path).basename.to_s
      res = Metadata.new(pathname, logger)

      # found inspec.yml
      if pathname == 'inspec.yml'
        res.params = YAML.load_file(path)
      # if we found a deprecated metadata.rb
      elsif pathname == 'metadata.rb'
        res.instance_eval(File.read(path), path, 1)
      end

      res.params['name'] = profile_id.to_s unless profile_id.to_s.empty?
      res.params = symbolize_keys(res.params)

      res
    end
  end
end
