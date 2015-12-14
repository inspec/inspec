# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'rubygems/package'
require 'zlib'
require 'inspec/targets/archive'

module Inspec::Targets
  class TarHelper < ArchiveHelper
    def handles?(target)
      File.file?(target) and (
        target.end_with?('.tar.gz') ||
        target.end_with?('.tgz')
      )
    end

    def structure(input)
      files = []
      rootdir = ''
      Gem::Package::TarReader.new(Zlib::GzipReader.open input) do |tar|
        files = tar.map(&:full_name)
      end

      # find root dir of profile
      files.each { |f|
        pn = Pathname(f)
        rootdir = pn.dirname.to_s if pn.basename.to_s == 'metadata.yml' || pn.basename.to_s == 'metadata.rb'
      }

      # stores the rootdir of metadata.rb or metadata.yml
      rootdir += '/' if !rootdir.empty?
      [files, rootdir]
    end

    def content(input, files, rootdir = nil, opts = {})
      content = []
      Gem::Package::TarReader.new(Zlib::GzipReader.open input) do |tar|
        tar.each do |entry|
          if entry.directory?
            # nothing to do
          elsif entry.file?
            if files.include?(entry.full_name.gsub(rootdir, ''))
              h = {
                content: entry.read,
                type: opts[:as] || :test,
                # ref: File.join(input, entry.name),
              }
              content.push(h)
            end
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

  Inspec::Targets.add_module('tar', TarHelper.new)
end
