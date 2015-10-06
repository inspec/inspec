# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'resources/file'

module Vulcano::Resources
  class Bond < File
    name 'bond'

    def initialize(bond)
      @path = "/proc/net/bonding/#{bond}"
      @file = vulcano.file(@path)
      @content = nil
      @params = {}
      @loaded = false
    end

    def read_content
      # parse the file
      @content = @file.content
      @params = SimpleConfig.new(
        @file.content,
        assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
        multiple_values: true,
      ).params if @file.exist?
      @loaded = true
      @content
    end

    # ensures the content is loaded before we return the params
    def params
      read_content if @loaded == false
      @params
    end

    def content
      read_content if @loaded == false
      @content
    end

    def exist?
      @file.exist?
    end

    def has_interface?(interface)
      params['Slave Interface'].include?(interface)
    end

    def interfaces
      params['Slave Interface']
    end
  end
end
