require 'helper'
require 'inspec/reporters'

describe Inspec::Reporters::Base do
  let(:path) { File.expand_path(File.dirname(__FILE__)) }
  let(:report) do
    data = JSON.parse(File.read(path + '/../mock/reporters/run_data.json'), symbolize_names: true)
    Inspec::Reporters::Base.new({ run_data: data })
  end

  describe '#output' do
    it 'append to output' do
      report.output ''
      report.output 'test'
      report.output ''
      assert = report.instance_variable_get(:@output)
      assert.must_equal "\ntest\n\n"
    end
  end
end
