# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/fetcher'
require 'inspec/metadata'

module SourceReaders
  class InspecReader < Inspec.source_reader(1)
    name 'inspec'
    priority 10

    def self.resolve(target)
      return new(target, 'inspec.yml') if target.files.include?('inspec.yml')
      # TODO: deprecated for 1.0.0 release
      if target.files.include?('metadata.rb') &&
         (
           target.files.include?('controls') ||
           target.files.include?('test')
         )
        return new(target, 'metadata.rb')
      end
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
        nil)
    rescue Psych::SyntaxError => e
      raise "Unable to parse inspec.yml: line #{e.line}, #{e.problem} #{e.context}"
    rescue => e
      raise "Unable to parse #{metadata_source}: #{e.class} -- #{e.message}"
    end

    def load_tests
      tests = @target.files.find_all do |path|
        path.start_with?('controls') && path.end_with?('.rb')
      end
      Hash[tests.map { |x| [x, @target.read(x)] }]
    end

    def load_libs
      tests = @target.files.find_all do |path|
        path.start_with?('libraries') && path.end_with?('.rb')
      end
      Hash[tests.map { |x| [x, @target.read(x)] }]
    end

    def load_data_files
      files = @target.files.find_all do |path|
        path.start_with?('files' + File::SEPARATOR)
      end
      Hash[files.map { |x| [x, @target.read(x)] }]
    end
  end
end
