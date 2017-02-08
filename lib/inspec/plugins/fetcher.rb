# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
require 'utils/plugin_registry'
require 'inspec/file_provider'
require 'digest'

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
        Inspec::Fetcher
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
    end
  end
end
