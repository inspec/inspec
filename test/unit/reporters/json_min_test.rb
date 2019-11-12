require "helper"
require "inspec/reporters"

describe Inspec::Reporters::JsonMin do
  let(:report) do
    data = JSON.parse(File.read("test/fixtures/reporters/run_data.json"), symbolize_names: true)
    Inspec::Reporters::JsonMin.new({ run_data: data })
  end

  describe "#render" do
    it "confirm render output" do
      output = File.read("test/fixtures/reporters/json_min_output")
      report.render
      _(report.rendered_output).must_equal output
    end
  end

  describe "#report" do
    it "confirm report output" do
      output = File.read("test/fixtures/reporters/json_min_output")
      output = JSON.parse(output, symbolize_names: true)
      _(report.report).must_equal output
    end
  end
end
