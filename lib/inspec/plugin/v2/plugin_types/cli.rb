require 'inspec/base_cli'

module Inspec::Plugin::V2::PluginType
  # CLI subcommand type

  # TODO: consider adding an adapter superclass or something
  class CliCommand < Inspec::BaseCLI
    # This class MUST inherit from Thor, which makes it a bit awkward to register
    # Since we can't inherit from PluginBase, we use the two-arg form of register_plugin_type
    Inspec::Plugin::V2::PluginBase.register_plugin_type(:cli_command, self)
    # TODO: API

    # Invokes the subcommand defined by the plugin.
    # @param [Hash] cli_args
    def invoke(*)
      raise NotImplementedError, 'The plugin author must implement invoke(...) in their CliCommand subclass'
    end
  end
end
