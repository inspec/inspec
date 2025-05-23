require "inspec/fetcher"
require "forwardable" unless defined?(Forwardable)

module Inspec
  class CachedFetcher
    extend Forwardable

    attr_reader :cache, :target, :fetcher
    def initialize(target, cache, opts = {})
      @target = target
      @fetcher = Inspec::Fetcher::Registry.resolve(target, opts)

      if @fetcher.nil?
        raise("Could not fetch inspec profile in #{target.inspect}.")
      end

      @cache = cache
    end

    def resolved_source
      fetch
      @fetcher.resolved_source
    end

    def update_from_opts(_opts)
      false
    end

    def cache_key
      k = if target.is_a?(Hash)
            target[:sha256] || target[:ref]
          end

      if k.nil?
        fetcher.cache_key
      else
        k
      end
    end

    def fetch
      if cache.exists?(cache_key) && cache.locked?(cache_key)
        Inspec::Log.debug "Waiting for lock to be released on the cache dir ...."
        counter = 0
        until cache.locked?(cache_key) == false
          if (counter += 1) > 300
            Inspec::Log.warn "Giving up waiting on cache lock at #{cache_key}"
            exit 1
          end
          sleep 0.1
        end
        fetch
      elsif cache.exists?(cache_key) && !cache.locked?(cache_key)
        Inspec::Log.debug "Using cached dependency for #{target}"
        cache_value = cache.prefered_entry_for(cache_key)
        if cache_value
          [cache_value, false]
        else
          Inspec::Log.debug "Dependency does not exist in the cache for target #{target}"
          cache_key_name = cache_key
          if cache_key_name.start_with?("gem:")
            # When cache for gem - meaning gemspec exists but gem does not exists then clearing up gemspec is required
            # This logic enables the gem fetcher logic to work step by step again
            Inspec::Log.debug "Clearing cached gemspec to fix dependency issue and enable fresh download."
            FileUtils.rm_rf(cache.gemspec_path_for(cache_key))
          end
        end
      else
        begin
          Inspec::Log.debug "Dependency does not exist in the cache #{target}"
          cache.lock(cache.base_path_for(fetcher.cache_key)) if fetcher.requires_locking?
          fetcher.fetch(cache.base_path_for(fetcher.cache_key))
        rescue SystemExit => e
          exit_code = e.status || 1
          Inspec::Log.error "Error while creating cache for dependency ... #{e.message}"
          # TODO: in the case of gem profile/resource pack dependency installs gone awry, this is the wrong thing to do!
          FileUtils.rm_rf(cache.base_path_for(fetcher.cache_key))
          exit(exit_code)
        ensure
          cache.unlock(cache.base_path_for(fetcher.cache_key)) if fetcher.requires_locking?
        end
        assert_cache_sanity!
        [fetcher.archive_path, fetcher.writable?]
      end
    end

    def assert_cache_sanity!
      # do not check cache sanity if the target is a gem or a resource pack
      # which are known by a special prefix on their cache key or by having the :gem key
      return if target.respond_to?(:key?) && target.key?(:gem)
      return unless target.respond_to?(:key?) && target.key?(:sha256)

      exception_message = <<~EOF
        The remote source #{fetcher} no longer has the requested content:

        Request Content Hash: #{target[:sha256]}
        Actual Content Hash: #{fetcher.resolved_source[:sha256]}

        For URL, supermarket, compliance, and other sources that do not
        provide versioned artifacts, this likely means that the remote source
        has changed since your lockfile was generated.
      EOF
      raise exception_message if fetcher.resolved_source[:sha256] != target[:sha256]
    end
  end
end
