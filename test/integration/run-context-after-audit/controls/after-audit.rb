
# run-context-during-audit should have left a file with a JSON
# representation of the stack as experienced by the audit cookbook.

raw_data = JSON.parse(file("/tmp/audit_stack.json").content)
# These aren't really stack frames, so we do some duck typing
Frame = Struct.new(:absolute_path, :label)
reconstructed_stack = raw_data.map{ |f| Frame.new(f["absolute_path"], f["label"]) }

require "inspec/utils/telemetry/run_context_probe"

control "run-context" do
  describe Inspec::Telemetry::RunContextProbe.guess_run_context(reconstructed_stack) do
    it { should eq "audit-cookbook" }
  end
end
