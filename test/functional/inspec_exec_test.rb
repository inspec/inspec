require "functional/helper"

describe "inspec exec" do
  parallelize_me!

  include FunctionalHelper
  let(:looks_like_a_stacktrace) { %r{lib/inspec/.+\.rb:\d+:in} }

  attr_accessor :out

  def inspec(commandline, prefix = nil)
    @stdout = @stderr = nil
    self.out = super
  end

  def stdout
    @stdout ||= out.stdout.force_encoding(Encoding::UTF_8)
  end

  def stderr
    @stderr ||= out.stderr.force_encoding(Encoding::UTF_8)
  end

  before do
    skip_windows!
  end

  it "cleanly fails if mixing incompatible resource and transports" do
    # TODO: I do not know how to test this more directly. It should be possible.
    inspec "exec -t aws:// #{profile_path}/incompatible_resource_for_transport.rb"

    _(stdout).must_be_empty
    _(stderr).must_include "Unsupported resource/backend combination: file / aws. Exiting."
  end

  it "can execute the profile" do
    inspec("exec " + example_profile + " --no-create-lockfile")

    _(stdout).must_include "\e[38;5;41m  ✔  tmp-1.0: Create /tmp directory\e[0m\n"
    _(stdout).must_include "
\e[38;5;247m  ↺  example-1.0: Verify the version number of Example (1 skipped)\e[0m
\e[38;5;247m     ↺  Can't find file `/tmp/example/config.yaml`\e[0m
"
    if is_windows?
      _(stdout).must_include "\e[38;5;247m  ↺  ssh-1: Allow only SSH Protocol 2\e[0m\n"
      _(stdout).must_include "\nProfile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, \e[38;5;247m2 controls skipped\e[0m\n"
      _(stdout).must_include "\nTest Summary: \e[38;5;41m3 successful\e[0m, 0 failures, \e[38;5;247m2 skipped\e[0m\n"
    else
      _(stdout).must_include "\e[38;5;41m  ✔  ssh-1: Allow only SSH Protocol 2\e[0m\n"
      _(stdout).must_include "\nProfile Summary: \e[38;5;41m2 successful controls\e[0m, 0 control failures, \e[38;5;247m1 control skipped\e[0m\n"
      _(stdout).must_include "\nTest Summary: \e[38;5;41m4 successful\e[0m, 0 failures, \e[38;5;247m1 skipped\e[0m\n"
    end

    _(stderr).must_equal ""

    assert_exit_code 101, out
  end

  it "executes a minimum metadata-only profile" do
    inspec("exec " + File.join(profile_path, "simple-metadata") + " --no-create-lockfile")

    _(stdout).must_equal "
Profile: yumyum profile
Version: (not specified)
Target:  local://

     No tests executed.

Test Summary: 0 successful, 0 failures, 0 skipped
"
    _(stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "can execute the profile and write to directory" do
    outpath = Dir.tmpdir
    inspec("exec #{example_profile} --no-create-lockfile --reporter json:#{outpath}/foo/bar/test.json")

    _(File.exist?("#{outpath}/foo/bar/test.json")).must_equal true
    _(File.stat("#{outpath}/foo/bar/test.json").size).must_be :>, 0

    _(stderr).must_equal ""

    assert_exit_code 101, out
  end

  it "can execute --help after exec command" do
    inspec("exec --help")

    _(stdout).must_include "Usage:\n  inspec exec LOCATIONS"

    _(stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "can execute help after exec command" do
    inspec("exec help")

    _(stdout).must_include "Usage:\n  inspec exec LOCATIONS"

    _(stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "can execute help before exec command" do
    inspec("help exec")

    _(stdout).must_include "Usage:\n  inspec exec LOCATIONS"

    _(stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "can execute the profile with a target_id passthrough" do
    inspec("exec #{example_profile} --no-create-lockfile --target-id 1d3e399f-4d71-4863-ac54-84d437fbc444")

    _(stdout).must_include "Target ID: 1d3e399f-4d71-4863-ac54-84d437fbc444"

    _(stderr).must_equal ""

    assert_exit_code 101, out
  end

  it "executes a metadata-only profile" do
    inspec("exec " + File.join(profile_path, "complete-metadata") + " --no-create-lockfile")

    _(stdout).must_equal "
Profile: title (name)
Version: 1.2.3
Target:  local://

     No tests executed.

Test Summary: 0 successful, 0 failures, 0 skipped
"

    _(stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "executes a profile and reads inputs" do
    inspec("exec #{File.join(examples_path, "profile-attribute")} --no-create-lockfile --input-file #{File.join(examples_path, "profile-attribute.yml")}")

    _(stdout).must_include "Test Summary: \e[38;5;41m2 successful\e[0m, 0 failures, 0 skipped"

    _(stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "executes a specs-only profile" do
    inspec("exec " + File.join(profile_path, "spec_only") + " --no-create-lockfile")

    _(stdout).must_include "Target:  local://"
    _(stdout).must_include "working"
    _(stdout).must_include "✔  should eq \"working\""
    _(stdout).must_include "skippy\n"
    _(stdout).must_include "↺  This will be skipped intentionally"
    _(stdout).must_include "failing"
    _(stdout).must_include "×  should eq \"as intended\""
    _(stdout).must_include "Test Summary: \e[38;5;41m1 successful\e[0m, \e[38;5;9m1 failure\e[0m, \e[38;5;247m1 skipped\e[0m\n"

    _(stderr).must_equal ""

    assert_exit_code 100, out
  end

  it "executes only specified controls when selecting passing controls by literal names" do
    inspec("exec " + File.join(profile_path, "filter_table") + " --no-create-lockfile --controls 2943_pass_undeclared_field_in_hash 2943_pass_irregular_row_key")

    _(stdout).must_include "\nProfile Summary: \e[38;5;41m2 successful controls\e[0m, 0 control failures, 0 controls skipped\n"

    _(stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "executes only specified controls when selecting failing controls by literal names" do
    inspec("exec " + File.join(profile_path, "filter_table") + " --no-create-lockfile --controls 2943_fail_derail_check")

    _(stdout).must_include "\nProfile Summary: 0 successful controls, \e[38;5;9m1 control failure\e[0m, 0 controls skipped"

    _(stderr).must_equal ""

    assert_exit_code 100, out
  end

  it "executes only specified controls when selecting passing controls by regex" do
    inspec("exec " + File.join(profile_path, "filter_table") + " --no-create-lockfile --controls '/^2943_pass/'")

    _(stdout).must_include "Profile Summary: \e[38;5;41m6 successful controls\e[0m, 0 control failures, 0 controls skipped"

    assert_exit_code 0, out
  end

  it "executes only specified controls when selecting failing controls by regex" do
    inspec("exec " + File.join(profile_path, "filter_table") + " --no-create-lockfile --controls '/^2943_fail/'")

    _(stdout).must_include "Profile Summary: 0 successful controls, \e[38;5;9m1 control failure\e[0m, 0 controls skipped"

    _(stderr).must_equal ""

    assert_exit_code 100, out
  end

  it "can execute a simple file with the default formatter" do
    inspec("exec " + example_control + " --no-create-lockfile")

    _(stdout).must_include "\nProfile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, 0 controls skipped\n"
    _(stdout).must_include "\nTest Summary: \e[38;5;41m2 successful\e[0m, 0 failures, 0 skipped\n"

    _(stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "does not vendor profiles when using the a local path dependecy" do
    Dir.mktmpdir do |tmpdir|
      command = "exec " + inheritance_profile + " --no-create-lockfile"
      inspec_with_env(command, INSPEC_CONFIG_DIR: tmpdir)

      if is_windows?
        _(stdout).must_include "Profile Summary: 0 successful controls, 0 control failures, \e[38;5;247m2 controls skipped\e[0m\n"
        _(stdout).must_include "Test Summary: \e[38;5;41m2 successful\e[0m, \e[38;5;9m1 failure\e[0m, \e[38;5;247m3 skipped\e[0m\n"
      else
        _(stdout).must_include "Profile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, \e[38;5;247m1 control skipped\e[0m\n"
        _(stdout).must_include "Test Summary: \e[38;5;41m3 successful\e[0m, \e[38;5;9m1 failure\e[0m, \e[38;5;247m2 skipped\e[0m\n"
      end
      _(out.exit_status).must_equal 100
      cache_dir = File.join(tmpdir, "cache")
      _(Dir.exist?(cache_dir)).must_equal true
      _(Dir.glob(File.join(cache_dir, "**", "*"))).must_be_empty

      _(stderr).must_equal ""

      assert_exit_code 100, out
    end
  end

  describe "with a profile that is not supported on this OS/platform" do
    let(:out) { inspec("exec " + File.join(profile_path, "skippy-profile-os") + " --no-create-lockfile") }
    let(:json) { JSON.load(stdout) }

    it "exits with skip message" do
      _(stdout).must_include("Skipping profile: 'skippy' on unsupported platform:")

      _(stderr).must_equal ""

      assert_exit_code 101, out
    end
  end

  describe "with a profile that contains skipped controls" do
    let(:out) { inspec("exec " + File.join(profile_path, "skippy-controls") + " --no-create-lockfile") }
    let(:json) { JSON.load(stdout) }

    it "exits with an error" do
      _(stdout).must_include "skippy\e[0m\n\e[38;5;247m     ↺  This will be skipped super intentionally.\e[0m\n"
      _(stdout).must_include "  ↺  CONTROL database: MySQL Session\e[0m\n\e[38;5;247m     ↺  Can't run MySQL SQL checks without authentication\e[0m\n"
      _(stdout).must_include "Profile Summary: 0 successful controls, 0 control failures, \e[38;5;247m2 controls skipped\e[0m\nTest Summary: 0 successful, 0 failures, \e[38;5;247m2 skipped\e[0m\n"

      _(stderr).must_equal ""

      assert_exit_code 101, out
    end
  end

  describe "with a profile that contains skipped controls and the --no-distinct-exit flag" do
    let(:out) { inspec("exec " + File.join(profile_path, "skippy-controls") + " --no-distinct-exit --no-create-lockfile") }

    it "exits with code 0 and skipped tests in output" do
      _(stdout).must_include "Profile Summary: 0 successful controls, 0 control failures, \e[38;5;247m2 controls skipped\e[0m\nTest Summary: 0 successful, 0 failures, \e[38;5;247m2 skipped\e[0m\n"

      _(stderr).must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "with a profile that contains failing controls and the --no-distinct-exit flag" do
    let(:out) { inspec("exec " + File.join(profile_path, "failures") + " --no-distinct-exit --no-create-lockfile") }

    it "exits with code 1" do
      _(stdout).must_include "Profile Summary: 0 successful controls, \e[38;5;9m2 control failures\e[0m, 0 controls skipped"

      _(stderr).must_equal ""

      assert_exit_code 1, out
    end
  end

  describe "with a profile that contains skipped resources" do
    let(:out) { inspec("exec " + File.join(profile_path, "aws-profile")) }
    it "exits with an error" do
      skip if ENV["NO_AWS"]
      _(stdout).must_include "Unsupported resource/backend combination: aws_iam_users"
      _(stdout).must_include "Unsupported resource/backend combination: aws_iam_access_keys"
      _(stdout).must_include "Unsupported resource/backend combination: aws_s3_bucket"
      _(stdout).must_include "3 failures"

      assert_exit_code 100, out
    end
  end

  describe "with a profile that is supported on this version of inspec" do
    let(:out) { inspec("exec " + File.join(profile_path, "supported_inspec") + " --no-create-lockfile") }

    it "exits cleanly" do
      _(stderr).must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "with a profile that is not supported on this version of inspec" do
    let(:out) { inspec("exec " + File.join(profile_path, "unsupported_inspec") + " --no-create-lockfile") }

    it "does not support this profile" do
      _(stderr).must_equal "This profile requires Chef InSpec version >= 99.0.0. You are running Chef InSpec v#{Inspec::VERSION}.\n"

      assert_exit_code 1, out
    end
  end

  describe "with a profile that loads a library and reference" do
    let(:out) { inspec("exec " + File.join(profile_path, "library") + " --no-create-lockfile") }

    it "executes the profile without error" do
      _(stderr).must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "given a profile with controls and anonymous describe blocks" do
    let(:out) { inspec("exec " + example_control + " --no-create-lockfile") }

    it "prints the control results, then the anonymous describe block results" do
      _(stdout).must_match(/Profile: tests from .*test.unit.mock.profiles.old-examples.profile.controls.example.rb/)
      _(stdout).must_include "
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

  describe "given a profile with an anonymous describe block" do
    let(:out) { inspec("exec " + failure_control + " --no-create-lockfile") }

    it "prints the exception message when a test has a syntax error" do
      _(stdout).must_include "undefined method `should_nota' "
    end
  end

  describe "given an inherited profile that has more that one test per control block" do
    let(:out) { inspec("exec " + simple_inheritance + " --no-create-lockfile") }

    it "should print all the results" do
      skip_windows!
      _(stdout).must_include "×  tmp-1.0: Create /tmp directory (1 failed)\e[0m"
      _(stdout).must_include "×  should not be directory\n"
      _(stdout).must_include "×  undefined method `should_nota'"
      _(stdout).must_include "×  should not be directory\n     expected `File /tmp.directory?` to return false, got true\e[0m"
      _(stdout).must_include "×  7 should cmp >= 9\n"
      _(stdout).must_include "×  7 should not cmp == /^\\d$/\n"
      _(stdout).must_include "✔  7 should cmp == \"7\""
      if is_windows?
        _(stdout).must_include "  expected: \"01147\"\n          got: \"040755\"\n"
      else
        _(stdout).must_include "  expected: \"01147\"\n          got: \"01777\"\n"
      end
    end
  end

  describe "when passing in two profiles given an inherited profile that has more that one test per control block" do
    let(:out) { inspec("exec " + File.join(profile_path, "dependencies", "profile_d") + " " + simple_inheritance + " --no-create-lockfile") }

    it "should print all the results" do
      skip_windows!
      _(stdout).must_include "×  tmp-1.0: Create /tmp directory (1 failed)\e[0m"
      _(stdout).must_include "×  cmp-1.0: Using the cmp matcher for numbers (2 failed)"
      _(stdout).must_include "×  undefined method `should_nota'"
      _(stdout).must_include "×  should not be directory\n     expected `File /tmp.directory?` to return false, got true\e[0m"
      _(stdout).must_include "✔  profiled-1: Create /tmp directory (profile d)"
    end
  end

  describe "given an inherited profile" do
    let(:out) { inspec("exec " + simple_inheritance) }

    it "should print the profile information and then the test results" do
      skip_windows!
      _(stdout).must_include "\e[38;5;9m  ×  tmp-1.0: Create /tmp directory (1 failed)\e[0m\n\e[38;5;41m     ✔  File /tmp should be directory\e[0m\n\e[38;5;9m     ×  File /tmp should not be directory\n"
    end
  end

  describe "using namespaced resources" do
    it "works" do
      inspec("exec " + File.join(profile_path, "dependencies", "resource-namespace") + " --no-create-lockfile")

      _(stdout).must_include "Profile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, 0 controls skipped\n"

      _(stderr).must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "with require_controls" do
    it "does not run rules you did not include" do
      inspec("exec " + File.join(profile_path, "dependencies", "require_controls_test") + " --no-create-lockfile")

      _(stdout).must_include "Profile Summary: \e[38;5;41m1 successful control\e[0m, 0 control failures, 0 controls skipped\n"

      _(stderr).must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "with a 2-level dependency tree" do
    it "correctly runs tests from the whole tree" do
      inspec("exec " + File.join(profile_path, "dependencies", "inheritance") + " --no-create-lockfile")

      _(stdout).must_include "Profile Summary: \e[38;5;41m6 successful controls\e[0m, 0 control failures, 0 controls skipped\n"

      _(stderr).must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "when using profiles on the supermarket" do
    it "can run supermarket profiles directly from the command line" do
      inspec("exec supermarket://nathenharvey/tmp-compliance-profile --no-create-lockfile")

      if is_windows?
        _(stdout).must_include "Profile Summary: \e[38;5;41m1 successful control\e[0m, \e[38;5;9m1 control failure\e[0m, 0 controls skipped\n"
      else
        _(stdout).must_include "Profile Summary: \e[38;5;41m2 successful controls\e[0m, 0 control failures, 0 controls skipped\n"
      end

      _(stderr).must_equal ""

      skip_windows!
      assert_exit_code 0, out
    end

    it "can run supermarket profiles from inspec.yml" do
      inspec("exec #{File.join(profile_path, "supermarket-dep")} --no-create-lockfile")
      if is_windows?
        _(stdout).must_include "Profile Summary: \e[38;5;41m1 successful control\e[0m, \e[38;5;9m1 control failure\e[0m, 0 controls skipped\n"
      else
        _(stdout).must_include "Profile Summary: \e[38;5;41m2 successful controls\e[0m, 0 control failures, 0 controls skipped\n"
      end

      _(stderr).must_equal ""

      skip_windows!
      assert_exit_code 0, out
    end
  end

  describe "when a dependency does not support our backend platform" do
    it "skips the controls from that profile" do
      inspec("exec #{File.join(profile_path, "profile-support-skip")} --no-create-lockfile")

      _(stdout).must_include "WARN: Skipping profile"
      _(stdout).must_include "0 successful, 0 failures, 0 skipped\n"

      _(stderr).must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "when trying to use --sudo with a local target" do
    it "must print an error and exit" do
      inspec("exec #{File.join(profile_path, "profile-support-skip")} --sudo")
      str = "Sudo is only valid when running against a remote host. To run this locally with elevated privileges, run the command with `sudo ...`.\n"

      _(stderr).must_include str

      assert_exit_code 1, out
      # TODO: check for stacktrace
    end
  end

  describe "when --no-color is used" do
    it "does not output color control characters" do
      inspec("exec " + File.join(profile_path, "simple-metadata") + " --no-color")

      _(stdout).wont_include "\e[38"

      _(stderr).must_equal ""

      assert_exit_code 0, out
    end
  end

  describe "when --password is used" do
    it "raises an exception if no password is provided" do
      inspec("exec " + example_profile + " --password")

      _(stderr).must_include "Please provide a value for --password. For example: --password=hello."

      assert_exit_code 1, out
    end
  end

  describe "when --sudo-password is used" do
    it "raises an exception if no sudo password is provided" do
      inspec("exec " + example_profile + " --sudo-password")

      _(stderr).must_include "Please provide a value for --sudo-password. For example: --sudo-password=hello."

      assert_exit_code 1, out
    end
  end

  describe "when --bastion-host and --proxy_command is used" do
    it "raises an exception when both flags are provided" do
      inspec("exec " + example_profile + " -t ssh://dummy@dummy --password dummy --proxy_command dummy --bastion_host dummy")

      _(stderr).must_include "Client error, can't connect to 'ssh' backend: Only one of proxy_command or bastion_host needs to be specified"

      assert_exit_code 1, out
    end
  end

  describe "when --winrm-transport is used" do
    it "raises an exception when an invalid transport is given" do
      inspec("exec " + example_profile + " -t winrm://administrator@dummy --password dummy --winrm-transport nonesuch")

      _(stderr).must_include "Client error, can't connect to 'winrm' backend: Unsupported transport type: :nonesuch\n"

      assert_exit_code 1, out
    end
  end

  describe "with sensitive resources" do
    it "hides sensitive output" do
      inspec("exec " + sensitive_profile + " --no-create-lockfile")

      _(stdout).must_include '×  should eq "billy"'
      _(stdout).must_include 'expected: "billy"'
      _(stdout).must_include 'got: "bob"'
      _(stdout).must_include '×  should eq "secret"'
      _(stdout).must_include "*** sensitive output suppressed ***"
      _(stdout).must_include "\nTest Summary: \e[38;5;41m2 successful\e[0m, \e[38;5;9m2 failures\e[0m, 0 skipped\n"

      _(stderr).must_equal ""

      assert_exit_code 100, out
    end
  end

  describe "with a profile that loads dependencies" do
    let(:out) { inspec("exec " + File.join(profile_path, "profile-support-skip") + " --no-create-lockfile --reporter json") }
    let(:json) { JSON.load(stdout) }
    let(:controls) { json["profiles"][0]["controls"] }

    it "skips loaded inherited profiles on unsupported platforms" do
      _(json["profiles"][0]["depends"][0]["name"]).must_equal "unsupported_inspec"
      _(controls).must_be_empty

      _(stderr).must_include "WARN: Skipping profile"
    end
  end

  describe "with a profile containing exceptions in the controls" do
    let(:out) { inspec("exec " + File.join(profile_path, "exception-in-control") + " --no-create-lockfile --reporter json") }
    let(:json) { JSON.load(stdout) }
    let(:controls) { json["profiles"][0]["controls"] }

    it "completes the run with failed controls but no exception" do
      _(stderr).must_be_empty

      _(controls.count).must_equal 10
      _(controls.select { |c| c["results"][0]["status"] == "failed" }.count).must_be :>, 1
      _(controls.select { |c| c["results"][0]["status"] == "passed" }.count).must_be :>, 1

      assert_exit_code 100, out
    end
  end

  describe "with a profile containing control overrides" do
    let(:out) { inspec("exec " + File.join(profile_path, "wrapper-override") + " --no-create-lockfile --vendor-cache " + File.join(profile_path, "wrapper-override", "vendor") + " --reporter json") }
    let(:json) { JSON.load(stdout) }
    let(:controls) { json["profiles"][0]["controls"] }
    let(:child_profile) { json["profiles"].select { |p| p["name"] == "myprofile1" }.first }
    let(:child_control) { child_profile["controls"].select { |c| c["title"] == "Profile 1 - Control 2-updated" }.first }
    let(:override) { controls.select { |c| c["title"] == "Profile 1 - Control 2-updated" }.first }

    it "completes the run with parent control overrides" do
      _(stderr).must_be_empty
      if is_windows?
        _(out.exit_status).must_equal 100
      else
        _(out.exit_status).must_equal 0
      end
      _(controls.count).must_equal 2

      # check for json override
      # TODO: Brittle test expects the leading spaces.
      expected_value = <<-END
  control 'pro1-con2' do
    impact 0.999
    title 'Profile 1 - Control 2-updated'
    desc 'Profile 1 - Control 2 description-updated'
    desc 'overwrite me', 'it is overwritten'
    desc 'new entry', 'this is appended to the description list'
    tag 'password-updated'
    ref 'Section 3.5.2.1', url: 'https://example.com'
    describe file('/etc/passwd') do
      it { should exist }
    end
  end
      END
      _(override["code"]).must_equal expected_value
      _(override["impact"]).must_equal 0.999
      _(override["descriptions"]).must_equal([
        { "label" => "default",
          "data" => "Profile 1 - Control 2 description-updated",
        },
        { "label" => "overwrite me",
          "data" => "it is overwritten",
        },
        { "label" => "new entry",
          "data" => "this is appended to the description list",
        },
      ])
      _(override["title"]).must_equal "Profile 1 - Control 2-updated"
      tags_assert = { "password" => nil, "password-updated" => nil }
      _(override["tags"]).must_equal tags_assert
      _(child_profile["parent_profile"]).must_equal "wrapper-override"

      # check for original code on child profile
      expected_value = <<~END
        control 'pro1-con2' do
          impact 0.9
          title 'Profile 1 - Control 2'
          desc 'Profile 1 - Control 2 description'
          desc 'overwrite me', 'overwrite this'
          tag 'password'
          describe file('/etc/passwdddddddddd') do
            it { should exist }
          end
        end
      END
      _(child_control["code"]).must_equal expected_value

      _(stderr).must_be_empty

      if is_windows?
        assert_exit_code 100, out
      else
        assert_exit_code 0, out
      end
    end
  end

  describe "when using multiple custom resources with each other" do
    let(:out) { inspec("exec " + File.join(examples_path, "custom-resource") + " --no-create-lockfile") }

    it "completes the run with failed controls but no exception" do
      _(stderr).must_be_empty

      assert_exit_code 0, out
    end
  end

  describe "when using a profile with non-UTF characters and wrong encoding" do
    let(:out) { inspec("exec " + File.join(profile_path, "wrong-char-profile") + " --no-create-lockfile") }

    it "completes the run with failed controls but no exception" do
      _(stderr).must_be_empty

      assert_exit_code 0, out
    end
  end

  describe "when targeting private GitHub profiles" do
    let(:private_profile) do
      URI.parse("https://github.com/chef/inspec-test-profile-private.git")
    end

    # This tests requires that a private SSH key be provided for a user that has
    # access to the private profile repo
    if ENV["INSPEC_TEST_SSH_KEY_PATH"]
      it "can use SSH + Git" do
        target = "git@" + private_profile.host + ":" + private_profile.path
        ssh_prefix = 'GIT_SSH_COMMAND="ssh -i ' +
          ENV["INSPEC_TEST_SSH_KEY_PATH"] +
          '"'
        inspec_command = "exec " + target + " --reporter json-min"
        inspec(inspec_command, ssh_prefix)

        _(JSON.parse(stdout)["controls"][0]["status"]).must_equal "passed"

        _(stderr).must_equal ""

        assert_exit_code 0, out
      end
    end

    # This tests requires that a GitHub API token be provided for a user that
    # has access to the private profile repo
    if ENV["INSPEC_TEST_GITHUB_TOKEN"]
      it "can use HTTPS + token + Git" do
        private_profile.userinfo = ENV["INSPEC_TEST_GITHUB_TOKEN"]
        inspec_command = "exec " + private_profile.to_s + " --reporter json-min"
        inspec(inspec_command)

        _(JSON.parse(stdout)["controls"][0]["status"]).must_equal "passed"

        _(stderr).must_equal ""

        assert_exit_code 0, out
      end
    end
  end

  describe "when specifying a config file" do
    let(:run_result) { run_inspec_process("exec " + File.join(profile_path, "simple-metadata") + " " + cli_args, json: true, env: env) }
    let(:seen_target_id) { run_result.payload.json["platform"]["target_id"] }
    let(:stderr) { run_result.stderr }
    let(:env) { {} }

    describe "when using the legacy --json-config option" do
      let(:cli_args) { "--json-config " + File.join(config_dir_path, "json-config", "good.json") }
      it "should see the custom target ID value" do
        _(stderr).must_be_empty # TODO: one day deprecate the --json-config option
        _(seen_target_id).must_equal "from-config-file"
      end
    end

    describe "when using the --config option to read from a custom file" do
      let(:cli_args) { "--config " + File.join(config_dir_path, "json-config", "good.json") }
      it "should see the custom target ID value" do
        _(stderr).must_be_empty
        _(seen_target_id).must_equal "from-config-file"
      end
    end

    unless windows?
      describe "when using the --config option to read from STDIN" do
        let(:json_path) { File.join(config_dir_path, "json-config", "good.json") }
        let(:cli_args) { "--config -" }
        let(:opts) { { prefix: "cat " + json_path + " | ", json: true, env: env } }

        # DO NOT use the `let`-defined run_result through here
        # If you do, it will execute twice, and cause STDIN to read empty on the second time
        it "exec should see the custom target ID value" do
          result = run_inspec_process( "exec " + File.join(profile_path, "simple-metadata") + " " + cli_args + " ", opts )

          _(result.stderr).must_be_empty
          _(result.payload.json["platform"]["target_id"]).must_equal "from-config-file"
        end

        it "detect should exit 0" do
          result = run_inspec_process( "detect " + cli_args + " ", opts )

          _(result.stderr).must_be_empty

          assert_exit_code 0, result
        end

        it "shell should exit 0" do
          result = run_inspec_process( 'shell -c "platform.family" ' + cli_args + " ", opts )

          _(result.stderr).must_be_empty

          assert_exit_code 0, result
        end
      end
    end

    describe "when reading from the default location" do
      # Should read from File.join(config_dir_path, 'fakehome-2', '.inspec', 'config.json')
      let(:env) { { "HOME" => File.join(config_dir_path, "fakehome-2") } }
      let(:cli_args) { "" }
      it "should see the homedir target ID value" do
        _(stderr).must_be_empty

        _(seen_target_id).must_equal "from-fakehome-config-file"
      end
    end

    describe "when --config points to a nonexistant location" do
      let(:cli_args) { "--config " + "no/such/path" }
      it "should issue an error with the file path" do
        _(stderr).wont_match looks_like_a_stacktrace
        _(stderr).must_include "Could not read configuration file" # Should specify error
        _(stderr).must_include "no/such/path" # Should include error value seen

        assert_exit_code 1, run_result
      end
    end

    describe "when --config points to a malformed file" do
      let(:cli_args) { "--config " + File.join(config_dir_path, "json-config", "malformed.json") }
      it "should issue an error with the parse message" do
        _(stderr).wont_match looks_like_a_stacktrace
        _(stderr).must_include "Failed to load JSON"
        _(stderr).must_include "Config was:"

        assert_exit_code 1, run_result
      end
    end

    describe "when --config points to an invalid file" do
      let(:cli_args) { "--config " + File.join(config_dir_path, "json-config", "invalid.json") }
      it "should issue an error with the parse message" do
        _(stderr).wont_match looks_like_a_stacktrace
        _(stderr).must_include "Unrecognized top-level configuration"
        _(stderr).must_include "this_key_is_invalid"

        assert_exit_code 1, run_result
      end
    end
  end

  describe "when specifying the execution target" do
    let(:local_plat) do
      json = run_inspec_process("detect --format json", {}).stdout
      # .slice is available in ruby 2.5+
      JSON.parse(json).select { |k, v| %w{name release}.include? k }
    end
    let(:run_result) { run_inspec_process("exec " + File.join(profile_path, "simple-metadata") + " " + cli_args, json: true) }
    let(:seen_platform) { run_result.payload.json["platform"].select { |k, v| %w{name release target_id}.include? k } }
    let(:stderr) { run_result.stderr }

    describe "when neither target nor backend is specified" do
      let(:cli_args) { "" }
      it "should connect to the local platform" do
        _(seen_platform).must_equal local_plat
      end
    end

    describe "when local:// is specified" do
      let(:cli_args) { " -t local:// " }
      it "should connect to the local platform" do
        _(seen_platform).must_equal local_plat
      end
    end

    describe "when an unrecognized backend is specified" do
      let(:cli_args) { "-b garble " }
      it "should exit with an error" do
        _(stderr).wont_match looks_like_a_stacktrace
        # "Can't find train plugin garble. Please install it first"
        _(stderr).must_include "Can't find train plugin"
        _(stderr).must_include "garble"

        assert_exit_code 1, run_result
      end
    end

    describe "when an unrecognized target schema is specified" do
      let(:cli_args) { "-t garble:// " }
      it "should exit with an error" do
        _(stderr).wont_match looks_like_a_stacktrace
        # "Can't find train plugin garble. Please install it first"
        _(stderr).must_include "Can't find train plugin"
        _(stderr).must_include "garble"

        assert_exit_code 1, run_result
      end
    end

    describe "when a schemaless URI is specified" do
      let(:cli_args) { "-t garble " }
      it "should exit with an error" do
        _(stderr).wont_match looks_like_a_stacktrace
        # "Could not recognize a backend from the target garble - use a URI
        # format with the backend name as the URI schema.  Example: 'ssh://somehost.com'
        # or 'transport://credset' or 'transport://' if credentials are provided
        #  outside of InSpec."
        _(stderr).must_include "Could not recognize a backend"
        _(stderr).must_include "garble"
        _(stderr).must_include "ssh://somehost.com"
        _(stderr).must_include "transport://credset"

        assert_exit_code 1, run_result
      end
    end

    describe "when a target URI with a known credset is used" do
      let(:cli_args) { "--target mock://mycredset" + " --config " + File.join(config_dir_path, "json-config", "mock-credset.json") }
      it "should connect to the mock platform" do
        _(seen_platform).must_equal({ "name" => "mock", "release" => "unknown", "target_id" => "from-mock-credset-config-file" })
      end
    end
  end
end
