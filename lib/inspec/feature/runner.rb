module Inspec
  class Feature
    class Runner
      def self.with_feature(feature_name, opts = {}, &feature_implementation)
        config = opts[:config] || Inspec::Feature::Config.new
        logger = opts[:logger] || Inspec::Log

        # Emit log message saying we're running a feature
        logger.debug("Prepping to run feature '#{feature_name}'")

        # Validate that the feature is recognized
        feature = config[feature_name]
        unless feature
          logger.warn "Unrecognized feature name '#{feature_name}'"
        end

        yield feature_implementation
      end
    end
  end
end
