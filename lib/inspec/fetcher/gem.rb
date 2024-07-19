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
      Inspec::Log.debug("GemFetcher fetching #{@gem_name} v" + (@version ? @version : "ANY"))

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
          plugin_installer.install(@gem_name, version: @version, source: @source )
        end
      end

      # Should the plugin activate? No, it should only be "fetched" (installed)
      # Activation would load resource libararies and would effectively execute the profile

      @target
    end

    def archive_path
      @target
    end

    def writable?
      # Gem based profile is not writable because it is not cached in lockfile
      false
    end

    def cache_key
      # Want this to be any unstable value - always changing for now
      rand().to_s
    end

    def sha256
      # TODO - calculate the sha of the installed rubygem
      cache_key # WRONG
      # Left as an exercise
      # if !@archive_shasum.nil?
      #   @archive_shasum
      # elsif File.directory?(@target)
      #   nil
      # else
      #   perform_shasum(@target)
      # end
    end

    # def perform_shasum(target)
    #   return @archive_shasum if @archive_shasum
    #   raise(Inspec::FetcherFailure, "Profile dependency local path '#{target}' does not exist") unless File.exist?(target)

    #   @archive_shasum = OpenSSL::Digest.digest("SHA256", File.read(target)).unpack("H*")[0]
    # end

    def resolved_source
      h = { gem: @gem_name, version: @version }
      h[:sha256] = sha256 if sha256
      h
    end
  end
end
