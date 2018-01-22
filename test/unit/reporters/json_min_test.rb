# encoding: utf-8

require 'helper'

describe Inspec::Reporters::JsonMin do
  let(:path) { File.expand_path(File.dirname(__FILE__)) }
  let(:report) do 
    data = JSON.parse(File.read(path + '/../mock/reporters/run_data.json'), symbolize_names: true)
    Inspec::Reporters::JsonMin.new({ run_data: data })
  end

  describe '#render' do
    it 'confirm render output' do
      cli_output = File.read(path + '/../mock/reporters/json_min_output')
      report.render
      report.rendered_output.must_equal cli_output
    end
  end
end
