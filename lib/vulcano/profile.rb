# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'vulcano/metadata'

module Vulcano
  class Profile
    def self.from_path(path, options = nil)
      opt = options.dup || {}
      opt[:path] = path
      Profile.new(opt)
    end

    attr_reader :params
    attr_reader :metadata

    def initialize(options = nil)
      @options = options || {}
      @params = {}
      @logger = options.delete(:logger) || Logger.new(nil)
      @profile_id = options.delete(:profile_id)

      @path = @options[:path]
      fail 'Cannot read an empty path.' if @path.nil? || @path.empty?
      fail "Cannot find directory #{@path}" unless File.directory?(@path)

      @metadata = read_metadata
      @params = @metadata.params unless @metadata.nil?
    end

    private

    def read_metadata
      mpath = File.join(@path, 'metadata.rb')
      @metadata = Metadata.from_file(mpath, @profile_id, @logger)
    end
  end
end
