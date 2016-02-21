# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Fetchers
  class Local < Inspec.fetcher(1)
    name 'local'
    priority 0

    attr_reader :files

    def self.resolve(target)
      return nil unless File.exist?(target)
      new(target)
    end

    def initialize(target)
      if File.file?(target)
        @files = [target]
      else
        @files = Dir[File.join(target, '**', '*')]
      end
    end

    def read(file)
      return nil unless files.include?(file)
      return nil unless File.file?(file)
      File.read(file)
    end
  end
end
