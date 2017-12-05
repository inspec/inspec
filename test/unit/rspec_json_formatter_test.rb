# encoding: utf-8
# copyright: 2017, Chef Software Inc.

require 'helper'
require 'inspec/objects'

describe 'rspec_json_formatter' do
  describe 'InspecRspecCli::Control' do
    # have to require here else it messes with minitest
    require 'inspec/rspec_json_formatter'

    let(:control) do
      control = { results: [], title: 'test' }
      InspecRspecCli::Control.new(control, nil) 
    end

    it 'summary must count unique fails/skips' do
      control.expects(:summary_calculation_needed?).returns(false)
      control.stubs(:fails).returns([1, 1])
      control.stubs(:skips).returns([1, 1])
      control.summary.must_equal 'test (2 failed 2 skipped)'
    end

    it 'summary must count different fails/skips' do
      control.expects(:summary_calculation_needed?).returns(false)
      control.stubs(:fails).returns([1, 2])
      control.stubs(:skips).returns([1, 2])
      control.summary.must_equal 'test (2 failed 2 skipped)'
    end
  end
end
