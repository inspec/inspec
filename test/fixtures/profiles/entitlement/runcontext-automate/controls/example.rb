require "inspec/utils/telemetry/run_context_probe"
control "tmp-1.0" do
  describe Inspec::Telemetry::RunContextProbe.under_automate? do
    it { should eq true }
  end
end
