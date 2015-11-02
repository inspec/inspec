# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/targets/dir'
require 'inspec/targets/file'

module Inspec::Targets
  class FolderHelper
    def handles?(target)
      File.directory?(target)
    end

    def resolve(target)
      # find all files in the folder
      files = Dir[File.join(target, '**', '*')]
      # remove the prefix
      prefix = File.join(target, '')
      files = files.map { |x| x.sub(prefix, '') }
      # get the dirs helper
      helper = DirsHelper.get_handler(files)
      if helper.nil?
        fail "Don't know how to handle folder #{target}"
      end

      # get all test file contents
      file_handler = Inspec::Targets.modules['file']
      raw_files = helper.get_filenames(files)
      files = raw_files.map do |f|
        file_handler.resolve(File.join(target, f))
      end

      libs = []
      if helper.respond_to? :get_libraries
        raw_libs = helper.get_libraries(files)
        libs = raw_libs.map do |f|
          file_handler.resolve(File.join(target, f), as: :library)
        end
      end

      libs + files
    end
  end

  Inspec::Targets.add_module('folder', FolderHelper.new)
end
