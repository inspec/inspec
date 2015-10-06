# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Vulcano::Targets
  class FileHelper
    def handles?(target)
      File.file?(target) and target.end_with?('.rb')
    end

    def resolve(target)
      {
        content: File.read(target),
        ref: target,
      }
    end
  end

  Vulcano::Targets.add_module('file', FileHelper.new)
end
