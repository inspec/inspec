# encoding: utf-8

module Vulcano
  module Targets

    def self.modules
      @modules ||= []
    end

    def self.add_module(handler)
      modules.push(handler)
    end

    def self.resolve(targets)
      Array(targets).map do |target|
        handler = @modules.find{|m| m.handles?(target)}
        if handler.nil?
          raise "Don't know how to handle target: #{target}"
        end
        handler.resolve(target)
      end.flatten
    end

  end
end
