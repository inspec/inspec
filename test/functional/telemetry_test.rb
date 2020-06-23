require "functional/helper"

describe "telemetry" do
  include FunctionalHelper
  parallelize_me!

  describe "detecting CLI runtime context" do
    let(:run_result) { run_inspec_process("run_context") }
    it "should detect cli context" do
      _(run_result.stderr).must_equal ""
      _(run_result.stdout).must_include "cli"
    end
  end
end
