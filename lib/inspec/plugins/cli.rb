# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

module Inspec
  module Plugins
    # stores all CLI plugin, we expect those to the `Thor` subclasses
    class CLI
      def self.registry
        @registry ||= {}
      end

      def self.register(klass, subcommand_name, usage, description, options = {})
        registry[subcommand_name] = {
          klass: klass,
          subcommand_name: subcommand_name,
          usage: usage,
          description: description,
          options: options,
        }
      end
    end
  end
end
