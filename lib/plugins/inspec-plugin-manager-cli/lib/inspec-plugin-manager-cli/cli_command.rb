require 'term/ansicolor'
require 'inspec/plugin/v2/installer'

module InspecPlugins
  module PluginManager
    class CliCommand < Inspec.plugin(2, :cli_command)
      include Term::ANSIColor

      subcommand_desc 'plugin SUBCOMMAND', 'Manage InSpec plugins'

      desc 'list [options]', 'Lists user-installed InSpec plugins.'
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

      desc 'search [options] PATTERN', 'Searches rubygems.org for InSpec plugins. Exits 0 on a search hit, exits 2 on a search miss.'
      option :all, desc: 'List all available versions, not just the latest one.', type: :boolean, aliases: [:a]
      option :exact, desc: 'Assume PATTERN is exact; do not add a wildcard to the end', type: :boolean, aliases: [:e]
      def search(search_term)
        installer = Inspec::Plugin::V2::Installer.instance
        search_results = installer.search(search_term, exact: options[:exact])

        # TODO: ui object support
        puts
        puts(bold { format(' %-30s%-50s%', 'Plugin Name', 'Versions Available') })
        puts '-' * 55
        search_results.keys.sort.each do |plugin_name|
          versions = options[:all] ? search_results[plugin_name] : [ search_results[plugin_name].first ]
          versions = '(' + versions.join(', ') + ')'
          puts(format(' %-30s%-50s', plugin_name, versions))
        end
        puts '-' * 55
        puts(" #{search_results.count} plugin(s) found")
        puts

        exit 2 if search_results.empty?
      rescue Inspec::Plugin::V2::SearchError => ex
        Inspec::Log.error ex.message
        exit 1
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
