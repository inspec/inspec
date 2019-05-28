require 'helper'

describe Inspec::Reporters::JsonMin do
  let(:path) { File.expand_path(File.dirname(__FILE__)) }
  let(:report) do
    data = JSON.parse(File.read(path + '/../mock/reporters/run_data.json'), symbolize_names: true)
    Inspec::Reporters::JsonMin.new({ run_data: data })
  end

  describe '#render' do
    it 'confirm render output' do
      output = File.read(path + '/../mock/reporters/json_min_output')
      report.render
      report.rendered_output.must_equal output
    end
  end

  describe '#report' do
    it 'confirm report output' do
      output = File.read(path + '/../mock/reporters/json_min_output')
      output = JSON.parse(output, symbolize_names: true)
      report.report.must_equal output
    end
  end
end
