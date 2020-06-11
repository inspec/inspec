require 'spec_helper'

RSpec.describe(Regexp::Expression::Sequence) do
  describe('#initialize') do
    it 'supports the old, nonstandard arity for backwards compatibility' do
      expect { Sequence.new(0, 0, 0) }.to output.to_stderr
    end
  end
end
