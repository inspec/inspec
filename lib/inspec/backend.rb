# encoding: utf-8

module Inspec
  module Backend
    module Base
      attr_accessor :profile

      # Provide a shorthand to retrieve the inspec version from within a profile
      #
      # @return [String] inspec version
      def version
        Inspec::VERSION
      end

      # Determine whether the connection/transport is a local connection
      # Useful for resources to modify behavior as necessary, such as using
      # the Ruby stdlib for a better experience.
      def local_transport?
        return false unless defined?(Train::Transports::Local)
        backend.is_a?(Train::Transports::Local::Connection)
      end

      # Ruby internal for printing a nice name for this class
      def to_s
        'Inspec::Backend::Class'
      end

      # Ruby internal for pretty-printing a summary for this class
      def inspect
        "Inspec::Backend::Class @transport=#{@backend.connection.class}"
      end
    end

    # Create the transport backend with aggregated resources.
    #
    # @param [Hash] config for the transport backend
    # @return [TransportBackend] enriched transport instance
    def self.create(config)
      cls = Class.new do
        attr_accessor :backend
        include Base

        def initialize(config)
          @backend = Inspec::Transport.new(config)
        end

        Inspec::Resource.registry.each do |id, r|
          define_method id.to_sym do |*args|
            r.new(self, id.to_s, *args)
          end
        end
      end

      cls.new(config)
    rescue Train::ClientError => e
      raise "Client error, can't connect to '#{name}' backend: #{e.message}"
    rescue Train::TransportError => e
      raise "Transport error, can't connect to '#{name}' backend: #{e.message}"
    end
  end
end
