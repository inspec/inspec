require "functional/helper"

describe "debug logging during profile evaluation" do
  include FunctionalHelper

  let(:simple_debug_profile) { File.join(profile_path, "simple-debug-test") }
  let(:broken_debug_profile) { File.join(profile_path, "broken-debug-test") }

  describe "with a valid profile using the file resource" do
    it "emits debug messages about resource lookup and initialization to stderr" do
      result = run_inspec_process("exec #{simple_debug_profile} --log-level debug --no-create-lockfile")

      # Should show resource being looked up
      _(result.stderr).must_include "Looking up resource"
      # Should show resource being instantiated
      _(result.stderr).must_include "Initializing resource"
      # Should show control being evaluated
      _(result.stderr).must_include "Evaluating control"
    end
  end

  describe "with a broken profile using a non-existent resource" do
    it "emits debug messages showing the failed resource lookup to stderr" do
      result = run_inspec_process("exec #{broken_debug_profile} --log-level debug --no-create-lockfile")

      # Should show the lookup attempt for 'nonesuch'
      _(result.stderr).must_include "Looking up resource: 'nonesuch'"
      # Should show the failure to find it
      _(result.stderr).must_include "not found"
    end
  end

  describe "verbose log level" do
    it "is accepted as a valid log level and emits verbose runner messages to stderr" do
      result = run_inspec_process("exec #{simple_debug_profile} --log-level verbose --no-create-lockfile")

      # verbose level should produce runner-level messages
      _(result.stderr).must_include "Running profile"
    end
  end

  describe "trace log level" do
    it "is accepted as a valid log level and emits trace messages to stderr" do
      result = run_inspec_process("exec #{simple_debug_profile} --log-level trace --no-create-lockfile")

      # trace level should include fine-grained target loading detail
      _(result.stderr).must_include "Adding target"
    end

    it "emits more output than debug level" do
      trace_result = run_inspec_process("exec #{simple_debug_profile} --log-level trace --no-create-lockfile")
      debug_result = run_inspec_process("exec #{simple_debug_profile} --log-level debug --no-create-lockfile")

      _(trace_result.stderr.length).must_be :>=, debug_result.stderr.length
    end
  end
end
