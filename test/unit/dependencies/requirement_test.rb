require 'helper'
require 'inspec/dependencies/requirement'

describe Inspec::Requirement do
  describe '#source_satisfies_spec?' do
    let(:req) { Inspec::Requirement.new('foo', constraints, nil, nil, {}) }

    describe 'when there are no version constraints' do
      let(:constraints) { nil }
      it 'returns true' do
        req.source_satisfies_spec?.must_equal true
      end
    end

    describe 'when there is a single, matching version constraint' do
      let(:constraints) { '>= 1' }
      it 'returns true' do
        profile = mock
        profile.stubs(:version).returns('2.0.0')
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal true
      end
    end

    describe 'when there is a single, non-matching version constraint' do
      let(:constraints) { '>= 2' }
      it 'returns true' do
        profile = mock
        profile.stubs(:version).returns('1.0.0')
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal false
      end
    end

    describe 'when there are multiple matching version constraints' do
      let(:constraints) { ['>= 1', '< 3'] }
      it 'returns true' do
        profile = mock
        profile.stubs(:version).returns('2.0.0')
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal true
      end
    end

    describe 'when there are multiple version constraints and one does not match' do
      let(:constraints) { ['>= 1', '< 3'] }
      it 'returns true' do
        profile = mock
        profile.stubs(:version).returns('4.0.0')
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal false
      end
    end

    describe 'when a profile has a version with a build number and the constraint matches' do
      let(:constraints) { '>= 1' }
      it 'returns true' do
        profile = mock
        profile.stubs(:version).returns('2.0.0+1')
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal true
      end
    end

    describe 'when the constraint is the default >=0 and the profile has a pre-release number' do
      let(:constraints) { '>= 0' }
      it 'returns true' do
        profile = mock
        profile.stubs(:version).returns('2.0.0-1')
        req.stubs(:profile).returns(profile)
        req.source_satisfies_spec?.must_equal true
      end
    end
  end
end
