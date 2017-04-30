# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'resources/file'

module Inspec::Resources
  class Bond < FileResource
    name 'bond'
    desc 'Use the bond InSpec audit resource to test a logical, bonded network interface (i.e. "two or more network interfaces aggregated into a single, logical network interface"). On Linux platforms, any value in the /proc/net/bonding directory may be tested.'
    example "
      describe bond('bond0') do
        it { should exist }
      end
    "

    def initialize(bond)
      @bond = bond
      @path = "/proc/net/bonding/#{bond}"
      @file = inspec.file(@path)
      @content = nil
      @params = {}
      @loaded = false
    end

    def read_content
      # parse the file
      @content = @file.content
      @params = SimpleConfig.new(
        @file.content,
        assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
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

    def to_s
      "Bond #{@bond}"
    end
  end
end
