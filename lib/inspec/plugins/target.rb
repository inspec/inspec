# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'utils/modulator'

module Inspec
  module Targets
    # imports add_module function
    extend Modulator

    # Retrieve the resolver for a given target. Resolvers are any type of
    # instance, that can take a target in the #resolve method, and turn
    # it into raw InSpec code. It will actually retrieve all file's
    # contents, including libraries and metadata.
    #
    # @param [any] target any target you are pointing to; typically a string
    # @return [Inspec::Targets::*] the resolver handling this target
    def self.find_resolver(target)
      modules.values.find { |m| m.handles?(target) }
    end

    # Retrieve the target handler, i.e. the component that is going to handle
    # all aspects of a given target. Unlike the resolver, this provides
    # access to an object, that understands the target and is able to read
    # all contents, while providing additional methods which InSpec itself
    # does not care about (think: plugins).
    #
    # There is a special case, where you might be pointing to a URL containing
    # a ZIP file which has a full InSpec Profile embedded. This will be
    # resolved to a directory helper (Inspec::Targets::DirsResolver). This
    # method will retrieve the right handler for this directory and provide it
    # with full access all contents (i.e. the DirsResolver will be embedded).
    #
    # @param [any] target any target you are pointing to; typically a string
    # @return [Inspec::Targets::*] the handler for this target
    def self.find_handler(target)
      resolver = find_resolver(target)
      return resolver unless resolver.is_a?(Module) &&
                             resolver.ancestors.include?(DirsResolver)
      resolver.from_target(target).handler
    end

    # Turn targets into actionable InSpec code, library-data and metadata.
    #
    # @param [any] targets any targets you are pointing to; typically strings
    # @param [Hash] additional options for loading
    # @return [Array] an array of resolved data, with :content, :ref, :type
    def self.resolve(targets, opts = {})
      Array(targets).map do |target|
        handler = find_resolver(target) ||
                  fail("Don't know how to handle target: #{target}")
        handler.resolve(target, opts)
      end.flatten
    end
  end
end
