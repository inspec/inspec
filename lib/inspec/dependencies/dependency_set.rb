# encoding: utf-8
require 'inspec/dependencies/requirement'
require 'inspec/dependencies/resolver'

module Inspec
  #
  # A DependencySet manages a list of dependencies for a profile.
  #
  class DependencySet
    #
    # Return a dependency set given a lockfile.
    #
    # @param lockfile [Inspec::Lockfile] A lockfile to generate the dependency set from
    # @param cwd [String] Current working directory for relative path includes
    # @param vendor_path [String] Path to the vendor directory
    #
    def self.from_lockfile(lockfile, cwd, cache, backend, opts = {})
      dep_tree = lockfile.deps.map do |dep|
        Inspec::Requirement.from_lock_entry(dep, cwd, cache, backend, opts)
      end

      dep_list = flatten_dep_tree(dep_tree)
      new(cwd, cache, dep_list, backend)
    end

    def self.from_array(dependencies, cwd, cache, backend)
      dep_list = {}
      dependencies.each do |d|
        dep_list[d.name] = d
      end
      new(cwd, cache, dep_list, backend)
    end

    # This is experimental code to test the working of the
    # dependency loader - perform a proper dependency related search
    # in the future.
    #
    # Flatten tree because that is all we know how to deal with for
    # right now. Last dep seen for a given name wins right now.
    def self.flatten_dep_tree(dep_tree)
      dep_list = {}
      dep_tree.each do |d|
        dep_list[d.name] = d
        dep_list.merge!(flatten_dep_tree(d.dependencies))
      end
      dep_list
    end

    attr_reader :vendor_path
    attr_writer :dep_list
    # initialize
    #
    # @param cwd [String] current working directory for relative path includes
    # @param vendor_path [String] path which contains vendored dependencies
    # @return [dependencies] this
    def initialize(cwd, cache, dep_list, backend)
      @cwd = cwd
      @cache = cache
      @dep_list = dep_list
      @backend = backend
    end

    def each
      @dep_list.each do |_k, v|
        yield v.profile
      end
    end

    def list
      @dep_list || {}
    end

    def to_array
      return [] if @dep_list.nil?
      @dep_list.map do |_k, v|
        v.to_hash
      end.compact
    end

    #
    # 1. Get dependencies, pull things to a local cache if necessary
    # 2. Resolve dependencies
    #
    # @param dependencies [Gem::Dependency] list of dependencies
    # @return [nil]
    #
    def vendor(dependencies)
      return nil if dependencies.nil? || dependencies.empty?
      @dep_list = Resolver.resolve(dependencies, @cache, @cwd, @backend)
    end
  end
end
