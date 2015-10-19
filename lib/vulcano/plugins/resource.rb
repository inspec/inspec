# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Vulcano
  module Plugins
    class Resource
      def self.name(name = nil)
        return if name.nil?
        Vulcano::Plugins::Resource.__register(name, self)
      end

      def self.__register(name, obj)
        # rubocop:disable Lint/NestedMethodDefinition
        cl = Class.new(obj) do
          # add some common methods
          include Vulcano::Plugins::ResourceCommon
          def initialize(backend, name, *args)
            # attach the backend to this instance
            @__backend_runner__ = backend
            @__resource_name__ = name
            # call the resource initializer
            super(*args)
          end

          def vulcano
            @__backend_runner__
          end
        end
        # rubocop:enable Lint/NestedMethodDefinition

        # add the resource to the registry by name
        Vulcano::Resource.registry[name] = cl
      end

      # Define methods which are available to all resources
      # and may be overwritten.

      # Print the name of the resource
      def to_s
        @__resource_name__
      end

      # Overwrite inspect to provide better output to RSpec results.
      #
      # @return [String] full name of the resource
      def inspect
        to_s
      end
    end

    module ResourceCommon
      def resource_skipped
        @resource_skipped
      end

      def skip_resource(message)
        @resource_skipped = message
      end
    end
  end
end
