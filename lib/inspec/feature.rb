module Inspec
  def self.with_feature(feature_name, opts = {}, &feature_implementation)
    yield feature_implementation
  end

  class Feature
    class Config
      attr_reader :cfg_data

      def initialize(conf_path = nil)
        # If conf path is nil, read from source installation
        conf_path ||= File.join(Inspec.src_root, "etc", "features.yaml")

        # Read YAML data from path
        @cfg_data = YAML.load_file(conf_path)
        @features_by_name = {}
      end

      def with_each_feature
        cfg_data["features"].each do |feature_name, raw_info|
          feat = @features_by_name[feature_name] ||= Inspec::Feature.new(feature_name.to_sym, raw_info)
          yield(feat)
        end
      end

      def [](feature_name)
        raw_info = cfg_data["features"][feature_name]
        return nil unless raw_info
        feat = @features_by_name[feature_name] ||= Inspec::Feature.new(feature_name.to_sym, raw_info)
      end

      def feature_name?(query)
        cfg_data["features"].key?(query.to_s)
      end

      def features
        @features ||= load_features
      end

      private
      def load_features
        feats = []
        with_each_feature { |f| feats << f }
        feats
      end
    end

    attr_reader :name, :description
    def initialize(feature_name, feature_yaml_opts)
      @name = feature_name
      feature_yaml_opts ||= {}
      @description = feature_yaml_opts["description"]
    end
  end
end
