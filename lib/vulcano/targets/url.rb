# encoding: utf-8
require 'uri'

class UrlTarget
  def handles?(target)
    uri = URI.parse(target)
    %{ http https }.include? uri.scheme
  end

  def resolve(target)
    raise "TODO"
  end
end

Vulcano::Targets.add_module('url', UrlTarget.new)
