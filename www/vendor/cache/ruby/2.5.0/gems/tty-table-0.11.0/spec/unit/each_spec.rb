# frozen_string_literal: true

RSpec.describe TTY::Table, '#each' do
  let(:header) { ['Header1'] }
  let(:rows)   { [['a1'], ['b1']] }

  subject(:table) { described_class.new(header, rows) }

  context 'with no block' do
    it { expect(table.each).to be_instance_of(to_enum.class) }

    it 'yields the expected values' do
      expect(table.each.to_a).to eql(table.to_a)
    end
  end

  context 'with block' do
    it 'yields each row' do
      yields = []
      table.each { |row| yields << row }
      expect(yields).to eql(table.to_a)
    end
  end
end
