require 'inspec/base_cli'

module Inspec::Plugin::V2::PluginType
  class CliCommand < Inspec::BaseCLI
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
  end
end
