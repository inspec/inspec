# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/targets/dir'
require 'inspec/targets/file'

module Inspec::Targets
  class FolderHelper < DirsResolver
    def self.handles?(target)
      File.directory?(target)
    end

    attr_reader :files

    def initialize(target, _opts = {})
      @base_folder = target
      # find all files in the folder
      files = Dir[File.join(target, '**', '*')]
      # remove the prefix
      prefix = File.join(target, '')
      @files = files.map { |x| x.sub(prefix, '') }
      @file_handler = Inspec::Targets.modules['file']
    end

    def resolve(path, opts = {})
      o = (opts || {})
      o[:base_folder] = @base_folder
      @file_handler.resolve(path, o)
    end

    def to_s
      'Folder Loader'
    end
  end

  Inspec::Targets.add_module('folder', FolderHelper)
end
