module InspecPlugins
  module PluginManager
    class CliCommand < Inspec.plugin(2, :cli_command)
      subcommand_desc 'plugin SUBCOMMAND', 'Manage InSpec plugins'

      desc 'list', 'Lists user-installed InSpec plugins.'
      option :all, desc: 'Include plugins shipped with InSpec as well.', type: :boolean
      def list
        # TODO
        puts 'Would list installed plugins here'
      end

    end
  end
end