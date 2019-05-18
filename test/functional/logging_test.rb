# Logging and deprecation facilities functional tests

require 'functional/helper'

describe 'Deprecation Facility Behavior' do
  include FunctionalHelper

  let(:profile) { File.join(profile_path, 'deprecation', profile_name) }
  let(:invocation) { "exec #{profile} #{control_flag}" }
  # Running in JSON mode has the side-effect of sending log messages to $stderr
  let(:run_result) { run_inspec_process(invocation, json: true) }

  # Expect one control, 3 results
  let(:json_result) { run_result.payload.json['profiles'][0]['controls'][0]['results'] }

  describe 'when the deprecation is in a custom resource and the deprecate DSL method is used' do
    describe 'when the action is to fail the control' do
      describe 'when the resource is called in a control' do
        let(:profile_name) { 'typical' }
        let(:control_flag) { '--controls deprecate_fail_mode' }

        it 'should result in a failed control' do
          run_result.stderr.must_be_empty
          run_result.exit_status.must_equal 100
          json_result.count.must_equal 3
          json_result[0]['status'].must_equal 'passed'
          json_result[2]['status'].must_equal 'passed'
          json_result[1]['status'].must_equal 'failed'
          json_result[1]['message'].must_include 'DEPRECATION'
          json_result[1]['message'].must_include 'This should fail'
          json_result[1]['message'].must_include '(used at'
          json_result[1]['message'].must_include 'test/unit/mock/profiles/deprecation/typical/controls/typical.rb'
          json_result[1]['message'].must_include 'typical.rb:11' # Line number check
        end
      end

      describe 'when the resource is called outside a control' do
        let(:profile_name) { 'bare' }
        let(:control_flag) { '' }

        it 'should result in a warning, not a stacktrace or abort' do
          run_result.exit_status.must_equal 0
          json_result.count.must_equal 1
          json_result[0]['status'].must_equal 'passed'

          stderr_lines = run_result.stderr.split("\n")
          stderr_lines.count.must_equal 1

          deprecation_line = stderr_lines.first
          deprecation_line.must_include 'DEPRECATION'
          deprecation_line.must_include 'WARN'
          deprecation_line.must_include 'This should fail'
          deprecation_line.must_include '(used at'
          deprecation_line.must_include 'test/unit/mock/profiles/deprecation/bare/controls/bare.rb'
          deprecation_line.must_include 'bare.rb:3'
        end
      end
    end

    describe 'when the action is exit and no code is specified' do
      let(:profile_name) { 'typical' }
      let(:control_flag) { '--controls deprecate_exit_mode_implicit' }

      it 'should result in an exit with a special code' do
        # 3 is the FATAL_DEPRECATION value from Inspec::UI
        run_result.exit_status.must_equal 3

        # Exactly one error should be output
        stderr_lines = run_result.stderr.split("\n")
        stderr_lines.count.must_equal 1

        # Contents of the deprecation
        deprecation_line = stderr_lines.first
        deprecation_line.must_include 'DEPRECATION'
        deprecation_line.must_include 'ERROR'
        deprecation_line.must_include 'This should exit'
        deprecation_line.must_include '(used at' # Beginning of a single-frame stack locator
        deprecation_line.must_include 'test/unit/mock/profiles/deprecation/typical/controls/typical.rb' # Frame should have been identified as coming from the test profile
        deprecation_line.must_include 'typical.rb:28' # Line number check

        # The reporter should not fire
        run_result.stdout.must_be_empty
      end
    end

    describe 'when the action is exit and a specific code is specified' do
      let(:profile_name) { 'typical' }
      let(:control_flag) { '--controls deprecate_exit_mode_explicit' }

      it 'should result in an exit with a special code' do
        # 8 is a custom value
        run_result.exit_status.must_equal 8

        # Exactly one error should be output
        stderr_lines = run_result.stderr.split("\n")
        stderr_lines.count.must_equal 1

        # Contents of the deprecation
        deprecation_line = stderr_lines.first
        deprecation_line.must_include 'DEPRECATION' # Flagged as deprecation
        deprecation_line.must_include 'ERROR' # Flagged as an error
        deprecation_line.must_include 'This should exit' # Specific deprecation message
        deprecation_line.must_include '(used at' # Beginning of a single-frame stack locator
        deprecation_line.must_include 'test/unit/mock/profiles/deprecation/typical/controls/typical.rb' # Frame should have been identified as coming from the test profile
        deprecation_line.must_include 'typical.rb:45' # Line number check

        # The reporter should not fire
        run_result.stdout.must_be_empty
      end
    end

    describe 'when the action is warn' do
      let(:profile_name) { 'typical' }
      let(:control_flag) { '--controls deprecate_warn_mode' }

      it 'should result in a warning, not a stacktrace or abort' do
        run_result.exit_status.must_equal 0
        json_result.count.must_equal 3
        json_result[0]['status'].must_equal 'passed'
        json_result[1]['status'].must_equal 'passed'
        json_result[2]['status'].must_equal 'passed'

        stderr_lines = run_result.stderr.split("\n")
        stderr_lines.count.must_equal 1

        # Content of the deprecation
        deprecation_line = stderr_lines.first
        deprecation_line.must_include 'DEPRECATION' # Flagged as deprecation
        deprecation_line.must_include 'WARN' # Flagged as a warning
        deprecation_line.must_include 'This should warn' # Specific deprecation message
        deprecation_line.must_include '(used at' # Beginning of a single-frame stack locator
        deprecation_line.must_include 'test/unit/mock/profiles/deprecation/typical/controls/typical.rb' # Frame should have been identified as coming from the test profile
        deprecation_line.must_include 'typical.rb:62' # Line number check
      end
    end

    describe 'when the action is ignore' do
      let(:profile_name) { 'typical' }
      let(:control_flag) { '--controls deprecate_ignore_mode --log-level debug' }

      it 'should appear to be a normal run, no warnings or stacktrace or abort, but include debug message' do
        run_result.exit_status.must_equal 0
        json_result.count.must_equal 3
        json_result[0]['status'].must_equal 'passed'
        json_result[1]['status'].must_equal 'passed'
        json_result[2]['status'].must_equal 'passed'

        # JSON mode will send debug messages to $stderr
        # [2019-01-15T23:41:41-05:00] DEBUG: DEPRECATION: This should be ignored (used at test/unit/mock/profiles/deprecation/typical/controls/typical.rb:79)
        deprecation_line = run_result.stderr.split("\n").detect { |line| line.include?('This should be ignored') }
        deprecation_line.wont_be_nil
        deprecation_line.must_include 'DEBUG'
        deprecation_line.must_include 'DEPRECATION'
        deprecation_line.must_include '(used at' # Beginning of a single-frame stack locator
        deprecation_line.must_include 'test/unit/mock/profiles/deprecation/typical/controls/typical.rb' # Frame should have been identified as coming from the test profile
        deprecation_line.must_include 'typical.rb:78' # Line number check
      end
    end
  end
end
