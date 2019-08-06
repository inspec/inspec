# copyright: 2015, Dominik Richter

require "train"
require "inspec/config"
require "inspec/version"
require "inspec/resource"

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
        "Inspec::Backend::Class"
      end

      # Ruby internal for pretty-printing a summary for this class
      def inspect
        "Inspec::Backend::Class @transport=#{backend.class}"
      end
    end

    # Create the transport backend with aggregated resources.
    #
    # @param [Inspec::Config] config for the transport backend
    # @return [TransportBackend] enriched transport instance
    def self.create(config) # rubocop:disable Metrics/AbcSize
      train_credentials = config.unpack_train_credentials
      transport_name = Train.validate_backend(train_credentials)
      transport = Train.create(transport_name, train_credentials)
      if transport.nil?
        raise "Can't find transport backend '#{transport_name}'."
      end

      connection = transport.connection
      if connection.nil?
        raise "Can't connect to transport backend '#{transport_name}'."
      end

      # Set caching settings. We always want to enable caching for
      # the Mock transport for testing.
      if config[:backend_cache] || config[:backend] == :mock
        Inspec::Log.debug "Option backend_cache is enabled"
        connection.enable_cache(:file)
        connection.enable_cache(:command)
      elsif config[:debug_shell]
        Inspec::Log.debug "Option backend_cache is disabled"
        connection.disable_cache(:file)
        connection.disable_cache(:command)
      else
        Inspec::Log.debug "Option backend_cache is disabled"
        connection.disable_cache(:file)
        connection.disable_cache(:command)
      end

      cls = Class.new do
        include Base

        define_method :backend do
          connection
        end

        def method_missing(id, *args, &blk)
          require "inspec/resources/#{id}"
          klass = Inspec::Resource.registry[id.to_s]
          klass.new(self, id, *args)
        rescue LoadError
          super
        end

        Inspec::Resource.registry.each do |id, r|
          define_method id.to_sym do |*args|
            r.new(self, id.to_s, *args)
          end
        end
      end

      cls.new
    rescue Train::ClientError => e
      raise "Client error, can't connect to '#{transport_name}' backend: #{e.message}"
    rescue Train::TransportError => e
      raise "Transport error, can't connect to '#{transport_name}' backend: #{e.message}"
    end
  end
end
