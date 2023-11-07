require "inspec/file_provider"
require "inspec/plugin/v1/registry"

module Inspec
  module Plugins
    #
    # An Inspec::Plugins::Fetcher is responsible for fetching a remote
    # source to a local directory or file provided by the user.
    #
    # In general, there are two kinds of fetchers.  (1) Fetchers that
    # implement this entire API (see the Git or Url fetchers for
    # examples), and (2) fetchers that only implement self.resolve and
    # then call the resolve_next method with a modified target hash.
    # Fetchers in (2) do not need to implement the functions in this
    # class because the caller will never actually get an instance of
    # those fetchers.
    #
    class Fetcher < PluginRegistry::Plugin
      def self.plugin_registry
        Inspec::Fetcher::Registry
      end

      attr_accessor :target

      def writable?
        false
      end

      #
      # The path to the archive on disk.  This can be passed to a
      # FileProvider to get access to the files in the fetched
      # profile.
      #
      def archive_path
        raise "Fetcher #{self} does not implement `archive_path()`. This is required."
      end

      #
      # Fetches the remote source to a local source, using the
      # provided path as a partial filename. That is, if you pass
      # /foo/bar/baz, the fetcher can create:
      #
      # /foo/bar/baz/: A profile directory, or
      # /foo/bar/baz.tar.gz: A profile tarball, or
      # /foo/bar/baz.zip
      #
      def fetch(_path)
        raise "Fetcher #{self} does not implement `fetch()`. This is required."
      end

      #
      # The full specification of the remote source, with any
      # ambigious references provided by the user resolved to an exact
      # reference where possible.  For example, in the Git provide, a
      # tag will be resolved to an exact revision.
      #
      def resolved_source
        raise "Fetcher #{self} does not implement `resolved_source()`. This is required for terminal fetchers."
      end

      #
      # The unique key based on the content of the remote archive.
      #
      def cache_key
        raise "Fetcher #{self} does not implement `cache_key()`. This is required for terminal fetchers."
      end

      #
      # This optional method may be used after a failed fetch. If the fetcher
      # can be updated with information that might lead to a successful
      # retrieval of alternative content, this method may be called.
      #
      #  Default implementation makes a peculiar assumption that the class has
      # a ivar named @archive_shasum and you have a fetcher opt that pairs with
      # it named sha256, and those are the only two that matter for updating.
      #
      # Return TrueClass if the fetcher was updated and a retry is in order
      # Return FalseClass if the update contained no useful information
      # and a retry should not be attempted
      def update_from_opts(opts)
        changed = @archive_shasum != opts[:sha256]
        @archive_shasum = opts[:sha256]
        changed
      end

      # Helper for above; usful when the subclass ivars whose
      # names exactly match the names of the fetcher options.
      def update_ivar_from_opt(opt_name, opts)
        ivar_sym = "@#{opt_name}".to_sym
        changed = instance_variable_get(ivar_sym) != opts[opt_name]
        instance_variable_set(ivar_sym, opts[opt_name])
        changed
      end

      #
      # relative_target is provided to keep compatibility with 3rd
      # party plugins.
      #
      # Deprecated: This function may be removed in future versions of
      # Inspec, don't depend on it in new plugins.
      #
      # @returns [Inspec::RelativeFileProvider]
      #
      def relative_target
        file_provider = Inspec::FileProvider.for_path(archive_path)
        file_provider.relative_provider
      end

      # Returns false by default
      # This is used to regulate cache contention.
      # Fetchers that are sensitive to cache contention should return true.
      def requires_locking?
        false
      end
    end
  end
end
