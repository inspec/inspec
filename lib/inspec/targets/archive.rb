# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rubygems/package'
require 'zlib'

module Inspec::Targets
  class ArchiveHelper
    def resolve(target, _opts = {})
      files, rootdir = structure(target)

      # remove trailing slashes
      files = files.collect { |f| f.chomp('/') }

      # remove leading directory
      files = files.collect { |f|
        Pathname(f).relative_path_from(Pathname(rootdir)).to_s
      }

      helper = DirsHelper.get_handler(files)
      if helper.nil?
        fail "Don't know how to handle folder #{target}"
      end

      # get all test file contents
      raw_files = helper.get_filenames(files)
      tests = content(target, raw_files, rootdir, base_folder: target)

      libs = []
      if helper.respond_to? :get_libraries
        raw_libs = helper.get_libraries(files)
        libs = content(target, raw_libs, rootdir, base_folder: target, as: :library)
      end

      libs + tests
    end
  end
end
