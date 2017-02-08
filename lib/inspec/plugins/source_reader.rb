# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'utils/plugin_registry'

module Inspec
  module Plugins
    class SourceReader < PluginRegistry::Plugin
      def self.plugin_registry
        Inspec::SourceReader
      end

      # Retrieve this profile's metadata.
      #
      # @return [Inspec::Metadata] profile metadata
      def metadata
        raise "SourceReader #{self} does not implement `metadata()`. This method is required"
      end

      # Retrieve this profile's tests
      #
      # "tests" here refers to a test file. Individual controls and anonymous
      # tests are later extracted from the raw contents of a test file. The map
      # her simply maps from a test file name to the file contents.
      #
      # @return [Hash] Collection with references pointing to test contents
      def tests
        raise "SourceReader #{self} does not implement `tests()`. This method is required"
      end

      # Retrieve this profile's libraries
      #
      # @return [Hash] Collection with references pointing to library contents
      def libraries
        raise "SourceReader #{self} does not implement `libraries()`. This method is required"
      end
    end
  end
end
