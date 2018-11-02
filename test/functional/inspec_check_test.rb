# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'
require 'jsonschema'
require 'tmpdir'

describe 'inspec check' do
  include FunctionalHelper

  describe 'inspec check with json formatter' do
    it 'can check a profile and produce valid JSON' do
      out = inspec('check ' + integration_test_path + ' --format json')
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

  describe 'inspec check should catch a duplicate control' do
    describe 'when a simple profile has duplicates' do
      it 'can detect a duplicate control' do
        dupe_profile = File.join(profile_path, 'dupe-controls', 'simple')
        run_result = inspec('check ' + dupe_profile + ' --format json')
        run_result.exit_status.must_equal 1
        json_result = JSON.parse(run_result.stdout)

        # Must detect exactly one error
        json_result['errors'].count.must_equal 1

        json_result['errors'][0]['control_id'].must_equal 'dupe-01' # Find the right control
        json_result['errors'][0]['msg'].must_include 'is duplicated in profile dupe-controls' # The kernel of the error message
        json_result['errors'][0]['msg'].must_include 'clobbered by' # And we tell you that is was overwritten
        json_result['errors'][0]['msg'].must_include 'duplicates.rb:14' # And we tell you what overwrote it
      end
    end

    describe 'when a profile uses include_controls without a block' do
      it 'should not detect a duplicate control' do
        dupe_profile = File.join(profile_path, 'dupe-controls', 'wrapper-simple-include')
        run_result = inspec('check ' + dupe_profile + ' --format json')
        run_result.exit_status.must_equal 0
        run_result.stderr.must_be_empty
        json_result = JSON.parse(run_result.stdout)

        # Must detect no errors
        json_result['errors'].count.must_equal 0
      end
    end

    describe 'when a profile uses include_controls with a block to modify a control' do
      it 'should not detect a duplicate control' do
        dupe_profile = File.join(profile_path, 'dupe-controls', 'wrapper-block-include')
        run_result = inspec('check ' + dupe_profile + ' --format json')
        json_result = JSON.parse(run_result.stdout)
        run_result.exit_status.must_equal 0

        # Must detect no errors
        json_result['errors'].count.must_equal 0
      end
    end
  end
end
