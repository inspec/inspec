require 'helper'
require 'inspec/profile_context'
require 'inspec/runner_mock'
require 'inspec/resource'
require 'inspec/resources/command'


describe Inspec::Profile do
  let(:logger) { Minitest::Mock.new }
  let(:home) { MockLoader.home }

  describe 'with an empty profile' do
    let(:profile) { MockLoader.load_profile('empty-metadata') }

    it 'has a default name containing the original target' do
      profile.params[:name].must_match(/tests from .*empty-metadata/)
    end

    it 'has no controls' do
      profile.params[:controls].must_equal({})
    end
  end

  describe 'with simple metadata in profile' do
    let(:profile_id) { 'simple-metadata' }
    let(:profile) { MockLoader.load_profile(profile_id) }

    it 'has metadata' do
      profile.params[:name].must_equal 'yumyum profile'
    end

    it 'has no controls' do
      profile.params[:controls].must_equal({})
    end

    it 'can overwrite the profile ID' do
      testID = rand.to_s
      res = MockLoader.load_profile(profile_id, id: testID)
      res.params[:name].must_equal testID
    end
  end

  describe 'SHA256 sums' do
    it 'works on an empty profile' do
      MockLoader.load_profile('empty-metadata').sha256.must_equal 'ee95f4cf4258402604d4cc581a672bbd2f73d212b09cd4bcf1c5984e97e68963'
    end

    it 'works on a complete profile' do
      MockLoader.load_profile('complete-profile').sha256.must_equal 'f63142e0e4c62469339eab2c16fee2ead2e3dd781492a1dcb1a218424e4d90b3'
    end
  end

  describe 'code info' do
    let(:profile_id) { 'complete-profile' }
    let(:code) { "control 'test01' do\n  impact 0.5\n  title 'Catchy title'\n  desc '\n    example.com should always exist.\n  '\n  describe host('example.com') do\n    it { should be_resolvable }\n  end\nend\n" }
    let(:loc) { {:ref=>"controls/host_spec.rb", :line=>5} }

    it 'gets code from an uncompressed profile' do
      info = MockLoader.load_profile(profile_id).info
      info[:controls][0][:code].must_equal code
      loc[:ref] = File.join(MockLoader.profile_path(profile_id), loc[:ref])
      info[:controls][0][:source_location].must_equal loc
    end

    it 'gets code on zip profiles' do
      path = MockLoader.profile_zip(profile_id)
      info = MockLoader.load_profile(path).info
      info[:controls][0][:code].must_equal code
      info[:controls][0][:source_location].must_equal loc
    end

    it 'gets code on tgz profiles' do
      path = MockLoader.profile_tgz(profile_id)
      info = MockLoader.load_profile(path).info
      info[:controls][0][:code].must_equal code
      info[:controls][0][:source_location].must_equal loc
    end
  end

  describe 'code info with supports override' do
    let(:profile_id) { 'skippy-profile-os' }

    it 'overrides os-name and os-family' do
      path = MockLoader.profile_zip(profile_id)
      info = MockLoader.load_profile(path).info
      info[:supports][0][:"platform-family"].must_equal "definitely_not_supported"
      info[:supports][1][:"platform-name"].must_equal "definitely_also_not_supported"
    end
  end

  describe 'skips loading on unsupported platform' do
    let(:profile_id) { 'windows-only' }

    it 'loads our profile but skips loading controls' do
      skip 'Mock loader always supports all platforms - bad test, ref #3750 '
      info = MockLoader.load_profile(profile_id).info
      info[:controls].must_be_empty
    end
  end

  describe 'when checking' do
    describe 'an empty profile' do
      let(:profile_id) { 'empty-metadata' }

      it 'prints loads of warnings' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :error, nil, ["Missing profile version in inspec.yml"]
        logger.expect :warn, nil, ["Missing profile summary in inspec.yml"]
        logger.expect :warn, nil, ["Missing profile maintainer in inspec.yml"]
        logger.expect :warn, nil, ["Missing profile copyright in inspec.yml"]
        logger.expect :warn, nil, ["Missing profile license in inspec.yml"]
        logger.expect :warn, nil, ['No controls or tests were defined.']

        result = MockLoader.load_profile(profile_id, {logger: logger}).check
        # verify logger output
        logger.verify

        # verify hash result
        result[:summary][:valid].must_equal false
        result[:summary][:location].must_equal "#{home}/mock/profiles/#{profile_id}"
        result[:summary][:profile].must_match(/tests from .*empty-metadata/)
        result[:summary][:controls].must_equal 0
        result[:errors].length.must_equal 1
        result[:warnings].length.must_equal 5
      end
    end

    describe 'a complete metadata profile' do
      let(:profile_id) { 'complete-metadata' }
      let(:profile) { MockLoader.load_profile(profile_id, {logger: logger}) }

      it 'prints ok messages' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :info, nil, ['Metadata OK.']
        logger.expect :warn, nil, ['No controls or tests were defined.']

        result = profile.check

        # verify logger output
        logger.verify

        # verify hash result
        result[:summary][:valid].must_equal true
        result[:summary][:location].must_equal "#{home}/mock/profiles/#{profile_id}"
        result[:summary][:profile].must_equal 'name'
        result[:summary][:controls].must_equal 0
        result[:errors].length.must_equal 0
        result[:warnings].length.must_equal 1
      end
    end

    describe 'a complete metadata profile with controls' do
      let(:profile_id) { 'complete-profile' }

      it 'prints ok messages and counts the controls' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :info, nil, ['Metadata OK.']
        logger.expect :info, nil, ['Found 1 controls.']
        logger.expect :info, nil, ['Control definitions OK.']

        result = MockLoader.load_profile(profile_id, {logger: logger}).check
        # verify logger output
        logger.verify

        # verify hash result
        result[:summary][:valid].must_equal true
        result[:summary][:location].must_equal "#{home}/mock/profiles/#{profile_id}"
        result[:summary][:profile].must_equal 'complete'
        result[:summary][:controls].must_equal 1
        result[:errors].length.must_equal 0
        result[:warnings].length.must_equal 0
      end
    end

    describe 'a complete metadata profile with controls in a tarball' do
      let(:profile_id) { 'complete-profile' }
      let(:profile_path) { MockLoader.profile_tgz(profile_id) }
      let(:profile) { MockLoader.load_profile(profile_path, {logger: logger}) }

      it 'prints ok messages and counts the controls' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :info, nil, ['Metadata OK.']
        logger.expect :info, nil, ['Found 1 controls.']
        logger.expect :info, nil, ['Control definitions OK.']

        result = MockLoader.load_profile(profile_id, {logger: logger}).check
        # verify logger output
        logger.verify

        # verify hash result
        result[:summary][:valid].must_equal true
        result[:summary][:location].must_equal "#{home}/mock/profiles/#{profile_id}"
        result[:summary][:profile].must_equal 'complete'
        result[:summary][:controls].must_equal 1
        result[:errors].length.must_equal 0
        result[:warnings].length.must_equal 0
      end
    end

    describe 'a complete metadata profile with controls in zipfile' do
      let(:profile_id) { 'complete-profile' }
      let(:profile_path) { MockLoader.profile_zip(profile_id) }
      let(:profile) { MockLoader.load_profile(profile_path, {logger: logger}) }

      it 'prints ok messages and counts the controls' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :info, nil, ['Metadata OK.']
        logger.expect :info, nil, ['Found 1 controls.']
        logger.expect :info, nil, ['Control definitions OK.']

        result = MockLoader.load_profile(profile_id, {logger: logger}).check
        # verify logger output
        logger.verify

        # verify hash result
        result[:summary][:valid].must_equal true
        result[:summary][:location].must_equal "#{home}/mock/profiles/#{profile_id}"
        result[:summary][:profile].must_equal 'complete'
        result[:summary][:controls].must_equal 1
        result[:errors].length.must_equal 0
        result[:warnings].length.must_equal 0
      end
    end

    describe 'a complete metadata profile with controls in zipfile' do
      let(:profile_id) { 'complete-profile' }
      let(:profile_path) { MockLoader.profile_zip(profile_id) }
      let(:profile) { MockLoader.load_profile(profile_path, {logger: logger}) }

      it 'prints ok messages and counts the controls' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :info, nil, ['Metadata OK.']
        logger.expect :info, nil, ['Found 1 controls.']
        logger.expect :info, nil, ['Control definitions OK.']

        result = MockLoader.load_profile(profile_id, {logger: logger}).check
        # verify logger output
        logger.verify

        # verify hash result
        result[:summary][:valid].must_equal true
        result[:summary][:location].must_equal "#{home}/mock/profiles/#{profile_id}"
        result[:summary][:profile].must_equal 'complete'
        result[:summary][:controls].must_equal 1
        result[:errors].length.must_equal 0
        result[:warnings].length.must_equal 0
      end
    end

    describe 'shows error if version is invalid' do
      let(:profile_id) { 'invalid-version' }
      let(:profile_path) { MockLoader.profile_zip(profile_id) }
      let(:profile) { MockLoader.load_profile(profile_path, {logger: logger}) }

      it 'prints ok messages and counts the controls' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :warn, nil, ['No controls or tests were defined.']
        logger.expect :error, nil, ['Version needs to be in SemVer format']

        result = MockLoader.load_profile(profile_id, {logger: logger}).check

        # verify logger output
        logger.verify

        # verify hash result
        result[:summary][:valid].must_equal false
        result[:summary][:location].must_equal "#{home}/mock/profiles/#{profile_id}"
        result[:summary][:profile].must_equal 'invalid-version'

        result[:summary][:controls].must_equal 0
        result[:errors].length.must_equal 1
        result[:warnings].length.must_equal 1
      end
    end

    describe 'a profile with a slash in the name' do
      let(:profile_path) { 'slash-in-name/not-allowed' } # Slashes allowed here
      let(:profile_name) { 'slash-in-name/not-allowed' }   # But not here
      it 'issues an error' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_path}"]
        logger.expect :error, nil, ["The profile name (#{profile_name}) contains a slash which " \
          'is not permitted. Please remove all slashes from `inspec.yml`.']
        logger.expect :info, nil, ['Found 1 controls.']
        logger.expect :info, nil, ['Control definitions OK.']

        result = MockLoader.load_profile(profile_path, {logger: logger}).check
        logger.verify
        result[:warnings].length.must_equal 0
        result[:errors].length.must_equal 1
      end
    end

    describe 'shows warning if license is invalid' do
      let(:profile_id) { 'license-invalid' }
      let(:profile_path) { MockLoader.profile_zip(profile_id) }
      let(:profile) { MockLoader.load_profile(profile_path, {logger: logger}) }

      it 'prints ok messages and counts the controls' do
        logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
        logger.expect :warn, nil, ["License 'Invalid License Name' needs to be in SPDX format or marked as 'Proprietary'. See https://spdx.org/licenses/."]
        logger.expect :warn, nil, ['No controls or tests were defined.']
        logger.expect :info, nil, ["Metadata OK."]

        result = MockLoader.load_profile(profile_id, {logger: logger}).check

        # verify logger output
        logger.verify

        # verify hash result
        result[:summary][:valid].must_equal true
        result[:summary][:location].must_equal "#{home}/mock/profiles/#{profile_id}"
        result[:summary][:profile].must_equal 'license-invalid'

        result[:summary][:controls].must_equal 0
        result[:errors].length.must_equal 0
        result[:warnings].length.must_equal 2
      end

      describe 'shows no warning if license is spdx' do
        let(:profile_id) { 'license-spdx' }
        let(:profile_path) { MockLoader.profile_zip(profile_id) }
        let(:profile) { MockLoader.load_profile(profile_path, {logger: logger}) }

        it 'prints ok messages and counts the controls' do
          logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
          logger.expect :warn, nil, ['No controls or tests were defined.']
          logger.expect :info, nil, ["Metadata OK."]

          result = MockLoader.load_profile(profile_id, {logger: logger}).check

          # verify logger output
          logger.verify

          # verify hash result
          result[:summary][:valid].must_equal true
          result[:summary][:location].must_equal "#{home}/mock/profiles/#{profile_id}"
          result[:summary][:profile].must_equal 'license-spdx'

          result[:summary][:controls].must_equal 0
          result[:errors].length.must_equal 0
          result[:warnings].length.must_equal 1
        end
      end

      describe 'accepts proprietary license' do
        let(:profile_id) { 'license-proprietary' }
        let(:profile_path) { MockLoader.profile_zip(profile_id) }
        let(:profile) { MockLoader.load_profile(profile_path, {logger: logger}) }

        it 'prints ok messages and counts the controls' do
          logger.expect :info, nil, ["Checking profile in #{home}/mock/profiles/#{profile_id}"]
          logger.expect :warn, nil, ['No controls or tests were defined.']
          logger.expect :info, nil, ["Metadata OK."]

          result = MockLoader.load_profile(profile_id, {logger: logger}).check

          # verify logger output
          logger.verify

          # verify hash result
          result[:summary][:valid].must_equal true
          result[:summary][:location].must_equal "#{home}/mock/profiles/#{profile_id}"
          result[:summary][:profile].must_equal 'license-proprietary'

          result[:summary][:controls].must_equal 0
          result[:errors].length.must_equal 0
          result[:warnings].length.must_equal 1
        end
      end
    end
  end
end
