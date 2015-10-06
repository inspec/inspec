# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'vulcano/log'

module Vulcano
  # Extract vmetadata.rb information
  class Metadata
    attr_reader :dict
    def initialize(log = nil)
      @log = log || Log.new
      @dict = {}
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
      define_method name do |arg|
        @dict[name] = arg
      end
    end

    def supports(sth, version = nil)
      @dict['supports'] ||= []
      @dict['supports'].push(
        {
          'os' => sth,
          'version' => version,
        },
      )
    end

    def valid?
      is_valid = true
      err = lambda do |msg|
        @log.error msg
        is_valid = false
      end
      warn = lambda do |msg|
        @log.warn msg
        is_valid = false
      end
      err.call('Missing profile name in vmetadata.rb') if @dict['name'].nil?
      err.call('Missing profile title in vmetadata.rb') if @dict['title'].nil?
      err.call('Missing profile version in vmetadata.rb') if @dict['version'].nil?
      err.call('Missing summary in vmetadata.rb') if @dict['summary'].nil?
      warn.call('Missing maintainer in vmetadata.rb') if @dict['maintainer'].nil?
      warn.call('Missing copyright in vmetadata.rb') if @dict['copyright'].nil?
      is_valid
    end

    def method_missing(sth, *args)
      @log.warn "vmetadata.rb doesn't support: #{sth} #{args}"
    end

    def self.for_path(path, profile_id, log = nil)
      log ||= Log.new
      dpath = File.join(path, 'vmetadata.rb')
      if !File.file?(dpath)
        log.error "Missing vmetadata.rb in #{path}"
        return nil
      end
      res = Metadata.new(log)
      res.instance_eval(File.read(dpath), dpath, 1)
      res.dict['name'] = profile_id unless profile_id.nil? or profile_id.empty?
      res
    end
  end
end
