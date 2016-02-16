# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rubygems/package'
require 'zlib'
require 'inspec/targets/dir'

module Inspec::Targets
  class ArchiveHelper < DirsResolver
    attr_reader :files

    def initialize(target, _opts = {})
      @target = target
      files, @rootdir = structure(target)

      # remove trailing slashes
      files = files.collect { |f| f.chomp('/') }

      # remove leading directory
      root = Pathname(@rootdir)
      @files = files.collect { |f|
        Pathname(f).relative_path_from(root).to_s
      }
    end

    # this fetches specific files from the archive
    def resolve(path, opts = {})
      o = (opts || {})
      o[:base_folder] = @target
      content(@target, path, @rootdir, o)
    end
  end
end
