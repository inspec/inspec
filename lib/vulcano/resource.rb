# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

module Vulcano
  class Resource

    def resource_skipped
      @resource_skipped
    end

    def skip_resource message
      @resource_skipped = message
    end

  end
end