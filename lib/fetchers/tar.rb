# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rubygems/package'
require 'zlib'

module Fetchers
  class Tar < Inspec.fetcher(1)
    name 'tar'
    priority 100

    attr_reader :files

    def self.resolve(target)
      return nil unless File.file?(target)
      return nil unless target.end_with?('.tar.gz', '.tgz')
      new(target)
    end

    def initialize(target)
      @target = target
      @contents = {}
      @files = []
      Gem::Package::TarReader.new(Zlib::GzipReader.open(@target)) do |tar|
        @files = tar.map(&:full_name)
      end
    end

    def read(file)
      @contents[file] ||= read_from_tar(file)
    end

    def read_from_tar(file)
      return nil unless @files.include?(file)
      res = nil
      # NB `TarReader` includes `Enumerable` beginning with Ruby 2.x
      Gem::Package::TarReader.new(Zlib::GzipReader.open(@target)) do |tar|
        tar.each do |entry|
          next unless entry.file? && file == entry.full_name
          res = entry.read
          break
        end
      end
      res
    end
  end
end
