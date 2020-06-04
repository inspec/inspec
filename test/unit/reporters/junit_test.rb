require "helper"
require_relative "../../../lib/plugins/inspec-reporter-junit/lib/inspec-reporter-junit"
require_relative "../../../lib/plugins/inspec-reporter-junit/lib/inspec-reporter-junit/reporter"

describe InspecPlugins::JUnitReporter::Reporter do
  let(:reporter) do
    data = JSON.parse(File.read("test/fixtures/reporters/run_data.json"),
                      symbolize_names: true)
    InspecPlugins::JUnitReporter::Reporter.new({ run_data: data })
  end

  describe "#render" do
    it "confirm render output" do
      junit_output = File.read("test/fixtures/reporters/junit_output")
      reporter.render
      _(reporter.rendered_output).must_equal junit_output
    end
  end
end
