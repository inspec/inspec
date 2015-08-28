# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

module Vulcano
  class Resource
    def self.registry
      @registry ||= {}
    end

    def self.name( name )
      Vulcano::Resource.registry[name] = self
    end
  end

  module ResourceCommon

    def resource_skipped
      @resource_skipped
    end

    def skip_resource message
      @resource_skipped = message
    end

  end

  def self.resource(version)
    Vulcano::Resource
  end
end
