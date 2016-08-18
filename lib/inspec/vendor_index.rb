# encoding: utf-8
module Inspec
  class VendorIndex
    attr_reader :list, :path
    def initialize(path)
      @path = path
      FileUtils.mkdir_p(path) unless File.directory?(path)
      @list = Dir[File.join(path, '*')].map { |x| load_path(x) }
    end

    def find(_dependency)
      # TODO
      fail NotImplementedError, '#find(dependency) on VendorIndex seeks implementation.'
    end

    private

    def load_path(_path)
      # TODO
      fail NotImplementedError, '#load_path(path) on VendorIndex wants to be implemented.'
    end
  end
end
