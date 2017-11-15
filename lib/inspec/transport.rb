# encoding: utf-8

require 'train'

module Inspec
  class Transport
    attr_accessor :cache_resources, :conn
    include Inspec::Backend::Base

    def initialize(config)
      @cache_resources = false
      @cmd_cache = {}
      @file_cache = {}
      init_train(config)
    end

    def init_train(config)
      conf = Train.target_config(config)
      name = Train.validate_backend(conf)
      transport = Train.create(name, conf)

      if transport.nil?
        raise "Can't find transport backend '#{name}'."
      end

      @conn = transport.connection
      if @conn.nil?
        raise "Can't connect to transport backend '#{name}'."
      end
    rescue Train::ClientError => e
      raise "Client error, can't connect to '#{name}' backend: #{e.message}"
    rescue Train::TransportError => e
      raise "Transport error, can't connect to '#{name}' backend: #{e.message}"
    end

    def clear_cache
      @cmd_cache = {}
      @file_cache = {}
    end

    def os
      @conn.os
    end
    alias platform os

    # This is needed for the mock connection which has some
    # unique method calls
    def method_missing(m, *args, &block)
      if @conn.respond_to?(m)
        @conn.send(m, *args, &block)
      else
        raise Train::ClientError, "Undefined method #{m} for train transport"
      end
    end

    def file(path)
      if @cache_resources == true && @file_cache.key?(path)
        @file_cache[path]
      elsif @cache_resources == true
        @file_cache[path] = @conn.file(path)
      else
        @conn.file(path)
      end
    end

    def run_command(cmd)
      if @cache_resources == true && @cmd_cache.key?(cmd)
        @cmd_cache[cmd]
      elsif @cache_resources == true
        Inspec::Log.warn('running raw command and caching')
        @cmd_cache[cmd] = @conn.run_command(cmd)
      else
        Inspec::Log.warn('running raw command')
        @conn.run_command(cmd)
      end
    end
  end
end
