# encoding: utf-8

module Vulcano
  module Plugins

    class Backend
      def self.name( name )
        Vulcano::Plugins::Backend.__register(name, self)
      end

      def self.__register(name, obj)
        cl = Class.new(obj) do
          include Vulcano::Plugins::BackendCommon
        end
        Vulcano::Backend.registry[name] = obj
      end
    end

    module BackendCommon
    end

  end
end
