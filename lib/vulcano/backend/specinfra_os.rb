# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

class Vulcano::Backends::SpecinfraHelper
  class OS < OSCommon
    def initialize
      @platform = Specinfra::Helper::Os.os
    end
  end
end
