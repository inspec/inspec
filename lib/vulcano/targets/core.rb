# encoding: utf-8
require 'utils/modulator'

module Vulcano
  module Targets
    extend Modulator

    def self.resolve(targets)
      Array(targets).map do |target|
        handler = modules.values.find{|m| m.handles?(target)}
        if handler.nil?
          raise "Don't know how to handle target: #{target}"
        end
        handler.resolve(target)
      end.flatten
    end

  end
end
