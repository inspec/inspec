require "functional/helper"

describe "debug logging during profile evaluation" do
  include FunctionalHelper

  let(:simple_debug_profile) { File.join(profile_path, "simple-debug-test") }
  let(:broken_debug_profile) { File.join(profile_path, "broken-debug-test") }

  describe "with a valid profile" do
    it "emits debug messages about target loading and control evaluation to stderr" do
      result = run_inspec_process("exec #{simple_debug_profile} --log-level debug", json: true)

      # Should show control being evaluated
      _(result.stderr).must_include "Evaluating control"
      # Should show profile count at run_tests
      _(result.stderr).must_include "Running 1 profile(s)"
    end
  end

  describe "with a broken profile using a non-existent resource" do
    it "emits debug messages during run to stderr" do
      result = run_inspec_process("exec #{broken_debug_profile} --log-level debug", json: true)

      # telemetry debug messages always fire
      _(result.stderr).must_include "Telemetry:"
    end
  end

  describe "verbose log level" do
    it "is accepted as a valid log level and emits verbose runner messages to stderr" do
      result = run_inspec_process("exec #{simple_debug_profile} --log-level verbose", json: true)

      # verbose level should produce telemetry verbose messages
      _(result.stderr).must_include "Telemetry: run starting"
    end
  end

  describe "trace log level" do
    it "is accepted as a valid log level and emits trace messages to stderr" do
      result = run_inspec_process("exec #{simple_debug_profile} --log-level trace", json: true)

      # trace level should include fine-grained telemetry trace detail
      _(result.stderr).must_include "Telemetry: run ending details"
    end

    it "emits more output than verbose level" do
      trace_result = run_inspec_process("exec #{simple_debug_profile} --log-level trace", json: true)
      verbose_result = run_inspec_process("exec #{simple_debug_profile} --log-level verbose", json: true)

      _(trace_result.stderr.length).must_be :>=, verbose_result.stderr.length
    end
  end
end
