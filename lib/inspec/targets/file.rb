# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec::Targets
  class FileHelper
    def handles?(target)
      File.file?(target) and target.end_with?('.rb')
    end

    def resolve(target, opts = {})
      base = opts[:base_folder]
      path = base.nil? ? target : File.join(base, target)
      {
        content: File.read(path),
        type: opts[:as] || :test,
        ref: path,
      }
    end

    def resolve_all(targets, opts = {})
      Array(targets).map do |target|
        resolve(target, opts)
      end
    end

    def to_s
      'File Loader'
    end
  end

  Inspec::Targets.add_module('file', FileHelper.new)
end
