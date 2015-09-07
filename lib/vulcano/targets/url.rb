# encoding: utf-8
require 'uri'
require 'tempfile'
require 'open-uri'
require 'vulcano/targets/zip'

module Vulcano::Targets
  class UrlHelper
    def handles?(target)
      uri = URI.parse(target)
      return false if uri.nil? or uri.scheme.nil?
      %{ http https }.include? uri.scheme
    end

    def resolve(target)
      if target.start_with? 'https://github.com' and target.end_with? '.git'
        url = target.sub(/.git$/, '') + '/archive/master.zip'
        return resolve_zip(url)
      end
    end

    def resolve_zip(url)
      zipfile = Tempfile.new('vulcano-dl-')
      zipfile.binmode
      zipfile.write(open(url).read)
      zipfile.rewind
      content = ZipHelper.new.resolve(zipfile.path)
      zipfile.close
      zipfile.unlink
      content
    end
  end

  Vulcano::Targets.add_module('url', UrlHelper.new)
end
