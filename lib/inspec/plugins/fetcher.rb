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

    BLACKLIST_FILES = [
      'pax_global_header',
    ].freeze

    class RelFetcher < Fetcher
      attr_reader :files
      attr_reader :prefix

      def initialize(fetcher)
        @parent = fetcher
        @prefix = get_prefix(fetcher.files)
        @files = fetcher.files.find_all { |x| x.start_with? prefix }
                        .map { |x| x[prefix.length..-1] }
      end

      def abs_path(file)
        prefix + file
      end

      def read(file)
        @parent.read(abs_path(file))
      end

      private

      def get_prefix(fs)
        return '' if fs.empty?

        # filter backlisted files
        fs -= BLACKLIST_FILES

        sorted = fs.sort_by(&:length)
        get_folder_prefix(sorted)
      end

      def get_folder_prefix(fs, first_iteration = true)
        return get_files_prefix(fs) if fs.length == 1
        pre = fs[0] + File::SEPARATOR
        rest = fs[1..-1]
        if rest.all? { |i| i.start_with? pre }
          return get_folder_prefix(rest, false)
        end
        return get_files_prefix(fs) if first_iteration
        fs
      end

      def get_files_prefix(fs)
        return '' if fs.empty?

        file = fs[0]
        bn = File.basename(file)
        # no more prefixes
        return '' if bn == file

        i = file.rindex(bn)
        pre = file[0..i-1]

        rest = fs.find_all { |f| !f.start_with?(pre) }
        return pre if rest.empty?

        new_pre = get_prefix(rest)
        return new_pre if pre.start_with? new_pre
        # edge case: completely different prefixes; retry prefix detection
        a = File.dirname(pre + 'a')
        b = File.dirname(new_pre + 'b')
        get_prefix([a, b])
      end
    end
  end
end
