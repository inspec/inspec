# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  module Plugins
    class Fetcher
      def self.name(name)
        fail 'Trying to register fetcher with name == nil' if name.nil?
        @name = name
        Inspec::Fetcher.registry[name] = self
      end

      # This fetcher's priority. Set it by providing the priority as an
      # argument. Higher numbers ensure that the fetcher is
      # called early to check if a target belongs to it. When called without
      # an argument, it retrieves this fetcher's priority. Defaults to 0.
      #
      # @param [Numeric] Priority as a number. Will only be set if != nil
      # @return [Numeric] This fetcher's priority
      def self.priority(x = nil)
        @priority = x unless x.nil?
        @priority || 0
      end

      # Try to resolve the target. If this fetcher cannot handle it, the result
      # will be nil. If, however, the fetcher can resolve it, the resulting
      # object will be an instance of a fetcher. This means, that the interface
      # that this base class provides, is the basis for the returned type.
      #
      # @param [String] target to try to resolve
      # @return [Fetcher] a fetcher if it can be resolved, nil otherwise
      def self.resolve(_target)
        fail "Fetcher #{self} does not implement `self.resolve(target)`. This method is required"
      end

      # When a fetcher's resolve doesn't lead to the final state yet, it can
      # use this method to hand it back for another resolver to handle.
      #
      # @param [Any] the current target that needs resolving
      # @return [Fetcher] a fetcher if it can be resolved, nil otherwise
      def self.resolve_next(target, parent)
        res = Inspec::Fetcher.resolve(target)
        res.parent = parent
        res
      end

      attr_reader :target
      attr_accessor :parent

      # Provide a list of files that are available to this fetcher.
      #
      # @return [Array[String]] A list of filenames
      def files
        fail "Fetcher #{self} does not implement `files()`. This is required."
      end

      # Read a file using this fetcher. The name must correspond to a file
      # available to this fetcher. Use #files to retrieve the list of
      # files.
      #
      # @param [String] _file The filename you are interested in
      # @return [String] The file's contents
      def read(_file)
        fail "Fetcher #{self} does not implement `read(...)`. This is required."
      end
    end
  end
end
