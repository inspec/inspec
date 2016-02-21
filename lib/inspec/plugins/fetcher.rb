# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'utils/plugin_registry'

module Inspec
  module Plugins
    class Fetcher < PluginRegistry::Plugin
      def self.plugin_registry
        Inspec::Fetcher
      end

      # Provide a list of files that are available to this fetcher.
      #
      # @return [Array[String]] A list of filenames
      def files
        fail "Fetcher #{self} does not implement `files()`. This is required."
      end

      # Read a file using this fetcher. The name must correspond to a file
      # available to this fetcher. Use #files to retrieve the list of
      # files.
      #
      # @param [String] _file The filename you are interested in
      # @return [String] The file's contents
      def read(_file)
        fail "Fetcher #{self} does not implement `read(...)`. This is required."
      end
    end
  end
end
