# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Vulcano
  module Plugins
    class Resource
      def self.name(name)
        Vulcano::Plugins::Resource.__register(name, self)
      end

      def self.__register(name, obj)
        # rubocop:disable Lint/NestedMethodDefinition
        cl = Class.new(obj) do
          # add some common methods
          include Vulcano::Plugins::ResourceCommon
          def initialize(backend, *args)
            # attach the backend to this instance
            @__backend_runner__ = backend
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
