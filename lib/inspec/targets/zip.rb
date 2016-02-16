# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'zip'
require 'inspec/targets/dir'
require 'inspec/targets/archive'

module Inspec::Targets
  class ZipHelper < ArchiveHelper
    def self.handles?(target)
      File.file?(target) and target.end_with?('.zip')
    end

    def structure(input)
      files = []
      rootdir = ''

      ::Zip::InputStream.open(input) do |io|
        while (entry = io.get_next_entry)
          pn = Pathname(entry.name)
          rootdir = pn.dirname.to_s if pn.basename.to_s == 'inspec.yml' || pn.basename.to_s == 'metadata.rb'
          files.push(entry.name)
        end
      end

      # stores the rootdir of metadata.rb or inspec.yml
      rootdir += '/' if !rootdir.empty?
      [files, rootdir]
    end

    def content(input, path, rootdir = nil, opts = {})
      content = nil
      ::Zip::InputStream.open(input) do |io|
        while (entry = io.get_next_entry)
          next unless path == entry.name.gsub(rootdir, '')
          content = {
            # NB if some file is empty, return empty-string, not nil
            content: io.read || '',
            type: opts[:as] || :test,
            ref: entry.name,
          }
          break
        end
      end
      content
    end

    def to_s
      'zip Loader'
    end
  end

  Inspec::Targets.add_module('zip', ZipHelper)
end
