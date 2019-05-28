require 'helper'
require 'inspec/profile_context'

describe 'resource exception' do
  let(:profile) do
    profile = MockLoader.load_profile('profile-with-resource-exceptions')
    profile.load_libraries
    profile.collect_tests
    profile
  end

  let(:checks) do
    checks = []
    profile.runner_context.rules.values.each do |rule|
      checks.push(Inspec::Rule.prepare_checks(rule))
    end
    checks
  end

  describe 'within initialize' do
    it 'skips resource when `Inspec::Exceptions::ResourceSkipped` is raised' do
      checks[0][0][1][0].resource_skipped?.must_equal true
      checks[0][0][1][0].resource_exception_message.must_equal 'Skipping because reasons'
      checks[0][0][1][0].resource_failed?.must_equal false
    end

    it 'fails resource when `Inspec::Exceptions::ResourceFailed` is raised' do
      checks[1][0][1][0].resource_failed?.must_equal true
      checks[1][0][1][0].resource_exception_message.must_equal 'Failing because reasons'
      checks[1][0][1][0].resource_skipped?.must_equal false
    end

    it 'does not affect other tests' do
      checks[2][0][1][0].resource_skipped?.must_equal false
      checks[2][0][1][0].resource_failed?.must_equal false
      checks[2][0][1][0].resource_exception_message.must_be_nil
    end
  end

  describe 'within a matcher' do
    it 'fails resource when `Inspec::Exceptions::ResourceFailed` is raised' do
      checks[3][0][1][0].resource_failed?.must_equal true
      checks[3][0][1][0].resource_exception_message.must_equal 'Failing inside matcher'
      checks[3][0][1][0].resource_skipped?.must_equal false
    end

    it 'skips resource when `Inspec::Exceptions::ResourceSkipped` is raised' do
      checks[4][0][1][0].resource_skipped?.must_equal true
      checks[4][0][1][0].resource_exception_message.must_equal 'Skipping inside matcher'
      checks[4][0][1][0].resource_failed?.must_equal false
    end
  end

  describe 'within a control' do
    it 'skips resource when `Inspec::Exceptions::ResourceSkipped` is raised' do
      checks[5][0][1][0].resource_skipped?.must_equal true
      checks[5][0][1][0].resource_exception_message.must_equal 'Skipping because reasons'
      checks[5][0][1][0].resource_failed?.must_equal false
    end

    it 'fails resource when `Inspec::Exceptions::ResourceFailed` is raised' do
      checks[5][1][1][0].resource_failed?.must_equal true
      checks[5][1][1][0].resource_exception_message.must_equal 'Failing because reasons'
      checks[5][1][1][0].resource_skipped?.must_equal false
    end
  end

  describe 'within FilterTable' do
    it 'skips resource when `Inspec::Exceptions::ResourceSkipped` is raised' do
      checks[6][0][1][0].resource_skipped?.must_equal true
      checks[6][0][1][0].resource_exception_message.must_equal 'Skipping inside FilterTable'
      checks[6][0][1][0].resource_failed?.must_equal false
    end

    it 'fails resource when `Inspec::Exceptions::ResourceFailed` is raised' do
      checks[7][0][1][0].resource_failed?.must_equal true
      checks[7][0][1][0].resource_exception_message.must_equal 'Failing inside FilterTable'
      checks[7][0][1][0].resource_skipped?.must_equal false
    end

    describe 'and multiple filters are used' do
      it 'skips resource when `Inspec::Exceptions::ResourceSkipped` is raised' do
        checks[8][0][1][0].resource_skipped?.must_equal true
        checks[8][0][1][0].resource_exception_message.must_equal 'Skipping inside FilterTable'
        checks[8][0][1][0].resource_failed?.must_equal false
      end

      it 'fails resource when `Inspec::Exceptions::ResourceFailed` is raised' do
        checks[9][0][1][0].resource_failed?.must_equal true
        checks[9][0][1][0].resource_exception_message.must_equal 'Failing inside FilterTable'
        checks[9][0][1][0].resource_skipped?.must_equal false
      end

      it 'does not halt the run/fail all tests when an incorrect filter is used' do
        checks[10][0][1][0].resource_skipped?.must_equal true
        checks[10][0][1][0].resource_exception_message.must_equal 'Skipping inside FilterTable'
        checks[10][0][1][0].resource_failed?.must_equal false
      end

      it 'does not halt the run/fail all tests when an incorrect filter is used' do
        checks[11][0][1][0].resource_failed?.must_equal true
        checks[11][0][1][0].resource_exception_message.must_equal 'Failing inside FilterTable'
        checks[11][0][1][0].resource_skipped?.must_equal false
      end
    end

    it 'does not affect regular FilterTable usage' do
      checks[12][0][1][0].another_filter.must_equal ['example']
    end
  end
end
