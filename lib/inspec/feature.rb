require_relative "feature/config"
require_relative "feature/runner"

module Inspec
  def self.with_feature(feature_name, opts = {}, &feature_implementation)
    Inspec::Feature::Runner.with_feature(feature_name, opts, &feature_implementation)
  end

  class Feature
    attr_reader :name, :description, :licensed_feature_name
    def initialize(feature_name, feature_yaml_opts)
      @name = feature_name
      feature_yaml_opts ||= {}
      @description = feature_yaml_opts["description"]
      @licensed_feature_name = feature_yaml_opts["licensed_feature_name"]
    end

    def licensed_feature?
      !licensed_feature_name.nil?
    end
  end
end
