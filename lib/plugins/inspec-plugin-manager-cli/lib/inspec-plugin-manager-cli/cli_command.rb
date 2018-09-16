require 'term/ansicolor'
require 'inspec/plugin/v2/installer'

module InspecPlugins
  module PluginManager
    class CliCommand < Inspec.plugin(2, :cli_command)
      include Term::ANSIColor

      subcommand_desc 'plugin SUBCOMMAND', 'Manage InSpec plugins'

      #==================================================================#
      #                      inspec plugin list
      #==================================================================#

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

      #==================================================================#
      #                        inspec plugin search
      #==================================================================#

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

      #==================================================================#
      #                       inspec plugin install
      #==================================================================#
      desc 'install [-v VERSION] PLUGIN', 'Installs a plugin from rubygems.org, a gemfile, or a path to local source.'
      long_desc 'PLUGIN may be the name of a gem on rubygems.org that begins with inspec- or train-.  PLUGIN may also be the path to a local gemfile, which will then be installed like any other gem.  Finally, if PLUGIN is a path ending in .rb, it is taken to be a local file that will act as athe entry point for a plugin (this mode is provided for local plugin development).  Exit codes are 0 on success, 2 if the plugin is already installed, and 1 if any other error occurs.'
      option :version, desc: 'When installing from rubygems.org, specifies a specific version to install.', aliases: [:v]
      def install(plugin_id_arg)
        installer = Inspec::Plugin::V2::Installer.instance
        if plugin_id_arg =~ /\.gem$/ # Does it end in .gem?
          gem_file = plugin_id_arg
          unless File.exist? gem_file
            puts( red { 'No such plugin gem file ' } + gem_file + ' - installation failed.')
            exit 1
          end
          plugin_name_parts = File.basename(plugin_id_arg, '.gem').split('-')
          version = plugin_name_parts.pop
          plugin_name = plugin_name_parts.join('-')
          check_plugin_name(plugin_name, 'installation')
          installer.install(plugin_name, gem_file: gem_file)
          puts(bold { plugin_name } + " plugin, version #{version}, installed from local .gem file")

        elsif plugin_id_arg =~ /[\/\\]/ # Does the argument have a slash?
          path = plugin_id_arg
          plugin_name = File.basename(plugin_id_arg)
          unless File.exist? path
            puts( red { 'No such source code path ' } + path + ' - installation failed.')
            exit 1
          end
          check_plugin_name(plugin_name, 'installation')
          installer.install(plugin_name, path: path)
          puts(bold { plugin_name } + ' plugin installed via source path reference')

        else
          plugin_name = plugin_id_arg
          requested_version = options[:version]

          check_plugin_name(plugin_name, 'installation')
          # Version pre-flighting
          pre_installed_versions = installer.list_installed_plugin_gems.select {|spec| spec.name == plugin_name }.map {|spec| spec.version.to_s}
          unless pre_installed_versions.empty?
            # Everything past here in the block is a code 2 error

            # If they didn't ask for a specific version, they impiclicitly ask for the latest.
            # Do an expensive search to determine the latest version.
            unless requested_version
              latest_version = installer.search(plugin_name, exact: true, scope: :latest)
              latest_version = latest_version[plugin_name]&.last
              if latest_version && !requested_version
                requested_version = latest_version
              end
            end

            # Check for already-installed at desired version conditions
            if pre_installed_versions.include?(requested_version)
              if options[:version]
                puts(red{ 'Plugin already installed at requested version' } + " - plugin #{plugin_name} #{requested_version} - refusing to install.")
              else
                puts(red{ 'Plugin already installed at latest version' } + " - plugin #{plugin_name} #{requested_version} - refusing to install.")
              end
            else
              # There are existing versions, but none of them are what was requested
              puts(red{ 'Update required' } + " - plugin #{plugin_name}, requested #{requested_version}, have #{pre_installed_versions.join(', ')} - refusing to install.")
            end

            exit 2
          end
          # Pre-flight cleared

          # Attempt install
          begin
            installer.install(plugin_name, version: options[:version])
          rescue Inspec::Plugin::V2::InstallError
            results = installer.search(plugin_name, exact: true)
            if results.empty?
              puts( red { 'No such plugin gem ' } + plugin_name + ' could be found on rubygems.org - installation failed.')
            elsif !results[plugin_name].include?(options[:version])
              puts( red { 'No such version' } + ' - ' + plugin_name + " exists, but no such version #{options[:version]} found on rubygems.org - installation failed.")
            else
              puts( red { 'Unknown error occured ' } + ' - installation failed.')
            end
            exit 1
          end

          # Sucess messaging.  What did we actually install?
          post_installed_versions = installer.list_installed_plugin_gems.select {|spec| spec.name == plugin_name }.map {|spec| spec.version.to_s}
          new_version = (post_installed_versions - pre_installed_versions).first

          puts(bold { plugin_name } + " plugin, version #{new_version}, installed from rubygems.org")

        end
      end

      private
      def check_plugin_name(plugin_name, action)
        unless plugin_name =~ /^(inspec|train)-/
          puts(red { 'Invalid plugin name' } + " - #{plugin_name} - All inspec plugins must begin with either 'inspec-' or 'train-' - #{action} failed.")
          exit 1
        end
      end

      #==================================================================#
      #                            utilities
      #==================================================================#

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
