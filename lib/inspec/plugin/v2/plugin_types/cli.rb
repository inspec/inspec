require 'inspec/base_cli'

# The InSpec load order has this file being loaded before `inspec/base_cli` can
# finish being loaded. So, we must define Inspec::BaseCLI here first to avoid
# a NameError below.
class Inspec::BaseCLI < Thor; end

module Inspec::Plugin::V2::PluginType
  class CliCommand < Inspec::BaseCLI
    # initialize log options for plugins
    def initialize(args, options, config)
      super(args, options, config)
      class_options = config.fetch(:class_options, nil)
      if class_options
        Inspec::Log.init(class_options['log_location']) if class_options.key?('log_location')
        Inspec::Log.level = get_log_level(class_options['log_level']) if class_options.key?('log_level')
      end
    end

    # This class MUST inherit from Thor, which makes it a bit awkward to register the plugin subtype
    # Since we can't inherit from PluginBase, we use the two-arg form of register_plugin_type
    Inspec::Plugin::V2::PluginBase.register_plugin_type(:cli_command, self)

    # Provide a description for the command group.
    def self.subcommand_desc(usage_msg, desc_msg)
      @usage_msg = usage_msg
      @desc_msg = desc_msg
    end

    # Register the command group with Thor.  This must be called on the implementation class AFTER
    # the the cli_command activator has been called
    def self.register_with_thor
      # Figure out my activator name (= subcommand group name)
      subcommand_name = Inspec::Plugin::V2::Registry.instance \
                                                    .find_activators(plugin_type: :cli_command, implementation_class: self) \
                                                    .first.activator_name.to_s

      # Register with Thor
      Inspec::InspecCLI.register(self, subcommand_name, @usage_msg, @desc_msg, {})
    end

    # Allow plugins to use inspec log settings
    class_option :log_level, type: :string,
                 desc: 'Set the log level: info (default), debug, warn, error'

    class_option :log_location, type: :string,
                desc: 'Location to send diagnostic log messages to. (default: $stdout or Inspec::Log.error)'
  end
end
