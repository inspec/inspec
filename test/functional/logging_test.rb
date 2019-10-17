# Logging and deprecation facilities functional tests

require "functional/helper"

describe "Deprecation Facility Behavior" do
  include FunctionalHelper

  let(:profile) { File.join(profile_path, "deprecation", profile_name) }
  let(:invocation) { "exec #{profile} #{control_flag}" }
  # Running in JSON mode has the side-effect of sending log messages to $stderr
  let(:run_result) { run_inspec_process(invocation, json: true) }

  # Expect one control, 3 results
  let(:json_result) { run_result.payload.json["profiles"][0]["controls"][0]["results"] }

  describe "when the deprecation is in a custom resource and the deprecate DSL method is used" do
    describe "when the action is to fail the control" do
      describe "when the resource is called in a control" do
        let(:profile_name) { "typical" }
        let(:control_flag) { "--controls deprecate_fail_mode" }

        it "should result in a failed control" do
          _(json_result.count).must_equal 3
          _(json_result[0]["status"]).must_equal "passed"
          _(json_result[2]["status"]).must_equal "passed"
          _(json_result[1]["status"]).must_equal "failed"
          _(json_result[1]["message"]).must_include "DEPRECATION"
          _(json_result[1]["message"]).must_include "This should fail"
          _(json_result[1]["message"]).must_include "(used at"
          _(json_result[1]["message"]).must_include "test/unit/mock/profiles/deprecation/typical/controls/typical.rb"
          # TODO: Brittle Test
          _(json_result[1]["message"]).must_include "typical.rb:10" # Line number check

          _(run_result.stderr).must_be_empty

          assert_exit_code 100, run_result
        end
      end

      describe "when the resource is called outside a control" do
        let(:profile_name) { "bare" }
        let(:control_flag) { "" }

        it "should result in a warning, not a stacktrace or abort" do
          _(json_result.count).must_equal 1
          _(json_result[0]["status"]).must_equal "passed"

          stderr_lines = run_result.stderr.split("\n")
          _(stderr_lines.count).must_equal 1

          deprecation_line = stderr_lines.first
          _(deprecation_line).must_include "DEPRECATION"
          _(deprecation_line).must_include "WARN"
          _(deprecation_line).must_include "This should fail"
          _(deprecation_line).must_include "(used at"
          _(deprecation_line).must_include "test/unit/mock/profiles/deprecation/bare/controls/bare.rb"
          # TODO: Brittle Test
          _(deprecation_line).must_include "bare.rb:2"

          assert_exit_code 0, run_result
        end
      end
    end

    describe "when the action is exit and no code is specified" do
      let(:profile_name) { "typical" }
      let(:control_flag) { "--controls deprecate_exit_mode_implicit" }

      it "should result in an exit with a special code" do
        # Exactly one error should be output
        stderr_lines = run_result.stderr.split("\n")
        _(stderr_lines.count).must_equal 1

        # Contents of the deprecation
        deprecation_line = stderr_lines.first
        _(deprecation_line).must_include "DEPRECATION"
        _(deprecation_line).must_include "ERROR"
        _(deprecation_line).must_include "This should exit"
        _(deprecation_line).must_include "(used at" # Beginning of a single-frame stack locator
        _(deprecation_line).must_include "test/unit/mock/profiles/deprecation/typical/controls/typical.rb" # Frame should have been identified as coming from the test profile
        # TODO: Brittle Test
        _(deprecation_line).must_include "typical.rb:27" # Line number check

        # The reporter should not fire
        _(run_result.stdout).must_be_empty

        # 3 is the FATAL_DEPRECATION value from Inspec::UI
        assert_exit_code 3, run_result
      end
    end

    describe "when the action is exit and a specific code is specified" do
      let(:profile_name) { "typical" }
      let(:control_flag) { "--controls deprecate_exit_mode_explicit" }

      it "should result in an exit with a special code" do
        # Exactly one error should be output
        stderr_lines = run_result.stderr.split("\n")
        _(stderr_lines.count).must_equal 1

        # Contents of the deprecation
        deprecation_line = stderr_lines.first
        _(deprecation_line).must_include "DEPRECATION" # Flagged as deprecation
        _(deprecation_line).must_include "ERROR" # Flagged as an error
        _(deprecation_line).must_include "This should exit" # Specific deprecation message
        _(deprecation_line).must_include "(used at" # Beginning of a single-frame stack locator
        _(deprecation_line).must_include "test/unit/mock/profiles/deprecation/typical/controls/typical.rb" # Frame should have been identified as coming from the test profile
        # TODO: Brittle Test
        _(deprecation_line).must_include "typical.rb:44" # Line number check

        # The reporter should not fire
        _(run_result.stdout).must_be_empty

        # 8 is a custom value
        assert_exit_code 8, run_result
      end
    end

    describe "when the action is warn" do
      let(:profile_name) { "typical" }
      let(:control_flag) { "--controls deprecate_warn_mode" }

      it "should result in a warning, not a stacktrace or abort" do
        _(json_result.count).must_equal 3
        _(json_result[0]["status"]).must_equal "passed"
        _(json_result[1]["status"]).must_equal "passed"
        _(json_result[2]["status"]).must_equal "passed"

        stderr_lines = run_result.stderr.split("\n")
        _(stderr_lines.count).must_equal 1

        # Content of the deprecation
        deprecation_line = stderr_lines.first
        _(deprecation_line).must_include "DEPRECATION" # Flagged as deprecation
        _(deprecation_line).must_include "WARN" # Flagged as a warning
        _(deprecation_line).must_include "This should warn" # Specific deprecation message
        _(deprecation_line).must_include "(used at" # Beginning of a single-frame stack locator
        _(deprecation_line).must_include "test/unit/mock/profiles/deprecation/typical/controls/typical.rb" # Frame should have been identified as coming from the test profile
        # TODO: Brittle Test
        _(deprecation_line).must_include "typical.rb:61" # Line number check

        assert_exit_code 0, run_result
      end
    end

    describe "when the action is ignore" do
      let(:profile_name) { "typical" }
      let(:control_flag) { "--controls deprecate_ignore_mode --log-level debug" }

      it "should appear to be a normal run, no warnings or stacktrace or abort, but include debug message" do
        _(json_result.count).must_equal 3
        _(json_result[0]["status"]).must_equal "passed"
        _(json_result[1]["status"]).must_equal "passed"
        _(json_result[2]["status"]).must_equal "passed"

        # JSON mode will send debug messages to $stderr
        # [2019-01-15T23:41:41-05:00] DEBUG: DEPRECATION: This should be ignored (used at test/unit/mock/profiles/deprecation/typical/controls/typical.rb:79)
        deprecation_line = run_result.stderr.split("\n").detect { |line| line.include?("This should be ignored") }
        _(deprecation_line).wont_be_nil
        _(deprecation_line).must_include "DEBUG"
        _(deprecation_line).must_include "DEPRECATION"
        _(deprecation_line).must_include "(used at" # Beginning of a single-frame stack locator
        _(deprecation_line).must_include "test/unit/mock/profiles/deprecation/typical/controls/typical.rb" # Frame should have been identified as coming from the test profile
        # TODO: Brittle Test
        _(deprecation_line).must_include "typical.rb:77" # Line number check

        assert_exit_code 0, run_result
      end
    end
  end

  describe "when inspec check is used in json mode against a profile with a deprecation" do
    describe "inspec check with json formatter" do
      let(:profile_name) { "check" }
      it "can check a profile and produce valid JSON" do
        run_result = run_inspec_process("check " + profile + " --format json")
        _(run_result.stdout).wont_include "DEPRECATION"
        _(run_result.stderr).must_include "DEPRECATION"
        JSON.parse(run_result.stdout) # No exception here
      end
    end
  end
end
