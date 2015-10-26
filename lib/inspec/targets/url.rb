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

    def resolve(target)
      return nil unless target.start_with? 'https://github.com' and
                        target.end_with? '.git'

      url = target.sub(/.git$/, '') + '/archive/master.zip'
      resolve_zip(url)
    end

    def resolve_zip(url)
      zipfile = Tempfile.new('inspec-dl-')
      zipfile.binmode
      zipfile.write(open(url).read)
      zipfile.rewind
      content = ZipHelper.new.resolve(zipfile.path)
      zipfile.close
      zipfile.unlink
      content
    end
  end

  Inspec::Targets.add_module('url', UrlHelper.new)
end
