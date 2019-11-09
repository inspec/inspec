require "helper"
require "inspec/reporters"

describe Inspec::Reporters::Junit do
  let(:report) do
    data = JSON.parse(File.read("test/fixtures/reporters/run_data.json"),
                      symbolize_names: true)
    Inspec::Reporters::Junit.new({ run_data: data })
  end

  describe "#render" do
    it "confirm render output" do
      cli_output = File.read("test/fixtures/reporters/junit_output")
      report.render
      _(report.rendered_output).must_equal cli_output
    end
  end
end
