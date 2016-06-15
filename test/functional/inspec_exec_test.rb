# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'

describe 'inspec exec' do
  include FunctionalHelper

  it 'can execute the profile' do
    out = inspec('exec ' + example_profile)
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include "\n\e[32m[PASS]   ssh-1 Allow only SSH Protocol 2\e[0m\n"
    out.stdout.must_include "\n\e[32m[PASS]   tmp-1.0 Create /tmp directory\e[0m\n"
    out.stdout.must_include "\n\e[37m[SKIP]   gordon-1.0 Verify the version number of Gordon (1 skipped)\e[0m\n"
    out.stdout.must_include "\nSummary:   4 successful    0 failures    1 skipped\n"
  end

  it 'executes a minimum metadata-only profile' do
    out = inspec('exec ' + File.join(profile_path, 'simple-metadata'))
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_equal "
Profile: yumyum profile
Version: unknown


Summary:   0 successful    0 failures    0 skipped
"
  end

  it 'executes a metadata-only profile' do
    out = inspec('exec ' + File.join(profile_path, 'complete-metadata'))
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_equal "
Profile: title (name)
Version: 1.2.3


Summary:   0 successful    0 failures    0 skipped
"
  end

  it 'executes a specs-only profile' do
    out = inspec('exec ' + File.join(profile_path, 'spec_only'))
    out.stderr.must_equal ''
    out.exit_status.must_equal 1
    out.stdout.must_equal "
\e[32m[PASS]    working should eq \"working\"\e[0m
\e[37m[SKIP]    skippy This will be skipped intentionally.\e[0m
\e[31m[FAIL]    failing should eq \"as intended\"
expected: \"as intended\"
     got: \"failing\"

(compared using ==)
\e[0m

Summary:   1 successful    1 failures    1 skipped
"
  end

  it 'executes only specified controls' do
    out = inspec('exec ' + example_profile + ' --controls tmp-1.0')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include "\nSummary:   1 successful    0 failures    0 skipped\n"
  end

  it 'can execute a simple file with the default formatter' do
    out = inspec('exec ' + example_control)
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include 'Summary:   2 successful    0 failures    0 skipped'
  end

  describe 'with a profile that is not supported on this OS/platform' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'skippy-profile-os')) }
    let(:json) { JSON.load(out.stdout) }

    it 'exits with an error' do
      out.stderr.must_match /^This OS\/platform \(.+\) is not supported by this profile.$/
      out.exit_status.must_equal 1
    end
  end

  describe 'with a profile that is supported on this version of inspec' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'supported_inspec')) }

    it 'exits cleanly' do
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
    end
  end

  describe 'with a profile that is not supported on this version of inspec' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'unsupported_inspec')) }

    it 'does not support this profile' do
      out.exit_status.must_equal 1
      out.stderr.must_equal "This profile requires InSpec version >= 99.0.0. You are running InSpec v#{Inspec::VERSION}.\n"
    end
  end

  describe 'with a profile that loads a library and reference' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'library')) }

    it 'executes the profile without error' do
      out.exit_status.must_equal 0
    end
  end
end
