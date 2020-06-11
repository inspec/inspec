# frozen_string_literal: true

RSpec.describe TTY::Table::Columns, '#widths_from' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:table)  { TTY::Table.new header, rows }

  subject { described_class.widths_from(table, column_widths) }

  context 'when empty array' do
    let(:column_widths) { [] }

    it 'raises an error' do
      expect { subject }.to raise_error(TTY::Table::InvalidArgument)
    end
  end

  context 'when invalid size array' do
    let(:column_widths) { [3,3] }

    it 'raises an error' do
      expect { subject }.to raise_error(TTY::Table::InvalidArgument)
    end
  end

  context 'when valid array' do
    let(:column_widths) { [3,3,3] }

    it 'converts into numbers' do
      expect(subject).to eql(column_widths)
    end
  end

  context 'when nil' do
    let(:column_widths) { nil }

    it 'extracts widths' do
      expect(subject).to eql([2,2,2])
    end
  end

  context 'when numeric' do
    let(:column_widths) { 5 }

    it 'generates widths' do
      expect(subject).to eql([5,5,5])
    end
  end
end
