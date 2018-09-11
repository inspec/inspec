require 'term/ansicolor'

module InspecPlugins
  module PluginManager
    class CliCommand < Inspec.plugin(2, :cli_command)
      include Term::ANSIColor

      subcommand_desc 'plugin SUBCOMMAND', 'Manage InSpec plugins'

      desc 'list', 'Lists user-installed InSpec plugins.'
      option :all, desc: 'Include plugins shipped with InSpec as well.', type: :boolean, aliases: [:a]
      def list
        plugin_statuses = Inspec::Plugin::V2::Registry.instance.plugin_statuses
        plugin_statuses.reject! { |s| [:core, :bundle].include?(s.installation_type) } unless options[:all]

        # TODO: ui object support
        puts
        puts(bold { format(' %-30s%-10s%-8s%-6s', 'Plugin Name', 'Version', 'Via', 'ApiVer') })
        puts '-' * 55
        plugin_statuses.sort_by(&:name).each do |status|
          puts(format(' %-30s%-10s%-8s%-6s', status.name, make_pretty_version(status), status.installation_type, status.api_generation.to_s))
        end
        puts '-' * 55
        puts(" #{plugin_statuses.count} plugin(s) total")
        puts
      end

      no_commands do
        def make_pretty_version(status)
          case status.installation_type
          when :core, :bundle
            Inspec::VERSION
          when :gem
            Inspec::Plugin::V2::Loader.list_installed_plugin_gems.detect { |spec| spec.name == status.name.to_s }.version
          when :path
            'src'
          end
        end
      end
    end
  end
end
