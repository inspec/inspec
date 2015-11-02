# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec::Targets
  class FileHelper
    def handles?(target)
      File.file?(target) and target.end_with?('.rb')
    end

    def resolve(target, opts = {})
      key = opts[:as] || :content
      {
        key => File.read(target),
        ref: target,
      }
    end
  end

  Inspec::Targets.add_module('file', FileHelper.new)
end
