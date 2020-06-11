# frozen_string_literal: true

RSpec.describe TTY::Table::Indentation, '.indent' do
  context 'when enumerable' do
    it 'inserts indentation for each element' do
      expect(described_class.indent(['line1'], 2)).to eql(['  line1'])
    end
  end

  context 'when string' do
    it 'inserts indentation' do
      expect(described_class.indent('line1', 2)).to eql('  line1')
    end
  end
end
