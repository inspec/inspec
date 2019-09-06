require "rubygems/package"
require "pathname"
require "zlib"
require "zip"

module Inspec
  class FileProvider
    def self.for_path(path)
      if path.is_a?(Hash)
        MockProvider.new(path)
      elsif File.directory?(path)
        DirProvider.new(path)
      elsif File.exist?(path) && path.end_with?(".tar.gz", "tgz")
        TarProvider.new(path)
      elsif File.exist?(path) && path.end_with?(".zip")
        ZipProvider.new(path)
      elsif File.exist?(path)
        DirProvider.new(path)
      else
        raise "No file provider for the provided path: #{path}"
      end
    end

    def initialize(_path); end

    # List all files that are offered.
    #
    # @return [Array[String]] list of file paths that are included
    def files
      raise "Fetcher #{self} does not implement `files()`. This is required."
    end

    # Read the contents of a file. This will typically refer to a text
    # file reading a string.
    #
    # @param _file [String] path of the file to be read
    # @return [String] contents of the file described
    def read(_file)
      raise "#{self} does not implement `read(...)`. This is required."
    end

    # Provide a method for reading binary contents from a file.
    # It will default to #read if not defined. For most streams that implement
    # it, it will be the same. For some special cases, it will add change the
    # way in which encoding of the returned data structure is handled.
    # Does not work with alias nor alias_method.
    def binread(file)
      read(file)
    end

    def relative_provider
      RelativeFileProvider.new(self)
    end
  end # class FileProvider

  class MockProvider < FileProvider
    attr_reader :files
    def initialize(path)
      @data = path[:mock]
      @files = @data.keys
    end

    def read(file)
      @data[file]
    end
  end

  class DirProvider < FileProvider
    attr_reader :files
    def initialize(path)
      @files = if File.file?(path)
                 [path]
               else
                 Dir[File.join(Shellwords.shellescape(path), "**", "*")]
               end
      @path = path
    end

    def read(file)
      return nil unless files.include?(file)
      return nil unless File.file?(file)

      File.read(file)
    end

    def binread(file)
      return nil unless files.include?(file)
      return nil unless File.file?(file)

      File.binread(file)
    end
  end # class DirProvider

  class ZipProvider < FileProvider
    attr_reader :files

    def initialize(path)
      @path = path
      @contents = {}
      @files = []
      walk_zip(@path) do |io|
        while (entry = io.get_next_entry)
          name = entry.name.sub(%r{/+$}, "")
          @files.push(name) unless name.empty? || name.squeeze("/") =~ %r{\.{2}(?:/|\z)}
        end
      end
    end

    def extract(destination_path = ".")
      FileUtils.mkdir_p(destination_path)

      Zip::File.open(@path) do |archive|
        archive.each do |file|
          final_path = File.join(destination_path, file.name)

          # This removes the top level directory (and any other files) to ensure
          # extracted files do not conflict.
          FileUtils.remove_entry(final_path) if File.exist?(final_path)

          archive.extract(file, final_path)
        end
      end
    end

    def read(file)
      @contents[file] ||= read_from_zip(file)
    end

    private

    def walk_zip(path, &callback)
      ::Zip::InputStream.open(path, &callback)
    end

    def read_from_zip(file)
      return nil unless @files.include?(file)

      res = nil
      walk_zip(@path) do |io|
        while (entry = io.get_next_entry)
          next unless file == entry.name

          res = io.read
          break
        end
      end
      res
    end
  end # class ZipProvider

  class TarProvider < FileProvider
    attr_reader :files

    def initialize(path)
      @path = path
      @contents = {}

      here = Pathname.new(".")

      walk_tar(@path) do |entries|
        entries.each do |entry|
          name = entry.full_name

          # rubocop:disable Layout/MultilineOperationIndentation
          # rubocop:disable Style/ParenthesesAroundCondition
          next unless (entry.file? &&              # duh
                       !name.empty? &&             # for empty filenames?
                       name !~ %r{\.\.(?:/|\z)} && # .. (to avoid attacks?)
                       !name.include?("PaxHeader/"))

          path = Pathname.new(name).relative_path_from(here).to_s

          @contents[path] = begin # not ||= in a tarball, last one wins
                              res = entry.read
                              try = res.dup
                              try.force_encoding Encoding::UTF_8
                              res = try if try.valid_encoding?
                              res
                            end
        end

        @files = @contents.keys
      end
    end

    def extract(destination_path = ".")
      FileUtils.mkdir_p(destination_path)

      @contents.each do |path, body|
        full_path = File.join(destination_path, path)

        FileUtils.mkdir_p(File.dirname(full_path))
        File.open(full_path, "wb") { |f| f.write(body) }
      end
    end

    def read(file)
      @contents[file]
    end

    private

    def walk_tar(path, &callback)
      tar_file = Zlib::GzipReader.open(path)
      Gem::Package::TarReader.new(tar_file, &callback)
    ensure
      tar_file.close
    end
  end # class TarProvider

  class RelativeFileProvider
    BLACKLIST_FILES = [
      "/pax_global_header",
      "pax_global_header",
    ].freeze

    attr_reader :files
    attr_reader :prefix
    attr_reader :parent

    def initialize(parent_provider)
      @parent = parent_provider
      @prefix = get_prefix(parent.files)
      if @prefix.nil?
        raise "Could not determine path prefix for #{parent}"
      end

      # select all files that begin with the prefix, and strip off the prefix from the file.
      #
      # strip off any leading top-level relative path (./) which is common in
      # PAX-formatted tar files. Do not do any translation of the path if the
      # path is an absolute path.
      @files = parent.files
        .find_all { |x| x.start_with?(prefix) && x != prefix }
        .map { |x| x[prefix.length..-1] }
        .map do |x|
          path = Pathname.new(x)
          path.absolute? ? path.to_s : path.relative_path_from(Pathname.new(".")).to_s
        end
    end

    def abs_path(file)
      return nil if file.nil?

      prefix + file
    end

    def read(file)
      parent.read(abs_path(file))
    end

    def binread(file)
      parent.binread(abs_path(file))
    end

    private

    def get_prefix(fs)
      return "" if fs.empty?

      # filter backlisted files
      fs -= BLACKLIST_FILES

      sorted = fs.sort_by(&:length)
      get_folder_prefix(sorted)
    end

    def prefix_candidate_for(file)
      if file.end_with?(File::SEPARATOR)
        file
      else
        file + File::SEPARATOR
      end
    end

    def get_folder_prefix(fs)
      return get_files_prefix(fs) if fs.length == 1

      first, *rest = fs
      pre = prefix_candidate_for(first)

      if rest.all? { |i| i.start_with? pre }
        return get_folder_prefix(rest)
      end

      get_files_prefix(fs)
    end

    def get_files_prefix(fs)
      return "" if fs.empty?

      file = fs[0]
      bn = File.basename(file)
      # no more prefixes
      return "" if bn == file

      i = file.rindex(bn)
      pre = file[0..i - 1]

      rest = fs.find_all { |f| !f.start_with?(pre) }
      return pre if rest.empty?

      new_pre = get_prefix(rest)
      return new_pre if pre.start_with? new_pre

      # edge case: completely different prefixes; retry prefix detection
      a = File.dirname(pre + "a")
      b = File.dirname(new_pre + "b")
      get_prefix([a, b])
    end
  end # class RelativeFileProvider
end
