# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'logger'

module Inspec
  # Extract metadata.rb information
  class Metadata # rubocop:disable Metrics/ClassLength
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
      # Ignore supports with metadata.rb. This file is legacy and the way it
      # it handles `supports` deprecated. A deprecation warning will be printed
      # already.
    end

    def is_supported(os, entry)
      name, family, release = support_fields(entry)

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

      release_ok = release.nil? || os[:release] == release

      # we want to make sure that all matchers are true
      name_ok && family_ok && release_ok
    end

    def support_fields(entry)
      if entry.is_a?(Hash)
        try_support = self.class.symbolize_keys(entry)
        name = try_support[:'os-name'] || try_support[:os]
        family = try_support[:'os-family']
        release = try_support[:release]
      elsif entry.is_a?(String)
        @logger.warn(
          "Do not use deprecated `supports: #{entry}` syntax. Instead use "\
          "`supports: {os-family: #{entry}}`.")
        family = entry
      end

      [name, family, release]
    end

    def supports_transport?(backend)
      # make sure the supports field is always an array
      supp = params[:supports]
      supp = supp.is_a?(Hash) ? [supp] : Array(supp)

      # with no supports specified, always return true, as there are no
      # constraints on the supported backend; it is equivalent to putting
      # all fields into accept-all mode
      return true if supp.empty?

      found = supp.find do |entry|
        is_supported(backend.os, entry)
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

    def method_missing(sth, *args)
      @logger.warn "#{ref} doesn't support: #{sth} #{args}"
      @missing_methods.push(sth)
    end

    def unsupported
      @missing_methods
    end

    def self.symbolize_keys(hash)
      hash.each_with_object({}) {|(k, v), h|
        v = symbolize_keys(v) if v.is_a?(Hash)
        h[k.to_sym] = v
      }
    end

    def self.finalize(metadata, profile_id)
      metadata.params['name'] = profile_id.to_s unless profile_id.to_s.empty?
      metadata.params = symbolize_keys(metadata.params || {})
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
      # NOTE there doesn't have to exist an actual file, it may come from an
      # archive (i.e., contents)
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
