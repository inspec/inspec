# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'uri'
require 'tempfile'
require 'open-uri'
require 'inspec/targets/zip'

module Inspec::Targets
  class UrlHelper
    def handles?(target)
      uri = URI.parse(target)
      return false if uri.nil? or uri.scheme.nil?
      %{ http https }.include? uri.scheme
    end

    def resolve(target, opts = {})
      # abort if the target does not start with http or https
      return nil unless target.start_with? 'https://' or target.start_with? 'http://'

      # support for github https url
      if target.start_with? 'https://github.com' and target.end_with? '.git'
        url = target.sub(/.git$/, '') + '/archive/master.tar.gz'
      else
        url = target
      end

      resolve_zip(url, opts)
    end

    def resolve_zip(url, opts)
      archive = Tempfile.new(['inspec-dl-', '.tar.gz'])
      archive.binmode

      remote = open(
        url,
        http_basic_authentication: [opts['user'] || '', opts['password'] || ''],
      )

      # download content
      archive.write(remote.read)
      archive.rewind
      archive.close

      content_type = remote.meta['content-type']
      # replace extension with zip if we detected a zip content type
      if ['application/x-zip-compressed', 'application/zip'].include?(content_type)
        # rename file for proper detection in DirHelper
        pn = Pathname.new(archive.path)
        new_path = pn.dirname.join(pn.basename.to_s.gsub('tar.gz', 'zip'))
        File.rename(pn.to_s, new_path.to_s)

        content = ZipHelper.new.resolve(new_path)
        File.unlink(new_path)
      # use tar helper as default
      elsif ['application/x-gzip', 'application/gzip'].include?(content_type)
        content = TarHelper.new.resolve(archive.path)
        archive.unlink
      end

      content
    end

    def to_s
      'URL Loader'
    end
  end

  Inspec::Targets.add_module('url', UrlHelper.new)
end
