# Copyright 2015 Dominik Richter. All rights reserved.
require 'vulcano/log'

module Vulcano
  # Extract vmetadata.rb information
  class Metadata
    attr_reader :dict
    def initialize log = nil
      @log = log || Log.new
      @dict = {}
    end

    %w{
      name
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

    def supports sth, version = nil
      @dict['supports'] ||= []
      @dict['supports'].push({
        'os' => sth,
        'version' => version
      })
    end

    def incomplete?
      @dict['name'].nil? || @dict['version'].nil? || @dict['summary'].nil? || @dict['maintainer'].nil? || @dict['copryight'].nil?
    end

    def method_missing sth, *args
      @log.warn "vmetadata.rb doesn't support: #{sth} #{args}"
    end

    def self.for_path path, log = nil
      log ||= Log.new
      dpath = File::join(path, 'vmetadata.rb')
      if !File::file?(dpath)
        log.error "Missing vmetadata.rb in #{path}"
        return nil
      end
      res = Metadata.new(log)
      res.instance_eval(File::read(dpath))

      log.error "Missing profile name in vmetadata.rb" if res.dict['name'].nil?
      log.error "Missing profile version in vmetadata.rb" if res.dict['version'].nil?
      log.error "Missing summary in vmetadata.rb" if res.dict['summary'].nil?
      log.warn "Missing maintainer in vmetadata.rb" if res.dict['maintainer'].nil?
      log.warn "Missing copyright in vmetadata.rb" if res.dict['copyright'].nil?

      return res
    end
  end
end
