# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec::Targets
  module DirsHelper
    # InSpec profile Loader
    # Previous versions used the `test` directory instead of the new `controls`
    # directory. Usage of the test directory is deprecated and not recommended
    # anymore. Support for `test` will be removed in InSpec 1.0
    # TODO: remove `test` support for InSpec 1.0
    class ProfileDir
      def handles?(paths)
        (
          !paths.grep(/^controls/).empty? ||
          !paths.grep(/^test/).empty?
        ) && (
          paths.include?('inspec.yml') ||
          paths.include?('metadata.rb')
        )
      end

      def get_libraries(paths)
        paths.find_all do |path|
          path.start_with?('libraries') && path.end_with?('.rb')
        end
      end

      def get_filenames(paths)
        paths.find_all do |path|
          (path.start_with?('controls') || path.start_with?('test')) && path.end_with?('.rb')
        end
      end
    end

    class ChefAuditDir
      def handles?(paths)
        paths.include?('recipes') and paths.include?('metadata.rb')
      end

      def get_filenames(paths)
        paths.find_all do |x|
          x.start_with? 'recipes/' and x.end_with? '.rb'
        end
      end
    end

    class ServerspecDir
      def handles?(paths)
        paths.include?('spec')
      end

      def get_filenames(paths)
        paths.find_all do |path|
          path.start_with? 'spec' and path.end_with? '_spec.rb'
        end
      end
    end

    class FlatDir
      def handles?(paths)
        get_filenames(paths).empty? == false
      end

      def get_filenames(paths)
        paths.find_all { |x| x.end_with?('.rb') and !x.include?('/') }
      end
    end

    HANDLERS = [
      ProfileDir, ChefAuditDir, ServerspecDir, FlatDir
    ].map(&:new)

    def self.get_handler(paths)
      HANDLERS.find { |x| x.handles? paths }
    end
  end
end
