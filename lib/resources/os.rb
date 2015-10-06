# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Vulcano::Resources
  class OS < Vulcano.resource(1)
    name 'os'

    def [](name)
      vulcano.backend.os[name]
    end
  end
end
