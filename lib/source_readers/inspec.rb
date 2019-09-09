require "inspec/fetcher"
require "inspec/metadata"

module SourceReaders
  class InspecReader < Inspec.source_reader(1)
    name "inspec"
    priority 10

    def self.resolve(target)
      return new(target, "inspec.yml") if target.files.include?("inspec.yml")

      nil
    end

    attr_reader :metadata, :tests, :libraries, :data_files

    # This create a new instance of an InSpec profile source reader
    #
    # @param [FileProvider] target An instance of a FileProvider object that can list files and read them
    # @param [String] metadata_source eg. inspec.yml or metadata.rb
    def initialize(target, metadata_source)
      @target     = target
      @metadata   = load_metadata(metadata_source)
      @tests      = load_tests
      @libraries  = load_libs
      @data_files = load_data_files
    end

    private

    def load_metadata(metadata_source)
      Inspec::Metadata.from_ref(
        metadata_source,
        @target.read(metadata_source),
        nil
      )
    rescue Psych::SyntaxError => e
      raise "Unable to parse inspec.yml: line #{e.line}, #{e.problem} #{e.context}"
    rescue => e
      raise "Unable to parse #{metadata_source}: #{e.class} -- #{e.message}"
    end

    def find_all(regexp)
      @target.files.grep(regexp)
    end

    def load_all(regexp)
      find_all(regexp)
        .map { |path| file = @target.read(path); [path, file] if file }
        .compact
        .to_h
    end

    def load_tests
      load_all(%r{^controls/.*\.rb$})
    end

    def load_libs
      load_all(%r{^libraries/.*\.rb$})
    end

    def load_data_files
      load_all(%r{^files/})
    end
  end
end
