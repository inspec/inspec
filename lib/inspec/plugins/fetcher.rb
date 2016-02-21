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

      def relative_target
        RelFetcher.new(self)
      end
    end

    class RelFetcher
      attr_reader :files

      def initialize(fetcher)
        @parent = fetcher
        @prefix = get_prefix(fetcher.files)
        @files = fetcher.files.find_all { |x| x.start_with? @prefix }
                        .map { |x| x[@prefix.length..-1] }
      end

      def read(file)
        @parent.read(@prefix + file)
      end

      private

      def get_prefix(files)
        return '' if files.empty?
        sorted = files.sort_by(&:length)
        get_folder_prefix(sorted)
      end

      def get_folder_prefix(files, first_iteration = true)
        return get_files_prefix(files) if files.length == 1
        pre = files[0] + File::SEPARATOR
        rest = files[1..-1]
        if rest.all? { |i| i.start_with? pre }
          return get_folder_prefix(rest, false)
        end
        return get_files_prefix(files) if first_iteration
        files
      end

      def get_files_prefix(files)
        return '' if files.empty?

        file = files[0]
        bn = File.basename(file)
        # no more prefixes
        return '' if bn == file

        i = file.rindex(bn)
        prefix = file[0..i-1]

        rest = files.find_all { |f| !f.start_with?(prefix) }
        return prefix if rest.empty?

        nu_prefix = get_prefix(rest)
        return nu_prefix if prefix.start_with? nu_prefix
        # edge case: completely different prefixes; retry prefix detection
        a = File.dirname(prefix + 'a')
        b = File.dirname(nu_prefix + 'b')
        get_prefix([a, b])
      end
    end
  end
end
