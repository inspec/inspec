# encoding: utf-8

class Vulcano::Backends::SpecinfraHelper
  class OS < OSCommon
    def initialize
      @platform = Specinfra::Helper::Os.os
    end
  end
end
