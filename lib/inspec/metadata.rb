# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'logger'
require 'rubygems/version'
require 'rubygems/requirement'
require 'semverse'

module Inspec
  # Extract metadata.rb information
  class Metadata # rubocop:disable Metrics/ClassLength
    attr_reader :ref
    attr_accessor :params, :content
    def initialize(ref, logger = nil)
      @ref = ref
      @logger = logger || Logger.new(nil)
      @content = ''
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

    def dependencies
      params[:depends] || []
    end

    def supports(sth, version = nil)
      # Ignore supports with metadata.rb. This file is legacy and the way it
      # it handles `supports` deprecated. A deprecation warning will be printed
      # already.
    end

    def is_supported?(os, entry)
      name = entry[:'os-name'] || entry[:os]
      family = entry[:'os-family']
      release = entry[:release]

      # return true if the backend matches the supported OS's
      # fields act as masks, i.e. any value configured for os-name, os-family,
      # or release must be met by the backend; any field that is nil acts as
      # a glob expression i.e. is true

      # os name is both saved in :family and :name, so check both
      name_ok = name.nil? ||
                os[:name] == name || os[:family] == name

      family_check = family.to_s + '?'
      family_ok = family.nil? || os[:family] == family ||
                  (
                    os.respond_to?(family_check) &&
                    # this call will return true if the family matches
                    os.method(family_check).call
                  )

      # ensure we do have a string if we have a non-nil value eg. 16.06
      release_ok = release.nil? || os[:release] == release

      # we want to make sure that all matchers are true
      name_ok && family_ok && release_ok
    end

    def inspec_requirement
      inspec = params[:supports].find { |x| !x[:inspec].nil? } || {}
      Gem::Requirement.create(inspec[:inspec])
    end

    def supports_runtime?
      running = Gem::Version.new(Inspec::VERSION)
      inspec_requirement.satisfied_by?(running)
    end

    def supports_transport?(backend)
      # with no supports specified, always return true, as there are no
      # constraints on the supported backend; it is equivalent to putting
      # all fields into accept-all mode
      return true if params[:supports].empty?

      found = params[:supports].find do |entry|
        is_supported?(backend.os, entry)
      end

      # finally, if we found a supported entry, we are good to go
      !found.nil?
    end

    # return all warn and errors
    def valid
      errors = []
      warnings = []

      %w{ name version }.each do |field|
        next unless params[field.to_sym].nil?
        errors.push("Missing profile #{field} in #{ref}")
      end

      # if version is set, ensure it is correct
      if !params[:version].nil? && !valid_version?(params[:version])
        errors.push('Version needs to be in SemVer format')
      end

      %w{ title summary maintainer copyright }.each do |field|
        next unless params[field.to_sym].nil?
        warnings.push("Missing profile #{field} in #{ref}")
      end

      [errors, warnings]
    end

    # returns true or false
    def valid?
      errors, _warnings = valid
      errors.empty? && unsupported.empty?
    end

    def valid_version?(value)
      Semverse::Version.new(value)
      true
    rescue Semverse::InvalidVersionFormat
      false
    end

    def method_missing(sth, *args)
      @logger.warn "#{ref} doesn't support: #{sth} #{args}"
      @missing_methods.push(sth)
    end

    def unsupported
      @missing_methods
    end

    def self.symbolize_keys(obj)
      return obj.map { |i| symbolize_keys(i) } if obj.is_a?(Array)
      return obj unless obj.is_a?(Hash)

      obj.each_with_object({}) {|(k, v), h|
        v = symbolize_keys(v) if v.is_a?(Hash)
        v = symbolize_keys(v) if v.is_a?(Array)
        h[k.to_sym] = v
      }
    end

    def self.finalize_supports_elem(elem, logger)
      case x = elem
      when Hash
        x[:release] = x[:release].to_s if x[:release]
        x
      when Array
        logger.warn(
          'Failed to read supports entry that is an array. Please use '\
          'the `supports: {os-family: xyz}` syntax.',
        )
        nil
      when nil then nil
      else
        logger ||= Logger.new(nil)
        logger.warn(
          "Do not use deprecated `supports: #{x}` syntax. Instead use:\n"\
          "supports:\n  - os-family: #{x}\n\n")
        { :'os-family' => x }
      end
    end

    def self.finalize_supports(supports, logger)
      case x = supports
      when Hash   then [finalize_supports_elem(x, logger)]
      when Array  then x.map { |e| finalize_supports_elem(e, logger) }.compact
      when nil    then []
      else
        logger ||= Logger.new(nil)
        logger.warn(
          "Do not use deprecated `supports: #{x}` syntax. Instead use:\n"\
          "supports:\n  - os-family: #{x}\n\n")
        [{ :'os-family' => x }]
      end
    end

    def self.finalize_name(metadata, profile_id, original_target)
      # profile_id always overwrites whatever already exists as the name
      unless profile_id.to_s.empty?
        metadata.params[:name] = profile_id.to_s
        return
      end

      # don't overwrite an existing name
      return unless metadata.params[:name].nil?

      # if there's a title, there is no need to set a name too
      return unless metadata.params[:title].nil?

      # create a new name based on the original target if it exists
      metadata.params[:name] = "tests from #{original_target}" unless original_target.to_s.empty?
    end

    def self.finalize(metadata, profile_id, options, logger = nil)
      return nil if metadata.nil?
      param = metadata.params || {}
      options ||= {}
      param['version'] = param['version'].to_s unless param['version'].nil?
      metadata.params = symbolize_keys(param)
      metadata.params[:supports] = finalize_supports(metadata.params[:supports], logger)
      finalize_name(metadata, profile_id, options[:target])

      metadata
    end

    def self.from_yaml(ref, content, profile_id, logger = nil)
      res = Metadata.new(ref, logger)
      res.params = YAML.load(content)
      res.content = content
      finalize(res, profile_id, {}, logger)
    end

    def self.from_ruby(ref, content, profile_id, logger = nil)
      res = Metadata.new(ref, logger)
      res.instance_eval(content, ref, 1)
      res.content = content
      finalize(res, profile_id, {}, logger)
    end

    def self.from_ref(ref, content, profile_id, logger = nil)
      # NOTE there doesn't have to exist an actual file, it may come from an
      # archive (i.e., content)
      case File.basename(ref)
      when 'inspec.yml'
        from_yaml(ref, content, profile_id, logger)
      when 'metadata.rb'
        from_ruby(ref, content, profile_id, logger)
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
