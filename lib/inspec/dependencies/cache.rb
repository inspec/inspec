require "fileutils" unless defined?(FileUtils)

module Inspec
  #
  # Inspec::Cache manages an on-disk cache of inspec profiles.  The
  # cache can contain:
  #
  #  - .tar.gz profile archives
  #  - .zip profile archives
  #  - unpacked profiles
  #
  # Cache entries names include a hash of their source to prevent
  # conflicts between depenedencies with the same name from different
  # sources.
  #
  #
  class Cache
    attr_reader :path

    def initialize(path = nil)
      @path = path || File.join(Inspec.config_dir, "cache")
      FileUtils.mkdir_p(@path) unless File.directory?(@path)
    rescue Errno::EACCES
      # ignore
    end

    def prefered_entry_for(key)
      path = base_path_for(key)
      if File.directory?(path)
        path
      else
        archive_entry_for(key)
      end
    end

    def archive_entry_for(key)
      path = base_path_for(key)
      if File.exist?("#{path}.tar.gz")
        "#{path}.tar.gz"
      elsif File.exist?("#{path}.zip")
        "#{path}.zip"
      end
    end

    #
    # For a given name and source_url, return true if the
    # profile exists in the Cache.
    #
    # InSpec 7+ Special Magic for Gem-Based Resource Pack Profiles:
    #   These "profiles" are installed as gems, and so are "cached"
    #   by being installed as gems.
    #     The magic is triggered by a special prefix of
    #   the cache_key: gem: or gem_path:
    #
    # @param [String] name
    # @param [String] source_url
    # @return [Boolean]
    #
    def exists?(key)
      return false if key.nil? || key.empty?

      if key.start_with?("gem:")
        # check if the gem is installed in InSpec Config DIR or if it is present as cache in cache DIR
        !gemspec_path_for(key).nil? || File.directory?(base_path_for(key))
      elsif key.start_with?("gem_path:") # TODO: remove this as it will be redundant with the introduction of SHA256 key
        # Gem installed as explicit path reference, as in testing / development
        entry_point_path = key.sub(/^gem_path:/, "")
        File.exist?(entry_point_path)
      else
        # Standard cache entry
        path = base_path_for(key)
        File.directory?(path) || File.exist?("#{path}.tar.gz") || File.exist?("#{path}.zip")
      end
    end

    #
    # Return the path to given profile in the cache.
    #
    # The `source_url` parameter should be a URI-like string that
    # fully specifies the source of the exact version we want to pull
    # down.
    #
    # @param [String] name
    # @param [String] source_url
    # @return [String]
    #
    def base_path_for(key)
      if key.start_with?("gem:")
        # fetch the Gem installed path and if the gem is not available in the installed DIR
        # construct the cache path where it can be found
        # At this point this path will be used both for writing and reading the gem cache
        gemspec_path_for(key) || File.join(@path, key)

      elsif key.start_with?("gem_path:")
        # Gem installed as explicit path reference, as in testing / development
        entry_point_path = key.sub(/^gem_path:/, "")
        # We were given an explicit path like
        # inspec-test-resources/lib/inspec-test-resources.rb
        # go two directories up
        parts = Pathname(entry_point_path).each_filename.to_a
        File.join(parts.slice(0, parts.length - 2))
      else
        # Standard cache entry
        File.join(@path, key)
      end
    end

    def gemspec_path_for(key)
      if key.start_with?("gem:")
        (_, gem_name, version) = key.split(":")
        loader = Inspec::Plugin::V2::Loader.new
        loader.find_gemspec_directory(gem_name, version)
      end
    end

    #
    # For given cache key, return true if the
    # cache path is locked
    def locked?(key)
      locked = false
      path = base_path_for(key)
      # For archive there is no need to lock the directory so we skip those and return false for archive formatted cache
      locked = File.exist?("#{path}/.lock") if File.directory?(path)
      locked
    end

    def lock(cache_path)
      lock_file_path = File.join(cache_path, ".lock")
      begin
        FileUtils.mkdir_p(cache_path)
        Inspec::Log.debug("Locking cache ..... #{cache_path}")
        FileUtils.touch(lock_file_path)
      rescue Errno::EACCES
        raise "Permission denied while creating cache lock #{cache_path}/.lock."
      end
    end

    def unlock(cache_path)
      Inspec::Log.debug("Unlocking cache..... #{cache_path}")
      begin
        FileUtils.rm("#{cache_path}/.lock") if File.exist?("#{cache_path}/.lock")
      rescue Errno::EACCES
        raise "Permission denied while removing cache lock #{cache_path}/.lock"
      end
    end
  end
end
