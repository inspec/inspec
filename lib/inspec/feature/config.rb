require "inspec/iaf_file" # Uses some of the same encryption routines

module Inspec
  class Feature
    class Config

      VERIFICATION_KEY_NAME = "progress-2022-05-04".freeze

      attr_reader :cfg_data, :valid

      def initialize(conf_path = nil)
        # If conf path is nil, read from source installation
        conf_path ||= File.join(Inspec.src_root, "etc", "features.yaml")

        # Verify path and sig file exists or else throw exception
        sig_path = conf_path.sub(/\.yaml/, ".sig")
        [conf_path, sig_path].each do |file|
          raise Inspec::FeatureConfigMissingError.new("No such file #{file}") unless File.exist?(file)
        end

        # Verify sig matches contents
        validation_key_path = Inspec::IafFile.find_validation_key(VERIFICATION_KEY_NAME)
        verification_key = Inspec::IafFile::KEY_ALG.new File.read validation_key_path
        signature = Base64.decode64 File.read sig_path
        digest = Inspec::IafFile::ARTIFACT_DIGEST.new
        unless verification_key.verify digest, signature, File.read(conf_path)
          # If not load default empty config and raise exception
          @cfg_data = load_error_data
          raise Inspec::FeatureConfigTamperedError.new("Feature yaml file does not match signature - tampered?")
        end

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

        @features_by_name[feature_name] ||= Inspec::Feature.new(feature_name.to_sym, raw_info)
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

      # Default data for when the config is in an error state.
      def load_error_data
        {
          "features": {},
        }
      end
    end
  end
end
