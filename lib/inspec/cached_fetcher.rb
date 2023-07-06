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
        [cache.prefered_entry_for(cache_key), false]
      else
        begin
          Inspec::Log.debug "Dependency does not exist in the cache #{target}"
          cache.lock(cache.base_path_for(fetcher.cache_key)) if fetcher.requires_locking?
          fetcher.fetch(cache.base_path_for(fetcher.cache_key))
        rescue SystemExit => e
          exit_code = e.status || 1
          Inspec::Log.error "Error while creating cache for dependency ... #{e.message}"
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
