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
      prepare_load_paths
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

    # Ensure each test directory exists on the $LOAD_PATH. This
    # will ensure traditional RSpec-isms like `require 'spec_helper'`
    # continue to work. The method outlined here is only meant to be temporary!
    def prepare_load_paths
      t = @target
      t = @target.parent unless @target.parent.nil?
      unless t.is_a?(Fetchers::Local)
        return # no need to mess with load-paths if this is not on disk
      end

      rel_dirs = (@libraries.keys + @tests.keys)
                 .map { |x| File.dirname(x) }.uniq

      abs_dirs = rel_dirs.map { |x| @target.abs_path(x) }
                         .find_all { |x| File.directory?(x) }
                         .map { |x| File.expand_path(x) }

      abs_dirs.each do |dir|
        $LOAD_PATH.unshift dir unless $LOAD_PATH.include?(dir)
      end
    end
  end
end
