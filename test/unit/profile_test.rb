# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/profile_context'
require 'inspec/runner'

describe Inspec::Profile do
  before {
    # mock up the profile runner
    # TODO: try to take the real profile runner here;
    # currently it's stopped at test runner conflicts
    class Inspec::Profile::Runner
      def initialize(opts) end
      def add_tests(tests, options=nil) end
      def rules
        {}
      end
    end
  }

  let(:logger) { Minitest::Mock.new }
  let(:home) { File.dirname(__FILE__) }

  def load_profile(name, opts = {})
    Inspec::Profile.from_path("#{home}/mock/profiles/#{name}", opts)
  end

  describe 'with empty profile' do
    let(:profile) { load_profile('empty') }

    it 'has no metadata' do
      profile.params[:name].must_be_nil
    end

    it 'has no rules' do
      profile.params[:rules].must_equal({})
    end
  end

  describe 'with normal metadata in profile' do
    let(:profile) { load_profile('metadata') }

    it 'has metadata' do
      profile.params[:name].must_equal 'metadata profile'
    end

    it 'has no rules' do
      profile.params[:rules].must_equal({})
    end
  end

  describe 'when checking' do
    describe 'an empty profile' do
      let(:profile) { load_profile('empty', {logger: logger}) }

      it 'prints loads of warnings' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/empty"]
        logger.expect :warn, nil, ['The use of `metadata.rb` is deprecated. Use `inspec.yml`.']
        logger.expect :error, nil, ['Missing profile name in metadata.rb']
        logger.expect :error, nil, ['Missing profile version in metadata.rb']
        logger.expect :warn, nil, ['Missing profile title in metadata.rb']
        logger.expect :warn, nil, ['Missing profile summary in metadata.rb']
        logger.expect :warn, nil, ['Missing profile maintainer in metadata.rb']
        logger.expect :warn, nil, ['Missing profile copyright in metadata.rb']
        logger.expect :warn, nil, ['No controls or tests were defined.']

        profile.check
        logger.verify
      end
    end

    describe 'a complete metadata profile (legacy mode)' do
      let(:profile) { load_profile('complete-meta', {logger: logger}) }

      it 'prints ok messages' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/complete-meta"]
        logger.expect :warn, nil, ['The use of `metadata.rb` is deprecated. Use `inspec.yml`.']
        logger.expect :info, nil, ['Metadata OK.']
        logger.expect :warn, nil, ["Profile uses deprecated `test` directory, rename it to `controls`."]
        logger.expect :warn, nil, ['No controls or tests were defined.']

        profile.check
        logger.verify
      end

      it 'doesnt have constraints on supported systems' do
        profile.metadata.params.wont_include(:supports)
      end
    end

    describe 'a complete metadata profile with controls' do
      let(:profile) { load_profile('complete-profile', {logger: logger, ignore_supports: true}) }

      it 'prints ok messages and counts the rules' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/complete-profile"]
        logger.expect :info, nil, ['Metadata OK.']

        # TODO: cannot load rspec in unit tests, therefore we get a loading warn
        # RSpec does not work with minitest tests
        logger.expect :warn, nil, ['No controls or tests were defined.']
        # we expect that this should work:
        # logger.expect :info, nil, ['Found 1 rules.']
        # logger.expect :info, nil, ['Rule definitions OK.']

        profile.check
        logger.verify
      end
    end
  end
end
