require 'functional/helper'
require 'jsonschema'
require 'tmpdir'

describe 'inspec check' do
  include FunctionalHelper

  describe 'inspec check with json formatter' do
    it 'can check a profile and produce valid JSON' do
      out = inspec('check ' + example_profile + ' --format json')
      out.exit_status.must_equal 0
      JSON.parse(out.stdout)
    end
  end

  describe 'inspec check with special characters in path' do
    it 'can check a profile with special characters in its path' do
      out = inspec('check ' + File.join(profile_path, '{{special-path}}'))
      out.exit_status.must_equal 0
    end
  end

  describe 'inspec check with skipping/failing a resource in FilterTable' do
    it 'can check a profile containing resource exceptions' do
      out = inspec('check ' + File.join(profile_path, 'profile-with-resource-exceptions'))
      out.exit_status.must_equal 0
    end
  end

  describe 'inspec check with a profile containing only_if' do
    it 'ignores the `only_if`' do
      out = inspec('check ' + File.join(profile_path, 'only-if-os-nope'))
      out.exit_status.must_equal 0
    end
  end

  describe 'inspec check with a aws profile' do
    it 'ignore train connection error' do
      out = inspec('check ' + File.join(examples_path, 'profile-aws'))
      out.exit_status.must_equal 0
    end
  end

  describe 'inspec check with a azure profile' do
    it 'ignore train connection error' do
      out = inspec('check ' + File.join(examples_path, 'profile-azure'))
      out.exit_status.must_equal 0
    end
  end

  describe 'inspec check with alternate cache dir' do
    it 'writes to the alternate cache dir' do
      Dir.mktmpdir do |tmpdir|
        cache_dir = File.join(tmpdir, "inspec_check_test_cache")

        File.exist?(cache_dir).must_equal false
        out = inspec('check ' + integration_test_path + ' --vendor-cache ' + cache_dir)
        out.exit_status.must_equal 0

        File.exist?(cache_dir).must_equal true
      end
    end
  end

  describe 'inspec check for lockfile and dependencies' do
    it 'can check a profile where a lock file is not required' do
      out = inspec('check ' + File.join(profile_path, 'profile-lock-notrequired'))
      out.exit_status.must_equal 0
    end

    it 'can check a profile where a lock file is required' do
      out = inspec('check ' + File.join(profile_path, 'profile-lock-required'))
      out.exit_status.must_equal 1
      out.stdout.must_include 'profile needs to be vendored with `inspec vendor`.'
    end

    it 'can check a profile where lock file and inspec.yml are in synnc' do
      out = inspec('check ' + File.join(profile_path, 'profile-lock-insync'))
      out.exit_status.must_equal 0
    end

    it 'can check a profile where lock file and inspec.yml are in not synnc' do
      out = inspec('check ' + File.join(profile_path, 'profile-lock-outofsync'))
      out.exit_status.must_equal 1
      out.stdout.must_include 'inspec.yml and inspec.lock are out-of-sync. Please re-vendor with `inspec vendor`.'
      out.stdout.must_include 'Cannot find linux-baseline in lockfile. Please re-vendor with `inspec vendor`.'
    end
  end

  describe 'inspec check with invalid `include_controls` reference' do
    it 'raises an error matching /Cannot load \'invalid_name\'/' do
      invalid_profile = File.join(profile_path, 'invalid-include-controls')
      out = inspec('check ' + invalid_profile)
      out.exit_status.must_equal 1
      out.stderr.must_match /Cannot load 'no_such_profile'/
      out.stderr.must_match /not listed as a dependency/
    end
  end
end
