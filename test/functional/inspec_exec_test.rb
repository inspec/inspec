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
    stdout = out.stdout.force_encoding(Encoding::UTF_8)
    stdout.must_include "\n\e[32m  ✔  ssh-1: Allow only SSH Protocol 2\e[0m\n"
    stdout.must_include "\n\e[32m  ✔  tmp-1.0: Create /tmp directory\e[0m\n"
    stdout.must_include "
\e[37m  ○  gordon-1.0: Verify the version number of Gordon (1 skipped)\e[0m
\e[37m     ○  Can't find file \"/tmp/gordon/config.yaml\"\e[0m
"
    stdout.must_include "\nSummary: \e[32m4 successful\e[0m, \e[31m0 failures\e[0m, \e[37m1 skipped\e[0m\n"
  end

  it 'executes a minimum metadata-only profile' do
    out = inspec('exec ' + File.join(profile_path, 'simple-metadata'))
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_equal "

Profile: yumyum profile
Version: unknown
Target:  local://

     No tests executed.\e[0m

Summary: \e[32m0 successful\e[0m, \e[31m0 failures\e[0m, \e[37m0 skipped\e[0m
"
  end

  it 'executes a metadata-only profile' do
    out = inspec('exec ' + File.join(profile_path, 'complete-metadata'))
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_equal "

Profile: title (name)
Version: 1.2.3
Target:  local://

     No tests executed.\e[0m

Summary: \e[32m0 successful\e[0m, \e[31m0 failures\e[0m, \e[37m0 skipped\e[0m
"
  end

  it 'executes a specs-only profile' do
    out = inspec('exec ' + File.join(profile_path, 'spec_only'))
    out.stderr.must_equal ''
    out.exit_status.must_equal 1
    out.stdout.force_encoding(Encoding::UTF_8).must_equal "
Target:  local://


  working should
\e[32m     ✔  eq \"working\"\e[0m
  skippy This
\e[37m     ○  will be skipped intentionally.\e[0m
  failing should
\e[31m     ✖  eq \"as intended\"\e[0m

Summary: \e[32m1 successful\e[0m, \e[31m1 failures\e[0m, \e[37m1 skipped\e[0m
"
  end

  it 'executes only specified controls' do
    out = inspec('exec ' + example_profile + ' --controls tmp-1.0')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include "\nSummary: \e[32m1 successful\e[0m, \e[31m0 failures\e[0m, \e[37m0 skipped\e[0m\n"
  end

  it 'can execute a simple file with the default formatter' do
    out = inspec('exec ' + example_control)
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include "\nSummary: \e[32m2 successful\e[0m, \e[31m0 failures\e[0m, \e[37m0 skipped\e[0m\n"
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

  describe 'given a profile with controls and anonymous describe blocks' do
    let(:out) { inspec('exec ' + example_control) }

    it 'prints the control results, then the anonymous describe block results' do
      out.stdout.force_encoding(Encoding::UTF_8).must_equal "
Target:  local://

\e[32m  \xE2\x9C\x94  tmp-1.0: Create /tmp directory\e[0m
\e[32m     \xE2\x9C\x94  File /tmp should be directory\e[0m

  File /tmp
\e[32m     \xE2\x9C\x94  should be directory\e[0m

Summary: \e[32m2 successful\e[0m, \e[31m0 failures\e[0m, \e[37m0 skipped\e[0m
"
    end
  end

  describe 'given a profile with an anonymous describe block' do
    let(:out) { inspec('exec ' + failure_control) }

    it 'prints the exception message when a test has a syntax error' do
      out.stdout.must_include "undefined method `should_nota' "
    end
  end

  describe 'given an inherited profile that has more that one test per control block' do
    let(:out) { inspec('exec ' + simple_inheritance) }

    it 'should print all the results' do
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✖  tmp-1.0: Create /tmp directory (1 failed)\e[0m"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✖  should not be directory\e[0m"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✖  undefined method `should_nota'"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✖  expected `File /tmp.directory?` to return false, got true\e[0m"
    end
  end

  describe 'when passing in two profiles given an inherited profile that has more that one test per control block' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'dependencies', 'profile_d') + ' ' + simple_inheritance) }

    it 'should print all the results' do
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✖  tmp-1.0: Create /tmp directory (1 failed)\e[0m"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✖  should not be directory\e[0m"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✖  undefined method `should_nota'"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✖  expected `File /tmp.directory?` to return false, got true\e[0m"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✔  profiled-1: Create /tmp directory (profile d)"
    end
  end
end
