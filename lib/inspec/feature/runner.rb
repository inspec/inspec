require 'chef_licensing'
require "inspec/log"
require "inspec/ui"
require "inspec/dist"

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

        # If the feature has a licensed featured name, then check to see
        # if we are enttitled to it
        # if the feature does not have a licensed featured name it will free to use feature and does not require
        # license check?

        if Inspec::Dist::EXEC_NAME == "inspec" && feature.licensed_feature?
          # Validate the license and its feature entitlement
          # This will exit the process if the check fails
          begin
            ChefLicensing.check_feature_entitlement!(feature_name: feature.licensed_feature_name)
          rescue ChefLicensing::FeatureNotEntitled
            # This gets called when the feature name is unrecognized or not entitled with License
            # Need to decide whether it will just raise the error or anything more is expected. Like what if User has            # a license with feature entitlement but
            # license with the feature entitlement but User local licenses file does not have that license stored. Should
            # we tell user to set Env variable with valid license id / use --chef-license-key option here?
            Inspec::Log.error "Feature is not entitled to the current license."
            Inspec::UI.new.exit(:license_not_entitled)
          end
        end

        yield feature_implementation
      end
    end
  end
end
