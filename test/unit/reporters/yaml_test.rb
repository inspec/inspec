require "helper"
require "inspec/reporters"

describe Inspec::Reporters::Yaml do
  let(:report) do
    data = YAML.load_file("test/fixtures/reporters/run_data.yml")
    Inspec::Reporters::Yaml.new({ run_data: data })
  end

  # Match yaml reporter data
  # Strip leading white spaces from empty scalar values for testing
  # In Ruby, depending on its version, empty values are generated with or without leading spaces
  # This was affecting the title: and desc: fields
  def strip_white_spaces_from_empty_values(output)
    output.gsub(/:\s*\n/, ":\n")
  end

  describe "#render" do
    it "confirm render output" do
      output = File.read("test/fixtures/reporters/yaml_output")
      report.render
      stripped_rendered_output = strip_white_spaces_from_empty_values(report.rendered_output)
      stripped_output = strip_white_spaces_from_empty_values(output)
      # Match successful parsing of YAML reporter data
      _(stripped_rendered_output).must_equal stripped_output
    end
  end
end
