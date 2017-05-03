# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/fetcher'
require 'inspec/metadata'

module SourceReaders
  class Flat < Inspec.source_reader(1)
    name 'flat'
    priority 5

    def self.resolve(target)
      # TODO: eventually remove the metadata.rb exception here
      # when we have fully phased out metadata.rb in 1.0
      files = target.files.find_all { |x|
        x.end_with?('.rb') && !x.include?('/') && x != 'metadata.rb'
      }
      return nil if files.empty?
      new(target, files)
    end

    attr_reader :metadata, :tests, :libraries, :data_files

    def initialize(target, files)
      @target = target
      @metadata = ::Inspec::Metadata.new(nil)
      @tests = load_tests(files)
      @libraries = {}
      @data_files = {}
    end

    private

    def load_tests(files)
      Hash[files.map { |x| [x, @target.read(x)] }]
    end
  end
end
