module Inspec::Plugin::V2::PluginType
  # CLI subcommand type
  class CliCommand < Inspec::Plugin::V2::PluginBase
    register_plugin_type(:cli_command)
    # TODO: API
  end
end
