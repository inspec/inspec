# encoding: utf-8
require 'digest'
require 'fileutils'

module Inspec
  class VendorIndex
    attr_reader :path
    def initialize(path)
      @path = path
      FileUtils.mkdir_p(path) unless File.directory?(path)
    end

    def add(name, source, path_from)
      path_to = base_path_for(name, source)
      path_to = if File.directory?(path_to)
                  path_to
                elsif path_from.end_with?('.zip')
                  "#{path_to}.tar.gz"
                elsif path_from.end_with?('.tar.gz')
                  "#{path_to}.tar.gz"
                else
                  fail "Cannot add unknown archive #{path} to vendor index"
                end
      FileUtils.cp_r(path_from, path_to)
      path_to
    end

    def prefered_entry_for(name, source_url)
      path = base_path_for(name, source_url)
      if File.directory?(path)
        path
      elsif File.exist?("#{path}.tar.gz")
        "#{path}.tar.gz"
      elsif File.exist?("#{path}.zip")
        "#{path}.zip"
      end
    end

    #
    # For a given name and source_url, return true if the
    # profile exists in the VendorIndex.
    #
    # @param [String] name
    # @param [String] source_url
    # @return [Boolean]
    #
    def exists?(name, source_url)
      path = base_path_for(name, source_url)
      File.directory?(path) || File.exist?("#{path}.tar.gz") || File.exist?("#{path}.zip")
    end

    #
    # Return the path to given profile in the vendor index.
    #
    # The `source_url` parameter should be a URI-like string that
    # fully specifies the source of the exact version we want to pull
    # down.
    #
    # @param [String] name
    # @param [String] source_url
    # @return [String]
    #
    def base_path_for(name, source_url)
      File.join(@path, key_for(name, source_url))
    end

    private

    #
    # Return the key for a given profile in the vendor index.
    #
    # The `source_url` parameter should be a URI-like string that
    # fully specifies the source of the exact version we want to pull
    # down.
    #
    # @param [String] name
    # @param [String] source_url
    # @return [String]
    #
    def key_for(name, source_url)
      source_hash = Digest::SHA256.hexdigest source_url
      "#{name}-#{source_hash}"
    end
  end
end
