# encoding: utf-8

module Vulcano
  module Plugins

    class Resource
      def self.name( name )
        Vulcano::Plugins::Resource.__register(name, self)
      end

      def self.__register(name, obj)
        cl = Class.new(obj) do
          # add some common methods
          include Vulcano::Plugins::ResourceCommon
          def initialize(backend, *args)
            # attach the backend to this instance
            self.class.send(:define_method, :vulcano){backend}
            # call the resource initializer
            super(*args)
          end
        end

        # add the resource to the registry by name
        Vulcano::Resource.registry[name] = cl
      end
    end

    module ResourceCommon
      def resource_skipped
        @resource_skipped
      end

      def skip_resource message
        @resource_skipped = message
      end
    end

  end
end
