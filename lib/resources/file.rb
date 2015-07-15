# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

module Serverspec::Type
  class File < Base
    # Overwrite the to_s method to show path
    # instead of type
    def to_s
      %Q.Path "#{@name}".
    end
  end
end