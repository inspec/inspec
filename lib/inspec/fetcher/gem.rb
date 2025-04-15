require "inspec/plugin/v2/installer"

module Inspec::Fetcher
  class Gem < Inspec.fetcher(1)
    name "gem"
    priority 0.5 # TODO: verify value
    # Priority is used for setting precedence of fetchers. And registry plugin(v1) decides which fetcher to use for loading profiles by using this priority
    # Gem fetcher's priority should be lowest because gem profiles are only executables via inspec metadata

    def self.resolve(target)
      if target.is_a?(Hash) && target.key?(:gem)
        resolve_from_hash(target)
      end
    end

    def self.resolve_from_hash(target)
      return unless target.key?(:gem)

      new(target)
    end

    def initialize(target, opts = {})
      @target = target
      @gem_name = target[:gem]
      @version = target[:version] # optional
      @source = target[:source] # optional
      @gem_path = target[:path] # optional, sets local path installation mode
      @backend = opts[:backend]
      @archive_shasum = nil
    end

    def fetch(path)
      plugin_installer = Inspec::Plugin::V2::Installer.instance

      # Determine if gem is installed
      have_plugin = false
      Inspec::Log.debug("GemFetcher fetching #{@gem_name} v" + (@version || "ANY"))

      if @version
        have_plugin = plugin_installer.plugin_version_installed?(@gem_name, @version)
      else
        have_plugin = plugin_installer.plugin_installed?(@gem_name)
      end

      unless have_plugin
        # Install
        # TODO - error handling?
        Inspec::Log.debug("GemFetcher - install request for #{@gem_name}")
        if @gem_path
          # No version permitted
          plugin_installer.install(@gem_name, path: @gem_path)
        else
          # Passing an extra gem argument to enable detecting gem based plugins
          plugin_installer.install(@gem_name, version: @version, source: @source, gem: @gem_name )
        end
      end

      # Should the plugin activate? No, it should only be "fetched" (installed)
      # Activation would load resource libararies and would effectively execute the profile

      @target
    end

    attr_reader :archive_path

    def writable?
      # Gem based profile is not writable because it is not cached in lockfile
      false
    end

    def cache_key
      # This special value is interpreted by Inspec::Cache.exists?
      # gem:gemname:version
      # gem_path:/filesystem/path/entrypoint.rb

      if @gem_path
        "gem_path:#{@gem_path}"
      else
        "gem:#{@gem_name}:#{@version}"
      end
    end

    # The intent here is to provide a signature that would change with the content of the profile.
    # In the case of gems, for released gems,  "name-version" should suffice.
    # For development gems specified by path, the're ever-changing anyway, so just give the path.
    # In eith case, that string is in fact just the cache key.
    def sha256
      cache_key
    end

    def resolved_source
      h = { gem: @gem_name, version: @version, gem_path: @gem_path }
      h[:sha256] = sha256
      h
    end
  end
end
