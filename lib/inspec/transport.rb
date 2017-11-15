# encoding: utf-8

require 'train'

module Inspec
  class Transport
    attr_accessor :cache_resources, :connection
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

      @connection = transport.connection
      if @connection.nil?
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
      @connection.os
    end
    alias platform os

    # Some Train connections have unique methods (mock_os, uri, etc)
    # This will catch them accordingly and send them if they exist
    def method_missing(m, *args, &block)
      if @connection.respond_to?(m)
        @connection.send(m, *args, &block)
      else
        raise Train::ClientError, "Undefined method #{m} for train transport."
      end
    end

    def file(path)
      if @cache_resources == true && @file_cache.key?(path)
        @file_cache[path]
      elsif @cache_resources == true
        @file_cache[path] = @connection.file(path)
      else
        @connection.file(path)
      end
    end

    def run_command(cmd)
      if @cache_resources == true && @cmd_cache.key?(cmd)
        @cmd_cache[cmd]
      elsif @cache_resources == true
        @cmd_cache[cmd] = @connection.run_command(cmd)
      else
        @connection.run_command(cmd)
      end
    end
  end
end
