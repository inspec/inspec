require 'inspec/plugin/v1/registry'

module Inspec
  module Plugins
    # stores all CLI plugin, we expect those to the `Thor` subclasses
    class CLI
      def self.subcommands
        @subcommands ||= {}
      end

      def self.add_subcommand(klass, subcommand_name, usage, description, options = {})
        subcommands[subcommand_name] = {
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
