# encoding: utf-8
# copyright: 2017, Chef Software Inc.

require 'helper'

describe 'Impact' do
  let(:impact) { Inspec::Impact }

  describe 'impact from symbol method' do
    it 'returns the proper impact for :none symbol' do
      impact.impact_from_symbol(:none).must_equal 0.0
    end

    it 'returns the proper impact for :low symbol' do
      impact.impact_from_symbol(:low).must_equal 0.01
    end

    it 'returns the proper impact for :medium symbol' do
      impact.impact_from_symbol(:medium).must_equal 0.4
    end

    it 'returns the proper impact for :high symbol' do
      impact.impact_from_symbol(:high).must_equal 0.7
    end

    it 'returns the proper impact for :critical symbol' do
      impact.impact_from_symbol(:critical).must_equal 0.9
    end

    it 'returns an error for a invalid impact symbol' do
      e = proc { impact.impact_from_symbol('fake') }.must_raise(Inspec::ImpactError)
      e.message.must_match "'fake' is not a valid impact name [:none, :low, :medium, :high, :critical]."
    end
  end

  describe 'symbol from impact method' do
    it 'returns the proper impact symbol for 0.1' do
      impact.symbol_from_impact(0.1).must_equal :low
    end

    it 'returns the proper impact symbol for 0.57' do
      impact.symbol_from_impact(0.57).must_equal :medium
    end

    it 'returns the proper impact symbol for 0.7' do
      impact.symbol_from_impact(0.7).must_equal :high
    end

    it 'returns the proper impact symbol for 1' do
      impact.symbol_from_impact(1).must_equal :critical
    end

    it 'returns an error for a invalid impact score' do
      e = proc { impact.symbol_from_impact(99) }.must_raise(Inspec::ImpactError)
      e.message.must_match "'99.0' is not a valid impact score [0.0 - 1]."
    end
  end
end
