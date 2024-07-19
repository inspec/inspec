require "inspec/fetcher"
require "inspec/metadata"

module SourceReaders
  class GemReader < Inspec.source_reader(1)
    name "gem"
    priority 20

    def self.resolve(target)
      return new(target) unless target.files.grep(/gemspec/).empty?

      nil
    end

    attr_reader :metadata, :metadata_src, :tests, :libraries, :data_files, :target, :readme

    # This creates a new instance of an InSpec Gem-packaged profile source reader
    # As of July 2024 only resource packs, not controls, may be packaged as gems
    #
    # @param [FileProvider] target An instance of a FileProvider object that can list files and read them
    def initialize(target)
      @target     = target
      @metadata   = load_metadata(target.files.grep("inspec.yml").first)
      @tests      = {} # TODO - one day support controls?
      @libraries  = load_libs
      @data_files = {}
      @readme     = load_readme
    end

    private

    def load_metadata(metadata_source)
      @metadata_src = @target.read(metadata_source)
      Inspec::Metadata.from_ref(
        metadata_source,
        @metadata_src,
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

    def load_libs      
      # Legacy resource packs (inspec-gcp, inspec-aws, etc) have resources in old locations
      load_all(%r{^libraries/.*\.rb$})
      # New resource packs have them here
      load_all(%r{^lib/.*/resources/.*\.rb$})
    end

    def load_readme
      load_all(/README.md/)
    end
  end
end
