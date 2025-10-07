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

  describe "--disable-telemetry option" do
    it "should show the option in help" do
      run_result = run_inspec_process("--help")
      _(run_result.stdout).must_include "--disable-telemetry"
      _(run_result.stdout).must_include "Disable telemetry (only available for CINC users)"
    end

    it "should accept the --disable-telemetry option without error" do
      run_result = run_inspec_process("version --disable-telemetry")
      _(run_result.exit_status).must_equal 0
    end
  end
end
