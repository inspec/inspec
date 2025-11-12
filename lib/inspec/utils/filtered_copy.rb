require "fileutils" unless defined?(FileUtils)

module Inspec
  module Utils
    #
    # Utility class for copying directory contents with configurable exclusions.
    # This allows filtered copying of files and directories while excluding
    # unwanted entries (e.g., .git directories, build artifacts, etc.)
    #
    # @example Basic usage with default exclusions
    #   copier = Inspec::Utils::FilteredCopy.new
    #   copier.copy("source_dir", "dest_dir")
    #
    # @example Custom exclusions along with defaults
    #   copier = Inspec::Utils::FilteredCopy.new(exclusions: ["node_modules", ".env"])
    #   copier.copy("source_dir", "dest_dir")
    #
    # @example Only custom exclusions (no defaults)
    #   copier = Inspec::Utils::FilteredCopy.new(exclusions: ["temp"], use_defaults: false)
    #   copier.copy("source_dir", "dest_dir")
    #
    class FilteredCopy
      # Default exclusions that are commonly filtered
      DEFAULT_EXCLUSIONS = [".git"].freeze

      # Initialize a new FilteredCopy instance
      #
      # @param exclusions [Array<String>] List of file/directory names to exclude from copying
      # @param use_defaults [Boolean] Whether to include DEFAULT_EXCLUSIONS in the exclusion list
      def initialize(exclusions: [], use_defaults: true)
        @exclusions = use_defaults ? (DEFAULT_EXCLUSIONS + exclusions).uniq : exclusions
      end

      # Copy contents from source to destination directory, excluding specified entries
      #
      # @param source_dir [String] Path to the source directory
      # @param destination_dir [String] Path to the destination directory
      # @return [Integer] Number of items copied
      def copy(source_dir, destination_dir)
        copied_count = 0
        Dir.children(source_dir).each do |entry|
          next if excluded?(entry)

          src_path = File.join(source_dir, entry)
          dest_path = File.join(destination_dir, entry)
          FileUtils.cp_r(src_path, dest_path)
          copied_count += 1
        end
        copied_count
      end

      # Add additional exclusions to the existing list
      #
      # @param items [Array<String>] Items to add to exclusion list
      # @return [Array<String>] Updated exclusion list
      def add_exclusions(*items)
        @exclusions.concat(items).uniq!
        @exclusions
      end

      # Remove items from the exclusion list
      #
      # @param items [Array<String>] Items to remove from exclusion list
      # @return [Array<String>] Updated exclusion list
      def remove_exclusions(*items)
        @exclusions -= items
        @exclusions
      end

      # Get current exclusion list
      #
      # @return [Array<String>] Current exclusion list
      def exclusions
        @exclusions.dup
      end

      private

      # Check if an entry should be excluded
      #
      # @param entry [String] File or directory name to check
      # @return [Boolean] True if entry should be excluded
      def excluded?(entry)
        @exclusions.include?(entry)
      end
    end
  end
end
