# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Vulcano::Targets
  module DirsHelper
    class ProfileDir
      def handles?(paths)
        paths.include?('test') && paths.include?('metadata.rb')
      end

      def get_filenames(paths)
        paths.find_all do |path|
          (path.start_with?('test') || path.start_with?('lib')) &&
            path.end_with?('.rb')
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
      ProfileDir, ServerspecDir, FlatDir
    ].map(&:new)

    def self.get_handler(paths)
      HANDLERS.find { |x| x.handles? paths }
    end
  end
end
