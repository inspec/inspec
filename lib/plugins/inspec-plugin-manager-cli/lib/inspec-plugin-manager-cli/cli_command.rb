require "term/ansicolor"
require "pathname"
require "inspec/plugin/v2"
require "inspec/plugin/v2/installer"
require "inspec/dist"

module InspecPlugins
  module PluginManager
    class CliCommand < Inspec.plugin(2, :cli_command)
      include Term::ANSIColor
      include Inspec::Dist

      subcommand_desc "plugin SUBCOMMAND", "Manage #{PRODUCT_NAME} and Train plugins"

      #==================================================================#
      #                      inspec plugin list
      #==================================================================#

      desc "list [options]", "Lists user-installed #{PRODUCT_NAME} plugins."
      option :all, desc: "Include plugins shipped with #{PRODUCT_NAME} as well.", type: :boolean, aliases: [:a]
      def list
        plugin_statuses = Inspec::Plugin::V2::Registry.instance.plugin_statuses
        plugin_statuses.reject! { |s| [:core, :bundle].include?(s.installation_type) } unless options[:all]

        # TODO: ui object support
        puts
        puts(bold { format(" %-30s%-10s%-8s%-6s", "Plugin Name", "Version", "Via", "ApiVer") })
        puts "-" * 55
        plugin_statuses.sort_by(&:name).each do |status|
          puts(format(" %-30s%-10s%-8s%-6s", status.name, make_pretty_version(status), status.installation_type, status.api_generation.to_s))
        end
        puts "-" * 55
        puts(" #{plugin_statuses.count} plugin(s) total")
        puts
      end

      #==================================================================#
      #                        inspec plugin search
      #==================================================================#

      desc "search [options] PATTERN", "Searches rubygems.org for plugins."
      long_desc <<~EOLD
        Searches rubygems.org for #{PRODUCT_NAME} plugins. Exits 0 on a search hit, 1 on user error,
        2 on a search miss. PATTERN is a simple string; a wildcard will be added as
        a suffix, unless -e is used.
      EOLD
      option :all, desc: "List all available versions, not just the latest one.", type: :boolean, aliases: [:a]
      option :exact, desc: "Assume PATTERN is exact; do not add a wildcard to the end", type: :boolean, aliases: [:e]
      option :'include-test-fixture', type: :boolean, desc: "Internal use", hide: true
      # Justification for disabling ABC: currently at 33.51/33
      def search(search_term) # rubocop: disable Metrics/AbcSize
        search_results = installer.search(search_term, exact: options[:exact])
        # The search results have already been filtered by the reject list.  But the
        # RejectList doesn't filter {inspec, train}-test-fixture because we need those
        # for testing.  We want to hide those from users, so unless we know we're in
        # test mode, remove them.
        unless options[:'include-test-fixture']
          search_results.delete("inspec-test-fixture")
          search_results.delete("train-test-fixture")
        end

        # TODO: ui object support
        puts
        puts(bold { format(" %-30s%-50s", "Plugin Name", "Versions Available") })
        puts "-" * 55
        search_results.keys.sort.each do |plugin_name|
          versions = options[:all] ? search_results[plugin_name] : [search_results[plugin_name].first]
          versions = "(" + versions.join(", ") + ")"
          puts(format(" %-30s%-50s", plugin_name, versions))
        end
        puts "-" * 55
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
      desc "install [-v VERSION] PLUGIN", "Installs a plugin from rubygems.org, a gemfile, or a path to local source."
      long_desc <<~EOLD
        PLUGIN may be the name of a gem on rubygems.org that begins with inspec- or train-.
        PLUGIN may also be the path to a local gemfile, which will then be installed like
        any other gem.  Finally, if PLUGIN is a path ending in .rb, it is taken to be a
        local file that will act as athe entry point for a plugin (this mode is provided
        for local plugin development).  Exit codes are 0 on success, 2 if the plugin is
        already installed, and 1 if any other error occurs.
      EOLD
      option :version, desc: "When installing from rubygems.org, specifies a specific version to install.", aliases: [:v]
      def install(plugin_id_arg)
        if plugin_id_arg =~ /\.gem$/ # Does it end in .gem?
          install_from_gemfile(plugin_id_arg)
        elsif plugin_id_arg =~ %r{[\/\\]} || Dir.exist?(plugin_id_arg) # Does the argument have a slash, or exist as dir in the local directory?
          install_from_path(plugin_id_arg)
        else
          install_from_remote_gem(plugin_id_arg)
        end
      end

      #--------------------------
      #        update
      #--------------------------
      desc "update PLUGIN", "Updates a plugin to the latest from from rubygems.org"
      long_desc <<~EOLD
        PLUGIN may be the name of a gem on rubygems.org that begins with inspec- or train-.
        Exit codes are 0 on success, 2 if the plugin is already up to date, and 1 if any
        other error occurs.
      EOLD
      def update(plugin_name)
        pre_update_versions = installer.list_installed_plugin_gems.select { |spec| spec.name == plugin_name }.map { |spec| spec.version.to_s }
        old_version = pre_update_versions.join(", ")

        update_preflight_check(plugin_name, pre_update_versions)

        begin
          installer.update(plugin_name)
        rescue Inspec::Plugin::V2::UpdateError => ex
          puts(red { "Update error: " } + ex.message + " - update failed")
          exit 1
        end
        post_update_versions = installer.list_installed_plugin_gems.select { |spec| spec.name == plugin_name }.map { |spec| spec.version.to_s }
        new_version = (post_update_versions - pre_update_versions).first

        puts(bold { plugin_name } + " plugin, version #{old_version} -> #{new_version}, updated from rubygems.org")
      end

      #--------------------------
      #        uninstall
      #--------------------------
      desc "uninstall PLUGIN_NAME", "Uninstalls a gem- or path- based plugin"
      long_desc <<~EOLD
        Removes a plugin from the users configuration.
          In the case of a gem plugin (by far the most common), the plugin gem is removed, along
        with any of its dependencies that are no longer needed by anything else. Finally, the
        plugin configuration file is updated to reflect that the plugin is no longer present.
          In the case of a path-based plugin (often used for plugin development), no changes
        are made to the referenced plugin source code. Rather, the plugin's entry is simply removed
        from the plugin config file.
      EOLD
      def uninstall(plugin_name)
        status = Inspec::Plugin::V2::Registry.instance[plugin_name.to_sym]
        unless status
          puts(red { "No such plugin installed: " } + "#{plugin_name} is not installed - uninstall failed")

          exit 1
        end
        installer = Inspec::Plugin::V2::Installer.instance

        pre_uninstall_versions = installer.list_installed_plugin_gems.select { |spec| spec.name == plugin_name }.map { |spec| spec.version.to_s }
        old_version = pre_uninstall_versions.join(", ")

        installer.uninstall(plugin_name)

        if status.installation_type == :path
          puts(bold { plugin_name } + " path-based plugin install has been uninstalled")
        else
          puts(bold { plugin_name } + " plugin, version #{old_version}, has been uninstalled")
        end
        exit 0
      end

      private

      #==================================================================#
      #                          install breakdown
      #==================================================================#
      # These are broken down because rubocop complained.

      def install_from_gemfile(gem_file)
        unless File.exist? gem_file
          puts(red { "No such plugin gem file " } + gem_file + " - installation failed.")
          exit 1
        end

        plugin_name_parts = File.basename(gem_file, ".gem").split("-")
        version = plugin_name_parts.pop
        plugin_name = plugin_name_parts.join("-")
        check_plugin_name(plugin_name, "installation")

        installer.install(plugin_name, gem_file: gem_file)

        puts(bold { plugin_name } + " plugin, version #{version}, installed from local .gem file")
        exit 0
      end

      def install_from_path(path)
        unless File.exist? path
          puts(red { "No such source code path " } + path + " - installation failed.")
          exit 1
        end

        plugin_name = File.basename(path, ".rb")

        # While installer.install does some rudimentary checking,
        # this file has good UI access, so we promise to validate the
        # input a lot and hand the installer a sure-thing.

        # Name OK?
        check_plugin_name(plugin_name, "installation")

        # Already installed?
        if registry.known_plugin?(plugin_name.to_sym)
          puts(red { "Plugin already installed" } + " - #{plugin_name} - Use '#{EXEC_NAME} plugin list' to see previously installed plugin - installation failed.")
          exit 2
        end

        # Can we figure out how to load it?
        entry_point = install_from_path__apply_entry_point_heuristics(path)

        # If you load it, does it act like a plugin?
        install_from_path__probe_load(entry_point, plugin_name)

        # OK, install it!
        installer.install(plugin_name, path: entry_point)

        puts(bold { plugin_name } + " plugin installed via source path reference, resolved to entry point " + entry_point)
        exit 0
      end

      # Rationale for rubocop variances: It's a heuristics method, and will be full of
      # conditionals.  The code is well-commented; refactoring into sub-methods would
      # reduce clarity.
      def install_from_path__apply_entry_point_heuristics(path) # rubocop: disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
        given = Pathname.new(path)
        given = given.expand_path # Resolve any relative paths
        name_regex = /^(inspec|train)-/
        versioned_regex = /^(inspec|train)-[a-z0-9\-\_]+-\d+\.\d+\.\d+$/

        # What are the last four things like?
        parts = [
          given.parent.parent.basename,
          given.parent.basename,
          given.basename(".rb"),
          given.extname,
        ].map(&:to_s)

        # Case 1: Simplest case: it was a full entry point, as presented.
        # /home/you/projects/inspec-something/lib/inspec-something.rb
        #   parts index:           ^0^        ^1^      ^2^        ^3^
        if parts[0] =~ name_regex && parts[1] == "lib" && parts[2] == parts[0] && parts[3] == ".rb"
          return given.to_s
        end

        # Case 2: Also easy: they either referred to the internal library directory,
        # or left the extansion off.  Those are the same to us.
        # /home/you/projects/inspec-something/lib/inspec-something
        #   parts index:           ^0^        ^1^      ^2^          (3 is empty)
        if parts[0] =~ name_regex && parts[1] == "lib" && parts[2] == parts[0] && parts[3].empty?
          return given.to_s + ".rb"
        end

        # Case 3: Maybe they were refering to a path that is inside a gem installation, or an exploded gem?
        # In that case, we'll have a version on the plugin name in part 0
        # /home/you/.gems/2.4.0/gems/inspec-something-3.45.1/lib/inspec-something.rb
        #   parts index:                     ^0^             ^1^      ^2^         ^3^
        if parts[0] =~ versioned_regex && parts[1] == "lib" && parts[0].start_with?(parts[2]) && parts[3] == ".rb"
          return given.to_s
        end

        # Case 4: Like case 3, but missing the .rb
        # /home/you/.gems/2.4.0/gems/inspec-something-3.45.1/lib/inspec-something
        #   parts index:                     ^0^             ^1^      ^2^         ^3^ (empty)
        if parts[0] =~ versioned_regex && parts[1] == "lib" && parts[0].start_with?(parts[2]) && parts[3].empty?
          return given.to_s + ".rb"
        end

        # Case 5: Easy to recognize, but harder to handle: they referred to the project root.
        #                 /home/you/projects/inspec-something
        #   parts index:        ^0^   ^1^         ^2^          (3 is empty)
        #   0 and 1 are not meaningful to us, but we hope to find a parts[2]/lib/inspec-something.rb.
        entry_point_guess = File.join(given.to_s, "lib", parts[2] + ".rb")
        if parts[2] =~ name_regex && File.exist?(entry_point_guess)
          return entry_point_guess
        end

        # Well, if we got here, parts[2] matches an inspec/train prefix, but we have no idea about anything.
        # Give up.
        puts(red { "Unrecognizable plugin structure" } + " - #{parts[2]} - When installing from a path, please provide the path of the entry point file - installation failed.")
        exit 1
      end

      def install_from_path__probe_load(entry_point, plugin_name)
        # Brazenly attempt to load a file, and see if it registers a plugin.
        begin
          require entry_point
        rescue LoadError => ex
          puts(red { "Plugin contains errors" } + " - #{plugin_name} - Encountered errors while trying to test load the plugin entry point, resolved to #{entry_point} - installation failed")
          puts ex.message
          exit 1
        end

        # OK, the wheels didn't fall off.  But is it a plugin?
        if plugin_name.to_s.start_with?("train")
          # Train internal names do not include the prix in their registry entries
          # And the registry is keyed on Strings
          registry_key = plugin_name.to_s.sub(/^train-/, "")
          unless Train::Plugins.registry.key?(registry_key)
            puts(red { "Does not appear to be a plugin" } + " - #{plugin_name} - After probe-loading the supposed plugin, it did not register itself to Train. Ensure something inherits from 'Train.plugin(1)' - installation failed.")
            exit 1
          end
        else
          unless registry.known_plugin?(plugin_name.to_sym)
            puts(red { "Does not appear to be a plugin" } + " - #{plugin_name} - After probe-loading the supposed plugin, it did not register itself to InSpec. Ensure something inherits from 'Inspec.plugin(2)' - installation failed.")
            exit 1
          end
        end
      end

      def install_from_remote_gem(plugin_name)
        requested_version = options[:version]

        check_plugin_name(plugin_name, "installation")

        # Version pre-flighting
        pre_installed_versions = installer.list_installed_plugin_gems.select { |spec| spec.name == plugin_name }.map { |spec| spec.version.to_s }
        install_from_remote_gem_verson_preflight_check(plugin_name, requested_version, pre_installed_versions)

        install_attempt_install(plugin_name)

        # Success messaging.  What did we actually install?
        post_installed_versions = installer.list_installed_plugin_gems.select { |spec| spec.name == plugin_name }.map { |spec| spec.version.to_s }
        new_version = (post_installed_versions - pre_installed_versions).first

        puts(bold { plugin_name } + " plugin, version #{new_version}, installed from rubygems.org")
        exit 0
      end

      def install_from_remote_gem_verson_preflight_check(plugin_name, requested_version, pre_installed_versions)
        return if pre_installed_versions.empty?

        # Everything past here in the block is a code 2 error

        # If they didn't ask for a specific version, they implicitly ask for the latest.
        # Do an expensive search to determine the latest version.
        unless requested_version
          latest_version = installer.search(plugin_name, exact: true, scope: :latest)
          latest_version = latest_version[plugin_name]&.last
          if latest_version && !requested_version
            requested_version = latest_version
          end
        end

        # Check for already-installed at desired version conditions
        they_explicitly_asked_for_a_version = !options[:version].nil?
        what_we_would_install_is_already_installed = pre_installed_versions.include?(requested_version)
        if what_we_would_install_is_already_installed && they_explicitly_asked_for_a_version
          puts(red { "Plugin already installed at requested version" } + " - plugin #{plugin_name} #{requested_version} - refusing to install.")
        elsif what_we_would_install_is_already_installed && !they_explicitly_asked_for_a_version
          puts(red { "Plugin already installed at latest version" } + " - plugin #{plugin_name} #{requested_version} - refusing to install.")
        else
          # There are existing versions installed, but none of them are what was requested
          puts(red { "Update required" } + " - plugin #{plugin_name}, requested #{requested_version}, have #{pre_installed_versions.join(', ')}; use `inspec plugin update` - refusing to install.")
        end

        exit 2
      end

      # Rationale for RuboCop variance: This is a one-line method with heavy UX-focused error handling.
      def install_attempt_install(plugin_name) # rubocop: disable Metrics/AbcSize
        installer.install(plugin_name, version: options[:version])
      rescue Inspec::Plugin::V2::PluginExcludedError => ex
        puts(red { "Plugin on Exclusion List" } + " - #{plugin_name} is listed as an incompatible gem - refusing to install.")
        puts "Rationale: #{ex.details.rationale}"
        puts "Exclusion list location: " + File.join(Inspec.src_root, "etc", "plugin_filters.json")
        puts "If you disagree with this determination, please accept our apologies for the misunderstanding, and open an issue at https://github.com/inspec/inspec/issues/new"
        exit 2
      rescue Inspec::Plugin::V2::InstallError
        raise if Inspec::Log.level == :debug
        results = installer.search(plugin_name, exact: true)
        if results.empty?
          puts(red { "No such plugin gem " } + plugin_name + " could be found on rubygems.org - installation failed.")
        elsif options[:version] && !results[plugin_name].include?(options[:version])
          puts(red { "No such version" } + " - " + plugin_name + " exists, but no such version #{options[:version]} found on rubygems.org - installation failed.")
        else
          puts(red { "Unknown error occured " } + " - installation failed.")
        end
        exit 1
      end

      #==================================================================#
      #                          update breakdown
      #==================================================================#
      def update_preflight_check(plugin_name, pre_update_versions)
        if pre_update_versions.empty?
          # Check for path install
          status = Inspec::Plugin::V2::Registry.instance[plugin_name.to_sym]
          if !status
            puts(red { "No such plugin installed: " } + "#{plugin_name} - update failed")
            exit 1
          elsif status.installation_type == :path
            puts(red { "Cannot update path-based install: " } + "#{plugin_name} is installed via path reference; use `inspec plugin uninstall` to remove - refusing to update")
            exit 2
          end
        end

        # Check for latest version (and implicitly, existance)
        latest_version = installer.search(plugin_name, exact: true, scope: :latest)
        latest_version = latest_version[plugin_name]&.last

        if pre_update_versions.include?(latest_version)
          puts(red { "Already installed at latest version: " } + "#{plugin_name} is at #{latest_version}, which the latest - refusing to update")
          exit 2
        end
      end

      #==================================================================#
      #                            utilities
      #==================================================================#
      def installer
        Inspec::Plugin::V2::Installer.instance
      end

      def registry
        Inspec::Plugin::V2::Registry.instance
      end

      def check_plugin_name(plugin_name, action)
        unless plugin_name =~ /^(inspec|train)-/
          puts(red { "Invalid plugin name" } + " - #{plugin_name} - All inspec plugins must begin with either 'inspec-' or 'train-' - #{action} failed.")
          exit 1
        end
      end

      def make_pretty_version(status)
        case status.installation_type
        when :core, :bundle
          Inspec::VERSION
        when :gem
          # TODO: this is naive, and assumes the latest version is the one that will be used. Logged on #3317
          # In fact, the logic to determine "what version would be used" belongs in the Loader.
          Inspec::Plugin::V2::Loader.list_installed_plugin_gems
                                    .select { |spec| spec.name == status.name.to_s }
                                    .sort_by(&:version)
                                    .last.version
        when :path
          "src"
        end
      end
    end
  end
end
