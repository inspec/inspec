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

    def resolve(target, _opts = {})
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
      res = {
        test:     collect(helper, files, :get_filenames),
        library:  collect(helper, files, :get_libraries),
        metadata: collect(helper, files, :get_metadata),
      }.map { |as, list|
        file_handler.resolve_all(list, base_folder: target, as: as)
      }

      # flatten the outer list layer
      res.inject(&:+)
    end

    def to_s
      'Folder Loader'
    end

    private

    def collect(helper, files, getter)
      return [] unless helper.respond_to? getter
      helper.method(getter).call(files)
    end
  end

  Inspec::Targets.add_module('folder', FolderHelper.new)
end
