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
      @gem_path = target[:path] || target[:gem_path] # optional, sets local path installation mode
      @backend = opts[:backend]
      @archive_shasum = nil

      # Only validate the declared path (target[:path]) from inspec.yml, not a resolved gem_path
      # that may carry a version from a previously-installed gem.
      if target[:path]&.end_with?(".rb") && @version
        raise ArgumentError, "The 'version' key is not permitted when 'path' points to a " \
                              ".rb entry point (#{@gem_path}). Version constraints apply only " \
                              "to installed gems."
      end
    end

    def fetch(path)
      Inspec::Log.debug("GemFetcher fetching #{@gem_name} v" + (@version || "ANY"))

      if rb_entry_point?
        fetch_rb_entry_point(path)
      else
        fetch_gem(path)
      end

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
      @cache_key ||= begin
        key = if @gem_path
                "gem_path:#{@gem_path}"
              else
                "gem:#{@gem_name}:#{gem_version}"
              end
        OpenSSL::Digest.hexdigest("SHA256", key)
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
      h = { gem: @gem_name, version: gem_version, gem_path: @gem_path }
      h[:sha256] = sha256
      h
    end

    private

    # Returns true when the dependency specifies a .rb entry point path (development mode).
    # In this mode the file is required directly from disk with no gem installation.
    def rb_entry_point?
      @gem_path&.end_with?(".rb")
    end

    # Handle a .rb entry point: require the loader file directly from its location on disk.
    # No gem installation occurs. The file is expected to register an InSpec plugin activator.
    # Vendoring is not supported for .rb entry points — the source tree must be present at runtime.
    def fetch_rb_entry_point(cache_path)
      unless File.exist?(@gem_path)
        raise "Gem-based resource pack entry point not found: #{@gem_path}"
      end

      Inspec::Log.debug("GemFetcher: loading .rb entry point directly: #{@gem_path}")
      require File.expand_path(@gem_path)

      # Derive the gem root by going two directories up from the .rb file
      # (e.g. lib/inspec-my-pack.rb => lib/ => gem_root/)
      @archive_path = File.expand_path(File.join(File.dirname(@gem_path), ".."))
    end

    # Handle a standard gem installation (from RubyGems or a local .gem file).
    def fetch_gem(cache_path)
      plugin_installer = Inspec::Plugin::V2::Installer.instance

      have_plugin = if @version
                      plugin_installer.plugin_version_installed?(@gem_name, @version)
                    else
                      plugin_installer.plugin_installed?(@gem_name)
                    end

      unless have_plugin
        # TODO - error handling?
        Inspec::Log.debug("GemFetcher - install request for #{@gem_name}")
        if @gem_path
          plugin_installer.install(@gem_name, gem: @gem_name, path: @gem_path)
        else
          # Passing an extra gem argument to enable detecting gem based plugins
          plugin_installer.install(@gem_name, version: @version, source: @source, gem: @gem_name)
        end
      end

      # Usually this `cache_path` is cache path
      # We want to copy installed gem to cache path so it can be vendored
      # and read again as a cache
      if cache_path
        loader = Inspec::Plugin::V2::Loader.new
        gem_dir_path = loader.find_gem_directory(@gem_name, @version)
        if gem_dir_path
          # Cache the gem file
          FileUtils.mkdir_p(cache_path)
          FileUtils.cp_r(gem_dir_path, cache_path)
          @archive_path = cache_path
        else
          @archive_path = @target
        end
      end

      # Should the plugin activate? No, it should only be "fetched" (installed)
      # Activation would load resource libararies and would effectively execute the profile
    end

    def gem_version
      @version || Inspec::Plugin::V2::Loader.find_gemspec_of(@gem_name)&.version&.to_s
    end
  end
end

