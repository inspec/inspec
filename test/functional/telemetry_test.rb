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

  describe "detecting running under automate" do
    # We currently "detect" automate by detecting automate reporters
    let(:run_result) { run_inspec_process("exec #{profile_path}/entitlement/runcontext-automate --reporter json-automate", json: true) }
    it "should detect automate reporter option" do
      _(run_result.stderr).must_equal ""
      assert_json_controls_passing
    end
  end
end
