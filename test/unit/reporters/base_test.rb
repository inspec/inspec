require "helper"
require "inspec/reporters"

describe Inspec::Reporters::Base do
  let(:path) { __dir__ }
  let(:report) do
    data = JSON.parse(File.read("test/fixtures//reporters/run_data.json"), symbolize_names: true)
    Inspec::Reporters::Base.new({ run_data: data })
  end

  describe "#output" do
    it "append to output" do
      report.output ""
      report.output "test"
      report.output ""
      assert = report.instance_variable_get(:@output)
      _(assert).must_equal "\ntest\n\n"
    end
  end
end
