# encoding: utf-8

require 'helper'

describe Inspec::Reporters::Yaml do
  let(:path) { File.expand_path(File.dirname(__FILE__)) }
  let(:report) do
    data = YAML.load_file(path + '/../mock/reporters/run_data.yaml')
    Inspec::Reporters::Yaml.new({ run_data: data })
  end

  describe '#render' do
    it 'confirm render output' do
      cli_output = File.read(path + '/../mock/reporters/yaml_output')
      report.render
      report.rendered_output.must_equal cli_output
    end
  end
end
