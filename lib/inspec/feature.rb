require_relative "feature/config"
require_relative "feature/runner"

module Inspec
  def self.with_feature(feature_name, opts = {}, &feature_implementation)
    Inspec::Feature::Runner.with_feature(feature_name, opts, &feature_implementation)
  end

  class Feature
    attr_reader :name, :description, :env_preview
    def initialize(feature_name, feature_yaml_opts)
      @name = feature_name
      feature_yaml_opts ||= {}
      @description = feature_yaml_opts["description"]
      @env_preview = feature_yaml_opts["env_preview"]
    end

    def previewable?
      !!env_preview
    end

    def env_preview_value
      env_preview_feature_name = name.to_s.split("inspec-")[-1]
      ENV["CHEF_PREVIEW_#{env_preview_feature_name.gsub("-", "_").upcase}"]
    end
  end
end
