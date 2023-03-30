require "helper"
require "inspec/reporters"

describe Inspec::Reporters::Yaml do
  let(:report) do
    data = YAML.load_file("test/fixtures/reporters/run_data.yml")
    Inspec::Reporters::Yaml.new({ run_data: data })
  end

  describe "#render" do
    it "confirm render output" do
      # The test is skipped on Windows because the output is different due to EOL differences.
      return if windows?

      output = File.read("test/fixtures/reporters/yaml_output")
      report.render
      _(report.rendered_output).must_equal output
    end
  end
end
