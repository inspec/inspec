# encoding: utf-8
require 'inspec/vendor_index'
require 'inspec/resolver'

module Inspec
  class Dependencies
    attr_reader :list, :vendor_path

    # initialize
    #
    # @param cwd [String] current working directory for relative path includes
    # @param vendor_path [String] path which contains vendored dependencies
    # @return [dependencies] this
    def initialize(cwd, vendor_path)
      @cwd = cwd
      @vendor_path = vendor_path || File.join(Dir.home, '.inspec', 'cache')
      @list = nil
    end

    #
    # 1. Get dependencies, pull things to a local cache if necessary
    # 2. Resolve dependencies
    #
    # @param dependencies [Gem::Dependency] list of dependencies
    # @return [nil]
    def vendor(dependencies)
      return nil if dependencies.nil? || dependencies.empty?
      @vendor_index ||= VendorIndex.new(@vendor_path)
      @list = Resolver.resolve(dependencies, @vendor_index, @cwd)
    end
  end
end
