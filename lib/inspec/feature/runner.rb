module Inspec
  class Feature
    class Runner
      def self.with_feature(feature_name, opts = {}, &feature_implementation)
        yield feature_implementation
      end
    end
  end
end
