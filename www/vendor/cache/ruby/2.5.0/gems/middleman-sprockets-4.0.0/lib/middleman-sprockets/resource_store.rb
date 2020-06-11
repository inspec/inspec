module Middleman
  module Sprockets
    class ResourceStore
      include Contracts

      attr_reader :store

      def initialize
        @store = {}
      end

      Contract IsA['::Middleman::Sprockets::Resource'] => Any
      def add resource
        store[resource.file_descriptor.full_path] = resource
      end

      Contract ArrayOf[IsA['::Middleman::Sprockets::Resource']]
      def resources
        store.values
      end

      Contract ArrayOf[Pathname]
      def paths
        store.keys
      end

      Contract Pathname => Bool
      def matching_path? path
        paths.include?(path)
      end

      Contract Or[String, Pathname] => Maybe[IsA['::Middleman::Sprockets::Resource']]
      def find_by_path path
        path = Pathname.new(path) unless path.is_a?(Pathname)
        store.fetch path, nil
      end
    end
  end
end
