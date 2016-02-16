# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rubygems/package'
require 'zlib'
require 'inspec/targets/archive'

module Inspec::Targets
  class TarHelper < ArchiveHelper
    def self.handles?(target)
      File.file?(target) && target.end_with?('.tar.gz', '.tgz')
    end

    # gather all files that may be relevant
    def structure(input)
      files = []
      rootdir = ''
      Gem::Package::TarReader.new(Zlib::GzipReader.open(input)) do |tar|
        files = tar.map(&:full_name)
      end

      # find root dir of profile
      files.each { |f|
        pn = Pathname(f)
        rootdir = pn.dirname.to_s if pn.basename.to_s == 'inspec.yml' || pn.basename.to_s == 'metadata.rb'
      }

      # stores the rootdir of metadata.rb or inspec.yml
      rootdir += '/' if !rootdir.empty?
      [files, rootdir]
    end

    # gather content for a specific file
    def content(input, path, rootdir = nil, opts = {})
      content = nil
      Gem::Package::TarReader.new(Zlib::GzipReader.open(input)) do |tar|
        tar.each do |entry|
          if entry.directory?
            # nothing to do
          elsif entry.file?
            next unless path == entry.full_name.gsub(rootdir, '')
            content = {
              # NB if some file is empty, return empty-string, not nil
              content: entry.read || '',
              type: opts[:as] || :test,
              ref: entry.full_name,
            }
          elsif entry.header.typeflag == '2'
            # ignore symlinks for now
          end
        end
      end
      content
    end

    def to_s
      'tar.gz Loader'
    end
  end

  Inspec::Targets.add_module('tar', TarHelper)
end
