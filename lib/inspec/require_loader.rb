# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  class RequireLoader
    Item = Struct.new(:content, :ref, :line, :loaded)

    def initialize
      @contents = {}
    end

    def add(path, content, ref, line)
      @contents[path] = Item.new(content, ref, line, false)
    end

    def load(path)
      c = @contents[path]
      c.loaded = true
      res = [c.content, c.ref, c.line || 1]
      yield res if block_given?
      res
    end

    def exists?(path)
      @contents.key?(path)
    end

    def loaded?(path)
      @contents[path].loaded == true
    end
  end
end
