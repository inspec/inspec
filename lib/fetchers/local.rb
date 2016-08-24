# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Fetchers
  class Local < Inspec.fetcher(1)
    name 'local'
    priority 0

    attr_reader :files

    def self.resolve(target)
      return nil unless target.is_a?(String)

      # Support "urls" in the form of file://
      if target.start_with?('file://')
        target = target.gsub(%r{^file://}, '')
      else
        # support for windows paths
        target = target.tr('\\', '/')
      end

      if !File.exist?(target)
        nil
      else
        new(target)
      end
    end

    def initialize(target)
      @target = target
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
