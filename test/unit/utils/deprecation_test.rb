require 'minitest/autorun'
require 'stringio'

require 'utils/deprecation'

#===========================================================================#
#                           Mixins and Methods
#===========================================================================#
describe 'The global deprecation method' do
  describe 'when you load the deprecation system' do
    it 'Inspec must have a class method' do
      Inspec.must_respond_to :deprecate
    end
    it 'must take one required and two optional arg' do
      # See http://ruby-doc.org/core-2.5.3/Method.html#method-i-arity
      Inspec.method(:deprecate).arity.must_equal(-2)
    end
  end
end

#===========================================================================#
#                            Config File
#===========================================================================#
describe 'The deprecation config file object' do

  #---------------------------------------------------------------------------#
  #                           Config File Validation
  #---------------------------------------------------------------------------#

  describe 'validating the contents' do
    let(:config_file) { Inspec::Deprecation::ConfigFile.new(cfg_io) }
    let(:cfg_io) { DeprecationTestHelper::Config.get_io_for_fixture(cfg_fixture) }

    # We use expectations in most of the file, but for exceptions,
    # assertions are easier to work with
    describe 'when the file version is missing' do
      let(:cfg_fixture) { :missing_file_version }
      it 'should throw an InvalidConfigFileError' do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        ex.message.must_include 'Missing file_version field'
      end
    end

    describe 'when the file version is unsupported' do
      let(:cfg_fixture) { :bad_file_version }
      it 'should throw an InvalidConfigFileError' do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        ex.message.must_include 'Unrecognized file_version' # message
        ex.message.must_include '1.0.0' # version that IS supported
        ex.message.must_include '99.99.99' # version that was seen
      end
    end

    describe 'when the groups entry is not a hash' do
      let(:cfg_fixture) { :groups_not_hash }
      it 'should throw an InvalidConfigFileError' do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        ex.message.must_include 'Groups field must be a Hash' # message
      end
    end

    describe 'when a group entry has an unrecognized action' do
      let(:cfg_fixture) { :bad_group_action }
      it 'should throw an UnrecognizedActionError' do
        ex = assert_raises(Inspec::Deprecation::UnrecognizedActionError) { config_file }
        ex.message.must_include 'Unrecognized action' # message
        ex.message.must_include 'methane_pockets' # offending group name
        ex.message.must_include 'ignore' # an action that IS supported
        ex.message.must_include 'exit' # an action that IS supported
        ex.message.must_include 'fail_control' # an action that IS supported
        ex.message.must_include 'warn' # an action that IS supported
        ex.message.must_include 'explode' # action that was seen
      end
    end

    describe 'when a group entry has an unrecognized field' do
      let(:cfg_fixture) { :bad_group_field }
      it 'should throw an InvalidConfigError' do
        ex = assert_raises(Inspec::Deprecation::InvalidConfigFileError) { config_file }
        ex.message.must_include 'Unrecognized field' # message
        ex.message.must_include 'pansporia' # offending group name
        ex.message.must_include 'action' # a field that IS supported
        ex.message.must_include 'suffix' # a field that IS supported
        ex.message.must_include 'prefix' # a field that IS supported
        ex.message.must_include 'exit_status' # a field that IS supported
        ex.message.must_include 'martian' # field that was seen
      end
    end

    describe 'when recognized actions are presented' do
      let(:cfg_fixture) { :basic }
      it 'should see three groups' do
        config_file.groups.count.must_equal 4
      end
    end

  end
end

#===========================================================================#
#                            Deprecator Class
#===========================================================================#

describe 'The Deprecator object' do
  let(:cfg_io) { DeprecationTestHelper::Config.get_io_for_fixture(cfg_fixture) }

  describe 'initializing' do
    let(:cfg_fixture) { :basic }

    describe 'when it has no args' do
      it 'should create an object with basic' do
        dpcr = Inspec::Deprecation::Deprecator.new
        dpcr.must_respond_to(:handle_deprecation)
        # TODO: more?
      end
    end

    describe 'when it has an io arg' do
      it 'should support certain methods' do
        dpcr = Inspec::Deprecation::Deprecator.new(config_io: cfg_io)
        dpcr.groups.count.must_equal 4
      end
    end
  end

  describe 'when listing groups' do
    let(:dpcr) { Inspec::Deprecation::Deprecator.new(config_io: cfg_io) }

    describe 'when there are no groups' do
      let(:cfg_fixture) { :empty }
      it 'should report empty groups' do
        dpcr.groups.count.must_equal 0
      end
    end

    describe 'when there are some groups' do
      let(:cfg_fixture) { :basic }
      it 'should report four groups' do
        dpcr.groups.count.must_equal 4
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
          "file_version": "1.0.0", "unknown_group_action": "ignore",
          "groups": {
            "a_group_that_will_warn" : { "action": "warn", "suffix": "Did you know chickens are dinosaurs?" },
            "a_group_that_will_exit" : { "action": "exit", "exit_status": 8, "prefix": "No thanks!" },
            "an_ignored_group" : { "action": "ignore" },
            "a_group_that_will_fail" : { "action": "fail_control" }
          }
        }
      EOC0
      missing_file_version: '{ "unknown_group_action": "ignore", "groups": {} }',
      bad_file_version: '{ "file_version": "99.99.99", "unknown_group_action": "ignore", "groups": {} }',
      groups_not_hash: '{ "file_version": "1.0.0", "groups": [] }',
      empty: '{ "file_version": "1.0.0", "groups": {} }',
      bad_group_action: '{ "file_version": "1.0.0", "groups": { "methane_pockets" : { "action": "explode" } } }',
      bad_group_field: '{ "file_version": "1.0.0", "groups": { "pansporia" : { "martian": "yes" } } }',
    }.freeze

    def self.get_io_for_fixture(fixture)
      StringIO.new(FIXTURES[fixture])
    end
  end
end
