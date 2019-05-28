
require 'inspec/resources/file'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class Bond < FileResource
    name 'bond'
    supports platform: 'unix'
    desc 'Use the bond InSpec audit resource to test a logical, bonded network interface (i.e. "two or more network interfaces aggregated into a single, logical network interface"). On Linux platforms, any value in the /proc/net/bonding directory may be tested.'
    example <<~EXAMPLE
      describe bond('bond0') do
        it { should exist }
      end
    EXAMPLE

    include FileReader

    def initialize(bond)
      @bond = bond
      @path = "/proc/net/bonding/#{bond}"
      @file = inspec.file(@path)
      @content = read_file_content(@path, allow_empty: true)
      @params = {}
      @loaded = false
    end

    def read_content
      @params = SimpleConfig.new(
        @content,
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

    def mode
      params['Bonding Mode'].first
    end

    def to_s
      "Bond #{@bond}"
    end
  end
end
