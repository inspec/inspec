require 'helper'

describe Inspec::Reporters::Junit do
  let(:path) { File.expand_path(File.dirname(__FILE__)) }
  let(:report) do
    data = JSON.parse(File.read(path + '/../mock/reporters/run_data.json'), symbolize_names: true)
    Inspec::Reporters::Junit.new({ run_data: data })
  end

  describe '#render' do
    it 'confirm render output' do
      cli_output = File.read(path + '/../mock/reporters/junit_output')
      report.render
      report.rendered_output.must_equal cli_output
    end
  end
end
