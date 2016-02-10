# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'utils/modulator'

module Inspec
  module Targets
    extend Modulator

    def self.find_resolver(target)
      modules.values.find { |m| m.handles?(target) }
    end

    def self.find_handler(target)
      resolver = find_resolver(target)
      return resolver unless resolver.ancestors.include? DirsResolver
      resolver.from_target(target).handler
    end

    def self.resolve(targets, opts = {})
      Array(targets).map do |target|
        handler = find_resolver(target) ||
                  fail("Don't know how to handle target: #{target}")
        handler.resolve(target, opts)
      end.flatten
    end
  end
end
