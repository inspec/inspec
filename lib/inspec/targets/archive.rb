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

      res = {
        test:     collect(helper, files, :get_filenames),
        library:  collect(helper, files, :get_libraries),
        metadata: collect(helper, files, :get_metadata),
      }.map { |as, list|
        content(target, list, rootdir, base_folder: target, as: as)
      }

      res.flatten
    end

    # FIXME(sr) dedup inspec/targets/folder
    def collect(helper, files, getter)
      return [] unless helper.respond_to? getter
      helper.method(getter).call(files)
    end
  end
end
