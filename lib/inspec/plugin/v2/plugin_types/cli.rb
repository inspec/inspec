module Inspec::Plugin::V2::PluginType
  # CLI subcommand type
  class CliCommand < Inspec::Plugin::V2::PluginBase
    register_plugin_type(:cli_command)
    # TODO: API

    # Invokes the subcommand defined by the plugin.
    # @param [Hash] cli_args
    def invoke(*)
      raise NotImplementedError, 'The plugin author must implement invoke(...) in their CliCommand subclass'
    end
  end
end
