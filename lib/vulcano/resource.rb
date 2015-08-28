# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved
require 'vulcano/plugins'

module Vulcano
  class Resource
    def self.registry
      @registry ||= {}
    end
  end

  def self.resource(version)
    if version != 1
      raise "Only resource version 1 is supported!"
    end
    Vulcano::Plugins::Resource
  end
end
