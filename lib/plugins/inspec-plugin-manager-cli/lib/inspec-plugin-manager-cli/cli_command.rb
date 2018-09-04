module InspecPlugins
  module PluginManager
    class CliCommand < Inspec.plugin(2, :cli_command)
      subcommand_desc 'plugin SUBCOMMAND', 'Manage InSpec plugins'

      desc 'list', 'Lists installed InSpec plugins.'
      def list
        # TODO
        puts 'Would list installed plugins here'
      end

    end
  end
end