# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/profile_context'
require 'inspec/runner'
require 'inspec/runner_mock'
require 'fileutils'

describe Inspec::Profile do
  let(:logger) { Minitest::Mock.new }
  let(:home) { File.dirname(__FILE__) }

  def load_profile(name, opts = {})
    opts[:test_collector] = Inspec::RunnerMock.new
    Inspec::Profile.from_path("#{home}/mock/profiles/#{name}", opts)
  end

  def load_profile_tgz(name, opts = {})
    path = "#{home}/mock/profiles/#{name}"
    `tar zcvf #{path}.tgz #{path}`
    load_profile("#{name}.tgz", opts)
    FileUtils.rm("#{path}.tgz")
  end

  def load_profile_zip(name, opts = {})
    path = "#{home}/mock/profiles/#{name}"
    `zip #{path}.zip #{path}`
    load_profile("#{name}.zip", opts)
    FileUtils.rm("#{path}.zip")
  end

  describe 'with an empty profile' do
    let(:profile) { load_profile('empty-metadata') }

    it 'has no metadata' do
      profile.params[:name].must_be_nil
    end

    it 'has no rules' do
      profile.params[:rules].must_equal({})
    end
  end

  describe 'with an empty profile (legacy mode)' do
    let(:profile) { load_profile('legacy-empty-metadata') }

    it 'has no metadata' do
      profile.params[:name].must_be_nil
    end

    it 'has no rules' do
      profile.params[:rules].must_equal({})
    end
  end

  describe 'with simple metadata in profile' do
    let(:profile_id) { 'simple-metadata' }
    let(:profile) { load_profile(profile_id) }

    it 'has metadata' do
      profile.params[:name].must_equal 'yumyum profile'
    end

    it 'has no rules' do
      profile.params[:rules].must_equal({})
    end

    it 'can overwrite the profile ID' do
      testID = rand.to_s
      res = load_profile(profile_id, id: testID)
      res.params[:name].must_equal testID
    end
  end

  describe 'with simple metadata in profile (legacy mode)' do
    let(:profile) { load_profile('legacy-simple-metadata') }

    it 'has metadata' do
      profile.params[:name].must_equal 'metadata profile'
    end

    it 'has no rules' do
      profile.params[:rules].must_equal({})
    end
  end

  describe 'when checking' do
    describe 'an empty profile' do
      let(:profile_id) { 'empty-metadata' }

      it 'prints loads of warnings' do
        inspec_yml = "#{home}/mock/profiles/#{profile_id}/inspec.yml"
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :error, nil, ["Missing profile name in #{inspec_yml}"]
        logger.expect :error, nil, ["Missing profile version in #{inspec_yml}"]
        logger.expect :warn, nil, ["Missing profile title in #{inspec_yml}"]
        logger.expect :warn, nil, ["Missing profile summary in #{inspec_yml}"]
        logger.expect :warn, nil, ["Missing profile maintainer in #{inspec_yml}"]
        logger.expect :warn, nil, ["Missing profile copyright in #{inspec_yml}"]
        logger.expect :warn, nil, ['No controls or tests were defined.']

        load_profile(profile_id, {logger: logger}).check
        logger.verify
      end
    end

    describe 'an empty profile (legacy mode)' do
      let(:profile_id) { 'legacy-empty-metadata' }

      it 'prints loads of warnings' do
        metadata_rb = "#{home}/mock/profiles/#{profile_id}/metadata.rb"
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :warn, nil, ['The use of `metadata.rb` is deprecated. Use `inspec.yml`.']
        logger.expect :error, nil, ["Missing profile name in #{metadata_rb}"]
        logger.expect :error, nil, ["Missing profile version in #{metadata_rb}"]
        logger.expect :warn, nil, ["Missing profile title in #{metadata_rb}"]
        logger.expect :warn, nil, ["Missing profile summary in #{metadata_rb}"]
        logger.expect :warn, nil, ["Missing profile maintainer in #{metadata_rb}"]
        logger.expect :warn, nil, ["Missing profile copyright in #{metadata_rb}"]
        logger.expect :warn, nil, ['No controls or tests were defined.']

        load_profile(profile_id, {logger: logger}).check
        logger.verify
      end
    end

    describe 'a complete metadata profile' do
      let(:profile_id) { 'complete-metadata' }
      let(:profile) { load_profile(profile_id, {logger: logger}) }

      it 'prints ok messages' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :info, nil, ['Metadata OK.']
        logger.expect :warn, nil, ['No controls or tests were defined.']

        profile.check
        logger.verify
      end
    end

    describe 'a complete metadata profile (legacy mode)' do
      let(:profile_id) { 'legacy-complete-metadata' }
      let(:profile) { load_profile(profile_id, {logger: logger}) }

      it 'prints ok messages' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :warn, nil, ['The use of `metadata.rb` is deprecated. Use `inspec.yml`.']
        logger.expect :info, nil, ['Metadata OK.']
        # NB we only look at content that is loaded, i.e., there're no empty directories anymore
        # logger.expect :warn, nil, ["Profile uses deprecated `test` directory, rename it to `controls`."]
        logger.expect :warn, nil, ['No controls or tests were defined.']

        profile.check
        logger.verify
      end

      it 'doesnt have constraints on supported systems' do
        profile.metadata.params.wont_include(:supports)
      end
    end

    describe 'a complete metadata profile with controls' do
      let(:profile_id) { 'complete-profile' }

      it 'prints ok messages and counts the rules' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :info, nil, ['Metadata OK.']
        logger.expect :info, nil, ['Found 1 rules.']
        logger.expect :debug, nil, ["Verify all rules in  #{home}/mock/profiles/#{profile_id}/controls/filesystem_spec.rb"]
        logger.expect :info, nil, ['Rule definitions OK.']

        load_profile(profile_id, {logger: logger}).check
        logger.verify
      end
    end

    describe 'a complete metadata profile with controls in a tarball' do
      let(:profile_id) { 'complete-profile' }
      let(:profile) { load_profile_tgz(profile_id, {logger: logger}) }

      it 'prints ok messages and counts the rules' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :info, nil, ['Metadata OK.']
        logger.expect :info, nil, ['Found 1 rules.']
        logger.expect :debug, nil, ["Verify all rules in  #{home}/mock/profiles/#{profile_id}/controls/filesystem_spec.rb"]
        logger.expect :info, nil, ['Rule definitions OK.']

        load_profile(profile_id, {logger: logger}).check
        logger.verify
      end
    end

    describe 'a complete metadata profile with controls in zipfile' do
      let(:profile_id) { 'complete-profile' }
      let(:profile) { load_profile_zip(profile_id, {logger: logger}) }

      it 'prints ok messages and counts the rules' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :info, nil, ['Metadata OK.']
        logger.expect :info, nil, ['Found 1 rules.']
        logger.expect :debug, nil, ["Verify all rules in  #{home}/mock/profiles/#{profile_id}/controls/filesystem_spec.rb"]
        logger.expect :info, nil, ['Rule definitions OK.']

        load_profile(profile_id, {logger: logger}).check
        logger.verify
      end
    end
  end
end
