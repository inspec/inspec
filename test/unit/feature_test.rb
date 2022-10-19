# This file tests Inspec::Feature functionality,
# which allows you to declare a group of functionality
# for purposes of logging, entitlement, feature flagging,
# telemetry, and other future purposes

require "helper"
require "logger"
require "stringio"

require "inspec/feature"

describe "Inspec::Feature" do
  let(:fixtures_path) { "test/fixtures" }
  it "should be a class" do
    _(Inspec::Feature).must_be_kind_of Class
  end

  #======================
  # The global convenience method with_feature
  #======================
  # It exists
  describe "Inspec.with_feature" do
    it "should have a with_feature class method" do
      _(Inspec.respond_to?(:with_feature)).must_equal true
    end
    it "should take a symbol, options, and a block" do
      _(Inspec.method(:with_feature).arity).must_equal(-2)
    end

    it "defaults to calling the block" do
      called = false
      Inspec.with_feature(:test_feature) do
        called = true
      end
      _(called).must_equal true
    end

    let(:feature_config_file) { File.join(fixtures_path, "features-01.yaml") }
    let(:cfg) { Inspec::Feature::Config.new(feature_config_file) }
    it "accepts a config as an option" do
      called = false
      Inspec.with_feature("test-feature-01", config: cfg) do
        called = true
      end
      # TODO: need a better test to verify that the feature was recognized
      _(called).must_equal true
    end

    # Integration with Logger
    let(:logger_io) { StringIO.new }
    let(:logger) { l = Logger.new(logger_io); l.level = Logger::DEBUG; l; }
    it "accepts a logger as an option" do
      Inspec.with_feature("test-feature-01", config: cfg, logger: logger) do
      end
      _(logger_io.string).must_match(/test-feature-01/)
    end

    # Validation of feature names
    it "validates feature names" do
      Inspec.with_feature("test-feature-nonesuch", config: cfg, logger: logger) do
      end
      _(logger_io.string).must_match(/WARN/)
      _(logger_io.string).must_match(/test-feature-nonesuch/)
    end
  end

  # TODO: Integration with Entitlement
  # TODO: Integration with feature flagging
  # TODO: Integration with usage telemetry

  #======================
  # Internals
  #======================

  #------------------------
  # Inspec::Feature::Config
  #------------------------
  describe "Inspec::Feature::Config" do
    describe "when you load it from a specified file" do
      let(:feature_config_file) { File.join(fixtures_path, "features-01.yaml") }
      # you should be able to load it from a test file
      let(:cfg) { Inspec::Feature::Config.new(feature_config_file) }
      it "lists features in a block" do
        feats = []
        cfg.with_each_feature do |f|
          feats << f
        end
        # you should be able to list features
        #  as Inspec::Features
        _(feats.length).must_equal 2
        _(feats[0]).must_be_kind_of Inspec::Feature
      end

      it "allows calling features by name with brackets" do
        _(cfg["test-feature-01"]).must_be_kind_of Inspec::Feature
      end

      it "allows detecting if a name is a feature" do
        _(cfg.feature_name?("test-feature-01")).must_equal true
        _(cfg.feature_name?("test-feature-99")).must_equal false
      end

      it "allows accessing the array of features as a method" do
        _(cfg.features).must_be_kind_of Array
        _(cfg.features.length).must_equal 2
        _(cfg.features[0]).must_be_kind_of Inspec::Feature
      end
    end

    describe "when you load it from the default location" do
      let(:cfg) { Inspec::Feature::Config.new }
      it "lists features" do
        feats = []
        cfg.with_each_feature do |f|
          feats << f
        end
        # loading from the default location should result in
        #   at least two features

        # you should be able to list features
        #  as Inspec::Features
        _(feats.length).must_be :>, 2
        _(feats[0]).must_be_kind_of Inspec::Feature
      end
    end

    describe "when you load it from a tampered file" do
      let(:tampered_config_file) { File.join(fixtures_path, "features-tampered.yaml") }
      it "throws an exception and loads no features" do
        _ { Inspec::Feature::Config.new(tampered_config_file) }.must_raise(Inspec::FeatureConfigTamperedError)
      end
    end
  end
end
