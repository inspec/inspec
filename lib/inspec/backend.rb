# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

require 'train'

module Inspec
  module Backend
    # Create the transport backend with aggregated resources.
    #
    # @param [Hash] config for the transport backend
    # @return [TransportBackend] enriched transport module
    def self.create(config)
      conf = Train.target_config(config)
      name = Train.validate_backend(conf)
      transport = Train.create(name, conf)
      if transport.nil?
        fail "Can't find transport backend '#{name}'."
      end

      connection = transport.connection
      if connection.nil?
        fail "Can't connect to transport backend '#{name}'."
      end

      Module.new do
        define_method :backend do
          connection
        end
        Inspec::Resource.registry.each do |id, r|
          define_method id.to_sym do |*args|
            r.new(self, id.to_s, *args)
          end
        end
      end

    rescue Train::ClientError => e
      raise "Client error, can't connect to '#{name}' backend: #{e.message}"
    rescue Train::TransportError => e
      raise "Transport error, can't connect to '#{name}' backend: #{e.message}"
    end

    # Creates an instance of the transport backend with all resources.
    # It can be used to invoce methods directly.
    #
    # @param [Hash] config of the backend
    # @param [Any] base optional base class
    # @return [TransportBackend] backend instance
    def self.instance(config, base = Object)
      dsl = create(config)
      Class.new(base) { include dsl }.new
    end
  end
end
