# frozen_string_literal: true

RSpec.describe TTY::Table, '#<<' do
  let(:rows) { ['a', 'b', 'c'] }
  let(:object) { described_class }

  subject(:table) { object[rows] }

  context 'with primitive values' do
    let(:row) { [1, 2, 3] }

    it 'extracts values correctly' do
      table << row
      expect(table.to_a.last).to eql(row)
    end
  end

  context 'with complex values' do
    let(:row) { [1, { value: 2 }, 3] }

    it 'extracts values correctly' do
      table << row
      expect(table.to_a.last).to eql([1,2,3])
    end
  end
end
