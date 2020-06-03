require "helper"
require_relative "../../../lib/plugins/inspec-reporter-json-min/lib/inspec-reporter-json-min"
require_relative "../../../lib/plugins/inspec-reporter-json-min/lib/inspec-reporter-json-min/reporter"

describe InspecPlugins::JsonMinReporter::Reporter do
  let(:reporter) do
    data = JSON.parse(File.read("test/fixtures/reporters/run_data.json"), symbolize_names: true)
    InspecPlugins::JsonMinReporter::Reporter.new({ run_data: data })
  end

  describe "#render" do
    it "confirm render output" do
      output = File.read("test/fixtures/reporters/json_min_output")
      reporter.render
      _(reporter.rendered_output).must_equal output
    end
  end

  describe "#report" do
    it "confirm report output" do
      output = File.read("test/fixtures/reporters/json_min_output")
      output = JSON.parse(output, symbolize_names: true)
      _(reporter.report).must_equal output
    end
  end
end
