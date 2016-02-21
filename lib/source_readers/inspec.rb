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

    attr_reader :metadata, :tests, :libraries

    def initialize(target, metadata_source)
      @target = target
      @metadata = Inspec::Metadata.from_ref(
        metadata_source,
        @target.read(metadata_source),
        nil)

      @tests = load_tests
      @libraries = load_libs
    end

    private

    def load_tests
      tests = @target.files.find_all do |path|
        path.start_with?('controls', 'test') && path.end_with?('.rb')
      end
      Hash[tests.map { |x| [x, @target.read(x)] }]
    end

    def load_libs
      tests = @target.files.find_all do |path|
        path.start_with?('libraries') && path.end_with?('.rb')
      end
      Hash[tests.map { |x| [x, @target.read(x)] }]
    end
  end
end
