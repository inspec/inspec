require "inspec/plugin/v2/installer"

module Inspec::Fetcher
  class Gem < Inspec.fetcher(1)
    name "gem"
    priority 0.5 # TODO: verify value
    # Priority is used for setting precedence of fetchers. And registry plugin(v1) decides which fetcher to use for loading profiles by using this priority
    # Gem fetcher's priority should be lowest because gem profiles are only executables via inspec metadata

    def self.resolve(target)
      resolve_from_hash(target) if target.is_a?(Hash) && target.key?(:gem)
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

      Inspec::Log.debug("GemFetcher fetching #{@gem_name} v" + (@version || "ANY"))

      have_plugin = if @version
                      plugin_installer.plugin_version_installed?(@gem_name, @version)
                    else
                      plugin_installer.plugin_installed?(@gem_name)
                    end

      unless have_plugin
        # Install
        # TODO - error handling?
        Inspec::Log.debug("GemFetcher - install request for #{@gem_name}")
        if @gem_path
          # No version permitted
          plugin_installer.install(@gem_name, gem: @gem_name, path: @gem_path)
        else
          # Passing an extra gem argument to enable detecting gem based plugins
          plugin_installer.install(@gem_name, version: @version, source: @source, gem: @gem_name)
        end
      end

      # Usually this `path` is cache path
      # We want to copy installed gem to cache path so it can be vendored
      # and read again as a cache
      if path
        loader = Inspec::Plugin::V2::Loader.new
        gem_dir_path = loader.find_gem_directory(@gem_name, @version)
        if gem_dir_path
          # Cache the gem file
          FileUtils.mkdir_p(path)
          FileUtils.cp_r(gem_dir_path, path)
          @archive_path = path
        else
          @archive_path = @target
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
      # SHA256 on gem:gemname:version
      # SHA256 on gem_path:/filesystem/path/entrypoint.rb
      key = if @gem_path
              "gem_path:#{@gem_path}"
            else
              "gem:#{@gem_name}:#{gem_version}"
            end
      OpenSSL::Digest.hexdigest("SHA256", key)
    end

    # The intent here is to provide a signature that would change with the content of the profile.
    # In the case of gems, for released gems,  "name-version" should suffice.
    # For development gems specified by path, the're ever-changing anyway, so just give the path.
    # In eith case, that string is in fact just the cache key.
    def sha256
      cache_key
    end

    def resolved_source
      h = { gem: @gem_name, version: gem_version, gem_path: @gem_path }
      h[:sha256] = sha256
      h
    end

    private

    def gem_version
      @version || Inspec::Plugin::V2::Loader.find_gemspec_of(@gem_name)&.version&.to_s
    end
  end
end
