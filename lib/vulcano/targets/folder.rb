# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'vulcano/targets/dir'
require 'vulcano/targets/file'

module Vulcano::Targets
  class FolderHelper
    def handles?(target)
      File.directory?(target)
    end

    def resolve(target)
      # find all files in the folder
      files = Dir[File.join(target, '**', '*')]
      # remove the prefix
      files = files.map { |x| x.sub(target, '') }
      # get the dirs helper
      helper = DirsHelper.get_handler(files)
      if helper.nil?
        fail "Don't know how to handle folder #{target}"
      end

      # get all test file contents
      file_handler = Vulcano::Targets.modules['file']
      raw_files = helper.get_filenames(files)
      raw_files.map do |f|
        file_handler.resolve(File.join(target, f))
      end
    end
  end

  Vulcano::Targets.add_module('folder', FolderHelper.new)
end
