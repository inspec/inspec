require "minitest/autorun"
require "stringio"

require "inspec/utils/deprecation"

#===========================================================================#
#                           Mixins and Methods
#===========================================================================#
describe "The global deprecation method" do
  describe "when you load the deprecation system" do
    it "Inspec must have a class method" do
      _(Inspec).must_respond_to :deprecate
    end
    it "must take one required and two optional arg" do
      # See http://ruby-doc.org/core-2.5.3/Method.html#method-i-arity
      _(Inspec.method(:deprecate).arity).must_equal(-2)
    end
  end
end

#===========================================================================#
#                            Config File
#===========================================================================#
describe "The deprecation config file object" do

  #---------------------------------------------------------------------------#
  #                           Config File Validation
  #---------------------------------------------------------------------------#

  describe "validating the contents" do
    let(:config_file) { Inspec::Deprecation::ConfigFile.new(cfg_io) }
    let(:cfg_io) { DeprecationTestHelper::Config.get_io_for_fixture(cfg_fixture) }

    # We use expectations in most of the file, but for exceptions,
    # assertions are easier to work with
    describe "when the file version is missing" do
      let(:cfg_fixture) { :missing_file_version }
      it "should throw an InvalidConfigFileError" do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        _(ex.message).must_include "Missing file_version field"
      end
    end

    describe "when the file version is unsupported" do
      let(:cfg_fixture) { :bad_file_version }
      it "should throw an InvalidConfigFileError" do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        _(ex.message).must_include "Unrecognized file_version" # message
        _(ex.message).must_include "2.0.0" # version that IS supported
        _(ex.message).must_include "99.99.99" # version that was seen
      end
    end

    describe "when the groups entry is not a hash" do
      let(:cfg_fixture) { :groups_not_hash }
      it "should throw an InvalidConfigFileError" do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        _(ex.message).must_include "Groups field must be a Hash" # message
      end
    end

    describe "when a group entry has an unrecognized action" do
      let(:cfg_fixture) { :bad_group_action }
      it "should throw an UnrecognizedActionError" do
        ex = assert_raises(Inspec::Deprecation::UnrecognizedActionError) { config_file }
        _(ex.message).must_include "Unrecognized action" # message
        _(ex.message).must_include "methane_pockets" # offending group name
        _(ex.message).must_include "ignore" # an action that IS supported
        _(ex.message).must_include "exit" # an action that IS supported
        _(ex.message).must_include "fail_control" # an action that IS supported
        _(ex.message).must_include "warn" # an action that IS supported
        _(ex.message).must_include "explode" # action that was seen
      end
    end

    describe "when a group entry has an unrecognized field" do
      let(:cfg_fixture) { :bad_group_field }
      it "should throw an InvalidConfigError" do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        _(ex.message).must_include "Unrecognized field" # message
        _(ex.message).must_include "pansporia" # offending group name
        _(ex.message).must_include "action" # a field that IS supported
        _(ex.message).must_include "suffix" # a field that IS supported
        _(ex.message).must_include "prefix" # a field that IS supported
        _(ex.message).must_include "exit_status" # a field that IS supported
        _(ex.message).must_include "martian" # field that was seen
      end
    end

    describe "when recognized actions are presented" do
      let(:cfg_fixture) { :basic }
      it "should see three groups" do
        _(config_file.groups.count).must_equal 4
      end
    end

    #---- "fallback_resource_packs" field
    # field is required
    describe "when correct fallback options are presented" do
      let(:cfg_fixture) { :basic }
      it "should see 2 fallback patterns" do
        _(config_file.fallback_resource_packs.count).must_equal 2
        # TODO examine structure
      end
    end

    # should be hash
    describe "when the fallback entry is not a hash" do
      let(:cfg_fixture) { :fallback_not_hash }
      it "should throw an InvalidConfigFileError" do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        _(ex.message).must_include "fallback_resource_packs field must be a Hash" # message
      end
    end

    # values should be valid regex
    describe "when the fallback entry is not a valid regexp" do
      let(:cfg_fixture) { :fallback_bad_regex }
      it "should throw an InvalidConfigFileError" do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        _(ex.message).must_include "Invalid regular expression" # message
        _(ex.message).must_include "'somepat{('" # offending regexp
      end
    end

    # should have gem key
    describe "when the fallback entry is missing gem key" do
      let(:cfg_fixture) { :fallback_missing_gem }
      it "should throw an InvalidConfigFileError" do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        _(ex.message).must_include "fallback_resource_packs missing gem name" # message
        _(ex.message).must_include "'somepat.+'" # offending pattern
      end
    end

    # should have message key
    describe "when the fallback entry is missing message key" do
      let(:cfg_fixture) { :fallback_missing_message }
      it "should throw an InvalidConfigFileError" do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        _(ex.message).must_include "fallback_resource_packs missing message" # message
        _(ex.message).must_include "'somepat.+'" # offending pattern
      end
    end
  end
end

#===========================================================================#
#                            Deprecator Class
#===========================================================================#

describe "The Deprecator object" do
  let(:cfg_io) { DeprecationTestHelper::Config.get_io_for_fixture(cfg_fixture) }

  describe "initializing" do
    let(:cfg_fixture) { :basic }

    describe "when it has no args" do
      it "should create an object with basic" do
        dpcr = Inspec::Deprecation::Deprecator.new
        _(dpcr).must_respond_to(:handle_deprecation)
        # TODO: more?
      end
    end

    describe "when it has an io arg" do
      it "should support certain methods" do
        dpcr = Inspec::Deprecation::Deprecator.new(config_io: cfg_io)
        _(dpcr.groups.count).must_equal 4
      end
    end
  end

  describe "when listing groups" do
    let(:dpcr) { Inspec::Deprecation::Deprecator.new(config_io: cfg_io) }

    describe "when there are no groups" do
      let(:cfg_fixture) { :empty }
      it "should report empty groups" do
        _(dpcr.groups.count).must_equal 0
      end
    end

    describe "when there are some groups" do
      let(:cfg_fixture) { :basic }
      it "should report four groups" do
        _(dpcr.groups.count).must_equal 4
      end
    end
  end

  describe "when listing fallback resource packs" do
    let(:dpcr) { Inspec::Deprecation::Deprecator.new(config_io: cfg_io) }

    describe "when there are no fallbacks" do
      let(:cfg_fixture) { :empty }
      it "should report empty fallbacks" do
        _(dpcr.fallback_resource_packs.count).must_equal 0
      end
    end

    describe "when there are two fallbacks" do
      let(:cfg_fixture) { :basic }
      it "should report two fallbacks" do
        _(dpcr.fallback_resource_packs.count).must_equal 2
      end
    end
  end

  # TODO: stack analysis
  #  in_control?
  # TODO: anything else here?
end

module DeprecationTestHelper
  class Config
    FIXTURES = {
      basic: <<~EOC0,
        {
          "file_version": "2.0.0", "unknown_group_action": "ignore",
          "groups": {
            "a_group_that_will_warn" : { "action": "warn", "suffix": "Did you know chickens are dinosaurs?" },
            "a_group_that_will_exit" : { "action": "exit", "exit_status": 8, "prefix": "No thanks!" },
            "an_ignored_group" : { "action": "ignore" },
            "a_group_that_will_fail" : { "action": "fail_control" }
          },
          "fallback_resource_packs": {
            "somepat.+": {
              "gem":"inspec-stuff-resources",
              "message":"Our Stuff"
            },
            "anotherpat.+": {
              "gem":"inspec-more-resources",
              "message":"Other Peoples Stuff"
            }
          }
        }
      EOC0
      v1: '{ "file_version": "1.0.0", "unknown_group_action": "ignore", "groups": {} }',
      missing_file_version: '{ "unknown_group_action": "ignore", "groups": {}, "fallback_resource_packs": {} }',
      bad_file_version: '{ "file_version": "99.99.99", "unknown_group_action": "ignore", "groups": {}, "fallback_resource_packs": {} }',
      groups_not_hash: '{ "file_version": "2.0.0", "groups": [], "fallback_resource_packs": {} }',
      empty: '{ "file_version": "2.0.0", "groups": {}, "fallback_resource_packs": {} }',
      bad_group_action: '{ "file_version": "2.0.0", "groups": { "methane_pockets" : { "action": "explode" } }, "fallback_resource_packs": {} }',
      bad_group_field: '{ "file_version": "2.0.0", "groups": { "pansporia" : { "martian": "yes" } }, "fallback_resource_packs":{}}',
      fallback_not_hash: '{ "file_version": "2.0.0", "groups": {}, "fallback_resource_packs": [] }',
      fallback_value_not_hash: '{ "file_version": "2.0.0", "groups": {}, "fallback_resource_packs": { "somepat.+":"" } }',
      fallback_bad_regex: <<~EOC1,
        {
          "file_version": "2.0.0",
          "groups": {},
          "fallback_resource_packs": {
            "somepat{(": {
              "gem": "inspec-stuff-resources",#{" "}
              "message": "Words"
            }
          }
        }
      EOC1
      fallback_missing_gem: <<~EOC2,
        {
          "file_version": "2.0.0",
          "groups": {},
          "fallback_resource_packs": {
            "somepat.+": {
              "message": "Words"
            }
          }
        }
      EOC2
      fallback_missing_message: <<~EOC3,
        {
          "file_version": "2.0.0",
          "groups": {},
          "fallback_resource_packs": {
            "somepat.+": {
              "gem": "inspec-stuff-resources"
            }
          }
        }
      EOC3
    }.freeze

    def self.get_io_for_fixture(fixture)
      StringIO.new(FIXTURES[fixture])
    end
  end
end
