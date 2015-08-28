# encoding: utf-8

module Vulcano
  module Plugins

    class Resource
      def self.name( name )
        Vulcano::Plugins::Resource.__register(name, self)
      end

      def self.__register(name, obj)
        cl = Class.new(obj) do
          include Vulcano::Plugins::ResourceCommon
          def initialize(backend, *args)
            @vulcano = backend
            super(*args)
          end
        end
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
