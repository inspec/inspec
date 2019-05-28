require 'functional/helper'

describe 'inspec exec' do
  include FunctionalHelper
  let(:looks_like_a_stacktrace) { %r{lib/inspec/.+\.rb:\d+:in} }

  it 'can execute the profile' do
    out = inspec('exec ' + example_profile  + ' --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 101
    stdout = out.stdout.force_encoding(Encoding::UTF_8)
    stdout.must_include "\e[38;5;41m  ✔  tmp-1.0: Create /tmp directory\e[0m\n"
    stdout.must_include "
\e[38;5;247m  ↺  gordon-1.0: Verify the version number of Gordon (1 skipped)\e[0m
\e[38;5;247m     ↺  Can't find file `/tmp/gordon/config.yaml`\e[0m
"
    if is_windows?
      stdout.must_include "\e[38;5;247m  ↺  ssh-1: Allow only SSH Protocol 2\e[0m\n"
      stdout.must_include "\nProfile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, \e[38;5;247m2 controls skipped\e[0m\n"
      stdout.must_include "\nTest Summary: \e[38;5;41m3 successful\e[0m, 0 failures, \e[38;5;247m2 skipped\e[0m\n"
    else
      stdout.must_include "\e[38;5;41m  ✔  ssh-1: Allow only SSH Protocol 2\e[0m\n"
      stdout.must_include "\nProfile Summary: \e[38;5;41m2 successful controls\e[0m, 0 control failures, \e[38;5;247m1 control skipped\e[0m\n"
      stdout.must_include "\nTest Summary: \e[38;5;41m4 successful\e[0m, 0 failures, \e[38;5;247m1 skipped\e[0m\n"
    end
  end

  it 'executes a minimum metadata-only profile' do
    out = inspec('exec ' + File.join(profile_path, 'simple-metadata') + ' --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_equal "
Profile: yumyum profile
Version: (not specified)
Target:  local://

     No tests executed.

Test Summary: 0 successful, 0 failures, 0 skipped
"
  end

  it 'can execute the profile and write to directory' do
    outpath = Dir.tmpdir
    out = inspec("exec #{example_profile} --no-create-lockfile --reporter json:#{outpath}/foo/bar/test.json")
    out.stderr.must_equal ''
    out.exit_status.must_equal 101
    File.exist?("#{outpath}/foo/bar/test.json").must_equal true
    File.stat("#{outpath}/foo/bar/test.json").size.must_be :>, 0
  end

  it 'can execute --help after exec command' do
    out = inspec("exec --help")
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include "Usage:\n  inspec exec LOCATIONS"
  end

  it 'can execute help after exec command' do
    out = inspec("exec help")
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include "Usage:\n  inspec exec LOCATIONS"
  end

  it 'can execute help before exec command' do
    out = inspec("help exec")
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include "Usage:\n  inspec exec LOCATIONS"
  end

  it 'can execute the profile with a target_id passthrough' do
    out = inspec("exec #{example_profile} --no-create-lockfile --target-id 1d3e399f-4d71-4863-ac54-84d437fbc444")
    out.stderr.must_equal ''
    out.exit_status.must_equal 101
    stdout = out.stdout.force_encoding(Encoding::UTF_8)
    stdout.must_include "Target ID: 1d3e399f-4d71-4863-ac54-84d437fbc444"
  end

  it 'executes a metadata-only profile' do
    out = inspec('exec ' + File.join(profile_path, 'complete-metadata') + ' --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_equal "
Profile: title (name)
Version: 1.2.3
Target:  local://

     No tests executed.

Test Summary: 0 successful, 0 failures, 0 skipped
"
  end

  it "executes a profile and reads inputs" do
    out = inspec("exec #{File.join(examples_path, 'profile-attribute')} --no-create-lockfile --input-file #{File.join(examples_path, "profile-attribute.yml")}")
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.force_encoding(Encoding::UTF_8).must_include "Test Summary: \e[38;5;41m2 successful\e[0m, 0 failures, 0 skipped"
  end

  it 'executes a specs-only profile' do
    out = inspec('exec ' + File.join(profile_path, 'spec_only') + ' --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 100
    out.stdout.force_encoding(Encoding::UTF_8).must_include "Target:  local://"
    out.stdout.force_encoding(Encoding::UTF_8).must_include "working"
    out.stdout.force_encoding(Encoding::UTF_8).must_include "✔  should eq \"working\""
    out.stdout.force_encoding(Encoding::UTF_8).must_include "skippy\n"
    out.stdout.force_encoding(Encoding::UTF_8).must_include "↺  This will be skipped intentionally"
    out.stdout.force_encoding(Encoding::UTF_8).must_include "failing"
    out.stdout.force_encoding(Encoding::UTF_8).must_include "×  should eq \"as intended\""
    out.stdout.force_encoding(Encoding::UTF_8).must_include "Test Summary: \e[38;5;41m1 successful\e[0m, \e[38;5;9m1 failure\e[0m, \e[38;5;247m1 skipped\e[0m\n"
  end

  it 'executes only specified controls when selecting passing controls by literal names' do
    out = inspec('exec ' + File.join(profile_path, 'filter_table') + ' --no-create-lockfile --controls 2943_pass_undeclared_field_in_hash 2943_pass_irregular_row_key')
    out.exit_status.must_equal 0
    out.stdout.force_encoding(Encoding::UTF_8).must_include "\nProfile Summary: \e[38;5;41m2 successful controls\e[0m, 0 control failures, 0 controls skipped\n"
  end

  it 'executes only specified controls when selecting failing controls by literal names' do
    out = inspec('exec ' + File.join(profile_path, 'filter_table') + ' --no-create-lockfile --controls 2943_fail_derail_check')
    out.exit_status.must_equal 100
    out.stdout.force_encoding(Encoding::UTF_8).must_include "\nProfile Summary: 0 successful controls, \e[38;5;9m1 control failure\e[0m, 0 controls skipped"
  end

  it 'executes only specified controls when selecting passing controls by regex' do
    out = inspec('exec ' + File.join(profile_path, 'filter_table') + ' --no-create-lockfile --controls \'/^2943_pass/\'')
    out.exit_status.must_equal 0
    out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: \e[38;5;41m6 successful controls\e[0m, 0 control failures, 0 controls skipped"
  end

  it 'executes only specified controls when selecting failing controls by regex' do
    out = inspec('exec ' + File.join(profile_path, 'filter_table') + ' --no-create-lockfile --controls \'/^2943_fail/\'')
    out.exit_status.must_equal 100
    out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: 0 successful controls, \e[38;5;9m1 control failure\e[0m, 0 controls skipped"
  end


  it 'can execute a simple file with the default formatter' do
    out = inspec('exec ' + example_control  + ' --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include "\nProfile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, 0 controls skipped\n"
    out.stdout.must_include "\nTest Summary: \e[38;5;41m2 successful\e[0m, 0 failures, 0 skipped\n"
  end

  it 'does not vendor profiles when using the a local path dependecy' do
    Dir.mktmpdir do |tmpdir|
      command = 'exec ' + inheritance_profile + ' --no-create-lockfile'
      out = inspec_with_env(command, INSPEC_CONFIG_DIR: tmpdir)
      out.stderr.must_equal ''
      out.exit_status.must_equal 100
      if is_windows?
        out.stdout.must_include "Profile Summary: 0 successful controls, 0 control failures, \e[38;5;247m2 controls skipped\e[0m\n"
        out.stdout.must_include "Test Summary: \e[38;5;41m2 successful\e[0m, \e[38;5;9m1 failure\e[0m, \e[38;5;247m3 skipped\e[0m\n"
      else
        out.stdout.must_include "Profile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, \e[38;5;247m1 control skipped\e[0m\n"
        out.stdout.must_include "Test Summary: \e[38;5;41m3 successful\e[0m, \e[38;5;9m1 failure\e[0m, \e[38;5;247m2 skipped\e[0m\n"
      end
      cache_dir = File.join(tmpdir, 'cache')
      Dir.exist?(cache_dir).must_equal true
      Dir.glob(File.join(cache_dir, '**', '*')).must_be_empty
    end
  end

  describe 'with a profile that is not supported on this OS/platform' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'skippy-profile-os') + ' --no-create-lockfile') }
    let(:json) { JSON.load(out.stdout) }

    it 'exits with skip message' do
      out.stdout.must_include("Skipping profile: 'skippy' on unsupported platform:")
      out.exit_status.must_equal 101
    end
  end

  describe 'with a profile that contains skipped controls' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'skippy-controls') + ' --no-create-lockfile') }
    let(:json) { JSON.load(out.stdout) }

    it 'exits with an error' do
      out.stdout.force_encoding(Encoding::UTF_8).must_include "skippy\e[0m\n\e[38;5;247m     ↺  This will be skipped super intentionally.\e[0m\n"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "  ↺  CONTROL database: MySQL Session\e[0m\n\e[38;5;247m     ↺  Can't run MySQL SQL checks without authentication\e[0m\n"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: 0 successful controls, 0 control failures, \e[38;5;247m2 controls skipped\e[0m\nTest Summary: 0 successful, 0 failures, \e[38;5;247m2 skipped\e[0m\n"
      out.exit_status.must_equal 101
    end
  end

  describe 'with a profile that contains skipped controls and the --no-distinct-exit flag' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'skippy-controls') + ' --no-distinct-exit --no-create-lockfile') }

    it 'exits with code 0 and skipped tests in output' do
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: 0 successful controls, 0 control failures, \e[38;5;247m2 controls skipped\e[0m\nTest Summary: 0 successful, 0 failures, \e[38;5;247m2 skipped\e[0m\n"
    end
  end

  describe 'with a profile that contains failing controls and the --no-distinct-exit flag' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'failures') + ' --no-distinct-exit --no-create-lockfile') }

    it 'exits with code 1' do
      out.stderr.must_equal ''
      out.exit_status.must_equal 1
      out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: 0 successful controls, \e[38;5;9m2 control failures\e[0m, 0 controls skipped"
    end
  end

  describe 'with a profile that contains skipped resources' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'aws-profile')) }
    let(:stdout) { out.stdout.force_encoding(Encoding::UTF_8) }
    it 'exits with an error' do
      stdout.must_include 'Resource `aws_iam_users` is not supported on platform'
      stdout.must_include 'Resource `aws_iam_access_keys` is not supported on platform'
      stdout.must_include 'Resource `aws_s3_bucket` is not supported on platform'
      stdout.must_include '3 failures'
      out.exit_status.must_equal 100
    end
  end

  describe 'with a profile that is supported on this version of inspec' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'supported_inspec') + ' --no-create-lockfile') }

    it 'exits cleanly' do
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
    end
  end

  describe 'with a profile that is not supported on this version of inspec' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'unsupported_inspec') + ' --no-create-lockfile') }

    it 'does not support this profile' do
      out.exit_status.must_equal 1
      out.stderr.must_equal "This profile requires Chef InSpec version >= 99.0.0. You are running Chef InSpec v#{Inspec::VERSION}.\n"
    end
  end

  describe 'with a profile that loads a library and reference' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'library') + ' --no-create-lockfile') }

    it 'executes the profile without error' do
      out.exit_status.must_equal 0
    end
  end

  describe 'given a profile with controls and anonymous describe blocks' do
    let(:out) { inspec('exec ' + example_control + ' --no-create-lockfile') }

    it 'prints the control results, then the anonymous describe block results' do
      out.stdout.force_encoding(Encoding::UTF_8).must_match(%r{Profile: tests from .*test.unit.mock.profiles.old-examples.profile.controls.example.rb})
      out.stdout.force_encoding(Encoding::UTF_8).must_include "
Version: (not specified)
Target:  local://

\e[38;5;41m  \xE2\x9C\x94  tmp-1.0: Create /tmp directory\e[0m
\e[38;5;41m     \xE2\x9C\x94  File /tmp should be directory\e[0m

  File /tmp
\e[38;5;41m     \xE2\x9C\x94  should be directory\e[0m

Profile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, 0 controls skipped
Test Summary: \e[38;5;41m2 successful\e[0m, 0 failures, 0 skipped\n"
    end
  end

  describe 'given a profile with an anonymous describe block' do
    let(:out) { inspec('exec ' + failure_control + ' --no-create-lockfile') }

    it 'prints the exception message when a test has a syntax error' do
      out.stdout.must_include "undefined method `should_nota' "
    end
  end

  describe 'given an inherited profile that has more that one test per control block' do
    let(:out) { inspec('exec ' + simple_inheritance + ' --no-create-lockfile') }

    it 'should print all the results' do
      out.stdout.force_encoding(Encoding::UTF_8).must_include "×  tmp-1.0: Create /tmp directory (1 failed)\e[0m"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "×  should not be directory\n"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "×  undefined method `should_nota'"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "×  should not be directory\n     expected `File /tmp.directory?` to return false, got true\e[0m"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "×  7 should cmp >= 9\n"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "×  7 should not cmp == /^\\d$/\n"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✔  7 should cmp == \"7\""
      if is_windows?
        out.stdout.force_encoding(Encoding::UTF_8).must_include "  expected: \"01147\"\n          got: \"040755\"\n"
      else
        out.stdout.force_encoding(Encoding::UTF_8).must_include "  expected: \"01147\"\n          got: \"01777\"\n"
      end
    end
  end

  describe 'when passing in two profiles given an inherited profile that has more that one test per control block' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'dependencies', 'profile_d') + ' ' + simple_inheritance + ' --no-create-lockfile') }

    it 'should print all the results' do
      out.stdout.force_encoding(Encoding::UTF_8).must_include "×  tmp-1.0: Create /tmp directory (1 failed)\e[0m"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "×  cmp-1.0: Using the cmp matcher for numbers (2 failed)"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "×  undefined method `should_nota'"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "×  should not be directory\n     expected `File /tmp.directory?` to return false, got true\e[0m"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "✔  profiled-1: Create /tmp directory (profile d)"
    end
  end

  describe 'given an inherited profile' do
    let(:out) { inspec('exec ' + simple_inheritance) }

    it 'should print the profile information and then the test results' do
      out.stdout.force_encoding(Encoding::UTF_8).must_include "\e[38;5;9m  ×  tmp-1.0: Create /tmp directory (1 failed)\e[0m\n\e[38;5;41m     ✔  File /tmp should be directory\e[0m\n\e[38;5;9m     ×  File /tmp should not be directory\n"
    end
  end

  describe 'using namespaced resources' do
    it 'works' do
      out = inspec('exec ' + File.join(profile_path, 'dependencies', 'resource-namespace') + ' --no-create-lockfile')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, 0 controls skipped\n"
    end
  end

  describe 'with require_controls' do
    it 'does not run rules you did not include' do
      out = inspec('exec ' + File.join(profile_path, 'dependencies', 'require_controls_test') + ' --no-create-lockfile')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, 0 controls skipped\n"
    end
  end

  describe "with a 2-level dependency tree" do
    it 'correctly runs tests from the whole tree' do
      out = inspec('exec ' + File.join(profile_path, 'dependencies', 'inheritance') + ' --no-create-lockfile')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: \e[38;5;41m6 successful controls\e[0m, 0 control failures, 0 controls skipped\n"
    end
  end

  describe 'when using profiles on the supermarket' do
    it 'can run supermarket profiles directly from the command line' do
      out = inspec("exec supermarket://nathenharvey/tmp-compliance-profile --no-create-lockfile")
      if is_windows?
        out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: \e[38;5;41m1 successful control\e[0m, \e[38;5;9m1 control failure\e[0m, 0 controls skipped\n"
      else
        out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: \e[38;5;41m2 successful controls\e[0m, 0 control failures, 0 controls skipped\n"
      end
    end

    it 'can run supermarket profiles from inspec.yml' do
      out = inspec("exec #{File.join(profile_path, 'supermarket-dep')} --no-create-lockfile")
      if is_windows?
        out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: \e[38;5;41m1 successful control\e[0m, \e[38;5;9m1 control failure\e[0m, 0 controls skipped\n"
      else
        out.stdout.force_encoding(Encoding::UTF_8).must_include "Profile Summary: \e[38;5;41m2 successful controls\e[0m, 0 control failures, 0 controls skipped\n"
      end
    end
  end

  describe 'when a dependency does not support our backend platform' do
    it 'skips the controls from that profile' do
      out = inspec("exec #{File.join(profile_path, 'profile-support-skip')} --no-create-lockfile")
      out.stdout.force_encoding(Encoding::UTF_8).must_include "WARN: Skipping profile"
      out.stdout.force_encoding(Encoding::UTF_8).must_include "0 successful, 0 failures, 0 skipped\n"
    end
  end

  describe 'when trying to use --sudo with a local target' do
    it 'must print an error and exit' do
      out = inspec("exec #{File.join(profile_path, 'profile-support-skip')} --sudo")
      str = "Sudo is only valid when running against a remote host. To run this locally with elevated privileges, run the command with `sudo ...`.\n"
      out.stderr.force_encoding(Encoding::UTF_8).must_include str
      out.exit_status.must_equal 1
      # TODO: check for stacktrace
    end
  end

  describe 'when --no-color is used' do
    it 'does not output color control characters' do
      out = inspec('exec ' + File.join(profile_path, 'simple-metadata') + ' --no-color')
      out.exit_status.must_equal 0
      out.stdout.wont_include "\e[38"
    end
  end

  describe 'when --password is used' do
    it 'raises an exception if no password is provided' do
      out = inspec('exec ' + example_profile + ' --password')
      out.exit_status.must_equal 1
      out.stderr.must_include 'Please provide a value for --password. For example: --password=hello.'
    end
  end

  describe 'when --sudo-password is used' do
    it 'raises an exception if no sudo password is provided' do
      out = inspec('exec ' + example_profile + ' --sudo-password')
      out.exit_status.must_equal 1
      out.stderr.must_include 'Please provide a value for --sudo-password. For example: --sudo-password=hello.'
    end
  end

  describe 'when --bastion-host and --proxy_command is used' do
    it 'raises an exception when both flags are provided' do
      out = inspec('exec ' + example_profile + ' -t ssh://dummy@dummy --password dummy --proxy_command dummy --bastion_host dummy')
      out.exit_status.must_equal 1
      out.stderr.must_include "Client error, can't connect to 'ssh' backend: Only one of proxy_command or bastion_host needs to be specified"
    end
  end

  describe 'when --winrm-transport is used' do
    it 'raises an exception when an invalid transport is given' do
      out = inspec('exec ' + example_profile + ' -t winrm://administrator@dummy --password dummy --winrm-transport nonesuch')
      out.exit_status.must_equal 1
      out.stderr.must_include "Client error, can't connect to 'winrm' backend: Unsupported transport type: :nonesuch\n"
    end
  end

  describe 'with sensitive resources' do
    it 'hides sensitive output' do
      out = inspec('exec ' + sensitive_profile  + ' --no-create-lockfile')
      out.stderr.must_equal ''
      out.exit_status.must_equal 100
      stdout = out.stdout.force_encoding(Encoding::UTF_8)
      stdout.must_include '×  should eq "billy"'
      stdout.must_include 'expected: "billy"'
      stdout.must_include 'got: "bob"'
      stdout.must_include '×  should eq "secret"'
      stdout.must_include '*** sensitive output suppressed ***'
      stdout.must_include "\nTest Summary: \e[38;5;41m2 successful\e[0m, \e[38;5;9m2 failures\e[0m, 0 skipped\n"
    end
  end

  describe 'with a profile that loads dependencies' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'profile-support-skip') + ' --no-create-lockfile --reporter json') }
    let(:json) { JSON.load(out.stdout) }
    let(:controls) { json['profiles'][0]['controls'] }

    it 'skips loaded inherited profiles on unsupported platforms' do
      json['profiles'][0]['depends'][0]['name'].must_equal 'unsupported_inspec'
      controls.must_be_empty
      stderr = out.stderr.force_encoding(Encoding::UTF_8)
      stderr.must_include "WARN: Skipping profile"
    end
  end

  describe 'with a profile containing exceptions in the controls' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'exception-in-control') + ' --no-create-lockfile --reporter json') }
    let(:json) { JSON.load(out.stdout) }
    let(:controls) { json['profiles'][0]['controls'] }

    it 'completes the run with failed controls but no exception' do
      out.stderr.must_be_empty
      out.exit_status.must_equal 100
      controls.count.must_equal 10
      controls.select { |c| c['results'][0]['status'] == 'failed' }.count.must_be :>, 1
      controls.select { |c| c['results'][0]['status'] == 'passed' }.count.must_be :>, 1
    end
  end

  describe 'with a profile containing control overrides' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'wrapper-override') + ' --no-create-lockfile --vendor-cache ' +  File.join(profile_path, 'wrapper-override', 'vendor') + ' --reporter json') }
    let(:json) { JSON.load(out.stdout) }
    let(:controls) { json['profiles'][0]['controls'] }
    let(:child_profile) { json['profiles'].select { |p| p['name'] == 'myprofile1' }.first }
    let(:child_control) { child_profile['controls'].select { |c| c['title'] == 'Profile 1 - Control 2-updated' }.first }
    let(:override) { controls.select { |c| c['title'] == 'Profile 1 - Control 2-updated' }.first }

    it 'completes the run with parent control overrides' do
      out.stderr.must_be_empty
      if is_windows?
        out.exit_status.must_equal 100
      else
        out.exit_status.must_equal 0
      end
      controls.count.must_equal 2

      # check for json override
      expected_value = "  control 'pro1-con2' do\n    impact 0.999\n    title 'Profile 1 - Control 2-updated'\n    desc 'Profile 1 - Control 2 description-updated'\n    desc 'overwrite me', 'it is overwritten'\n    desc 'new entry', 'this is appended to the description list'\n    tag 'password-updated'\n    ref 'Section 3.5.2.1', url: 'https://example.com'\n    describe file('/etc/passwd') do\n      it { should exist }\n    end\n  end\n"
      override['code'].must_equal expected_value
      override['impact'].must_equal 0.999
      override['descriptions'].must_equal([
        { 'label' => 'default',
          'data' => 'Profile 1 - Control 2 description-updated'
        },
        { 'label' => 'overwrite me',
          'data' => 'it is overwritten'
        },
        { 'label' => 'new entry',
          'data' => 'this is appended to the description list'
        },
      ])
      override['title'].must_equal "Profile 1 - Control 2-updated"
      tags_assert = {"password"=>nil, "password-updated"=>nil}
      override['tags'].must_equal tags_assert
      child_profile['parent_profile'].must_equal 'wrapper-override'

      # check for original code on child profile
      expected_value = "control 'pro1-con2' do\n  impact 0.9\n  title 'Profile 1 - Control 2'\n  desc 'Profile 1 - Control 2 description'\n  desc 'overwrite me', 'overwrite this'\n  tag 'password'\n  describe file('/etc/passwdddddddddd') do\n    it { should exist }\n  end\nend\n"
      child_control['code'].must_equal expected_value
    end
  end

  describe 'when using multiple custom resources with each other' do
    let(:out) { inspec('exec ' + File.join(examples_path, 'custom-resource') + ' --no-create-lockfile') }

    it 'completes the run with failed controls but no exception' do
      out.stderr.must_be_empty
      out.exit_status.must_equal 0
    end
  end

  describe 'when using a profile with non-UTF characters and wrong encoding' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'wrong-char-profile') + ' --no-create-lockfile') }

    it 'completes the run with failed controls but no exception' do
      out.stderr.must_be_empty
      out.exit_status.must_equal 0
    end
  end

  describe 'when targeting private GitHub profiles' do
    let(:private_profile) {
      URI.parse('https://github.com/chef/inspec-test-profile-private.git')
    }

    # This tests requires that a private SSH key be provided for a user that has
    # access to the private profile repo
    if ENV['INSPEC_TEST_SSH_KEY_PATH']
      it 'can use SSH + Git' do
        target = 'git@' + private_profile.host + ':' + private_profile.path
        ssh_prefix = 'GIT_SSH_COMMAND="ssh -i ' +
                     ENV['INSPEC_TEST_SSH_KEY_PATH'] +
                     '"'
        inspec_command = 'exec ' + target + ' --reporter json-min'
        out = inspec(inspec_command, ssh_prefix)
        JSON.parse(out.stdout)['controls'][0]['status'].must_equal 'passed'
        out.exit_status.must_equal 0
      end
    end

    # This tests requires that a GitHub API token be provided for a user that
    # has access to the private profile repo
    if ENV['INSPEC_TEST_GITHUB_TOKEN']
      it 'can use HTTPS + token + Git' do
        private_profile.userinfo = ENV['INSPEC_TEST_GITHUB_TOKEN']
        inspec_command = 'exec ' + private_profile.to_s + ' --reporter json-min'
        out = inspec(inspec_command)
        JSON.parse(out.stdout)['controls'][0]['status'].must_equal 'passed'
        out.exit_status.must_equal 0
      end
    end
  end

  describe 'when specifying a config file' do
    let(:run_result) { run_inspec_process('exec ' + File.join(profile_path, 'simple-metadata') + ' ' + cli_args, json: true, env: env)}
    let(:seen_target_id) { run_result.payload.json['platform']['target_id'] }
    let(:stderr) { run_result.stderr }
    let(:env) { {} }

    describe 'when using the legacy --json-config option' do
      let(:cli_args) { '--json-config ' + File.join(config_dir_path, 'json-config', 'good.json') }
      it 'should see the custom target ID value' do
        stderr.must_be_empty # TODO: one day deprecate the --json-config option
        seen_target_id.must_equal 'from-config-file'
      end
    end

    describe 'when using the --config option to read from a custom file' do
      let(:cli_args) { '--config ' + File.join(config_dir_path, 'json-config', 'good.json') }
      it 'should see the custom target ID value' do
        stderr.must_be_empty
        seen_target_id.must_equal 'from-config-file'
      end
    end

    unless windows?
      describe 'when using the --config option to read from STDIN' do
        let(:json_path) { File.join(config_dir_path, 'json-config', 'good.json') }
        let(:cli_args) { '--config -' }
        let(:opts) { { prefix: 'cat ' + json_path + ' | ', json: true, env: env } }

        # DO NOT use the `let`-defined run_result through here
        # If you do, it will execute twice, and cause STDIN to read empty on the second time
        it 'exec should see the custom target ID value' do
          result = run_inspec_process( 'exec ' + File.join(profile_path, 'simple-metadata') + ' ' + cli_args + ' ', opts )
          result.stderr.must_be_empty
          result.payload.json['platform']['target_id'].must_equal 'from-config-file'
        end

        it 'detect should exit 0' do
          result = run_inspec_process( 'detect ' + cli_args + ' ', opts )
          result.stderr.must_be_empty
          result.exit_status.must_equal 0
        end

        it 'shell should exit 0' do
          result = run_inspec_process( 'shell -c "platform.family" ' + cli_args + ' ', opts )
          result.stderr.must_be_empty
          result.exit_status.must_equal 0
        end
      end
    end

    describe 'when reading from the default location' do
      # Should read from File.join(config_dir_path, 'fakehome-2', '.inspec', 'config.json')
      let(:env) { { 'HOME' => File.join(config_dir_path, 'fakehome-2') } }
      let(:cli_args) { '' }
      it 'should see the homedir target ID value' do
        stderr.must_be_empty
        seen_target_id.must_equal 'from-fakehome-config-file'
      end
    end

    describe 'when --config points to a nonexistant location' do
      let(:cli_args) { '--config ' + 'no/such/path' }
      it 'should issue an error with the file path' do
        stderr.wont_match looks_like_a_stacktrace
        run_result.exit_status.must_equal 1
        stderr.must_include 'Could not read configuration file' # Should specify error
        stderr.must_include 'no/such/path' # Should include error value seen
      end
    end

    describe 'when --config points to a malformed file' do
      let(:cli_args) { '--config ' + File.join(config_dir_path, 'json-config', 'malformed.json') }
      it 'should issue an error with the parse message' do
        stderr.wont_match looks_like_a_stacktrace
        run_result.exit_status.must_equal 1
        stderr.must_include 'Failed to load JSON'
        stderr.must_include 'Config was:'
      end
    end

    describe 'when --config points to an invalid file' do
      let(:cli_args) { '--config ' + File.join(config_dir_path, 'json-config', 'invalid.json') }
      it 'should issue an error with the parse message' do
        stderr.wont_match looks_like_a_stacktrace
        run_result.exit_status.must_equal 1
        stderr.must_include 'Unrecognized top-level configuration'
        stderr.must_include 'this_key_is_invalid'
      end
    end
  end

  describe 'when specifying the execution target' do
    let(:local_plat) do
      json = run_inspec_process('detect --format json', {}).stdout
      # .slice is available in ruby 2.5+
      JSON.parse(json).select{|k,v| ['name', 'release'].include? k }
    end
    let(:run_result) { run_inspec_process('exec ' + File.join(profile_path, 'simple-metadata') + ' ' + cli_args, json: true) }
    let(:seen_platform) { run_result.payload.json['platform'].select{|k,v| ['name', 'release', 'target_id'].include? k } }
    let(:stderr) { run_result.stderr }

    describe 'when neither target nor backend is specified' do
      let(:cli_args) { '' }
      it 'should connect to the local platform' do
        seen_platform.must_equal local_plat
      end
    end

    describe 'when local:// is specified' do
      let(:cli_args) { ' -t local:// ' }
      it 'should connect to the local platform' do
        seen_platform.must_equal local_plat
      end
    end

    describe 'when an unrecognized backend is specified' do
      let(:cli_args) { '-b garble ' }
      it 'should exit with an error' do
        run_result.exit_status.must_equal 1
        stderr.wont_match looks_like_a_stacktrace
        # "Can't find train plugin garble. Please install it first"
        stderr.must_include 'Can\'t find train plugin'
        stderr.must_include 'garble'
      end
    end

    describe 'when an unrecognized target schema is specified' do
      let(:cli_args) { '-t garble:// ' }
      it 'should exit with an error' do
        run_result.exit_status.must_equal 1
        stderr.wont_match looks_like_a_stacktrace
        # "Can't find train plugin garble. Please install it first"
        stderr.must_include 'Can\'t find train plugin'
        stderr.must_include 'garble'
      end
    end

    describe 'when a schemaless URI is specified' do
      let(:cli_args) { '-t garble ' }
      it 'should exit with an error' do
        run_result.exit_status.must_equal 1
        stderr.wont_match looks_like_a_stacktrace
        # "Could not recognize a backend from the target garble - use a URI
        # format with the backend name as the URI schema.  Example: 'ssh://somehost.com'
        # or 'transport://credset' or 'transport://' if credentials are provided
        #  outside of InSpec."
        stderr.must_include 'Could not recognize a backend'
        stderr.must_include 'garble'
        stderr.must_include 'ssh://somehost.com'
        stderr.must_include 'transport://credset'
      end
    end

    describe 'when a target URI with a known credset is used' do
      let(:cli_args) { '--target mock://mycredset' + ' --config ' + File.join(config_dir_path, 'json-config', 'mock-credset.json') }
      it 'should connect to the mock platform' do
        seen_platform.must_equal({"name" => "mock","release" => "unknown","target_id" => "from-mock-credset-config-file"})
      end
    end
  end
end
