require 'spec_helper'

RSpec.describe(Regexp::Expression::Root) do
  describe('#initialize') do
    it 'supports the old, nonstandard arity for backwards compatibility' do
      expect { Root.new }.to output.to_stderr
    end
  end
end
