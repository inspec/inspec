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
    # @param [String] name
    # @param [String] source_url
    # @return [Boolean]
    #
    def exists?(key)
      return false if key.nil? || key.empty?

      path = base_path_for(key)
      File.directory?(path) || File.exist?("#{path}.tar.gz") || File.exist?("#{path}.zip")
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
    def base_path_for(cache_key)
      File.join(@path, cache_key)
    end

    #
    # For given cache key, return true if the
    # cache path is locked
    def locked?(key)
      locked = false
      path = base_path_for(key)
      # For archive there is no need to lock the directory so we skip those and return false for archive formatted cache
      if File.directory?(path)
        locked = File.exist?("#{path}/.lock")
      end
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
