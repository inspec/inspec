# frozen_string_literal: true

RSpec.describe TTY::Table, '#new' do
  it { is_expected.to be_kind_of(Enumerable) }

  it { is_expected.to be_kind_of(Comparable) }

  context 'with rows only' do
    it 'allows hash like syntax for rows' do
      table = TTY::Table[['a1','a2'], ['b1', 'b2']]
      expect(table.to_a).to eql([['a1','a2'], ['b1', 'b2']])
    end

    it 'allows for array' do
      table = TTY::Table.new [['a1','a2'], ['b1','b2']]
      expect(table.to_a).to eql([['a1','a2'], ['b1','b2']])
    end

    it 'allows for :rows key' do
      table = TTY::Table.new rows: [['a1','a2'], ['b1','b2']]
      expect(table.to_a).to eql([['a1','a2'], ['b1','b2']])
    end

    it 'allows for rows in a block' do
      table = TTY::Table.new do |t|
        t << ['a1', 'a2']
        t << ['b1', 'b2']
      end
      expect(table.to_a).to eql([['a1','a2'],['b1','b2']])
    end

    it 'allows to add rows after initialization' do
      table = TTY::Table.new
      table << ['a1','a2']
      table << ['b1','b2']
      expect(table.to_a).to eql([['a1','a2'],['b1','b2']])
    end

    it 'allows for chaining rows' do
      table = TTY::Table.new
      table << ['a1','a2'] << ['b1','b2']
      expect(table.to_a).to eql([['a1','a2'],['b1','b2']])
    end
  end

  context 'with header and rows' do
    it 'permits header and rows' do
      table = TTY::Table.new ['h1','h2'], [['a1','a2'],['b1','b2']]
      expect(table.to_a).to eql([['h1','h2'], ['a1','a2'], ['b1','b2']])
    end

    it 'permits only header with :header key' do
      table = TTY::Table.new header: ['h1','h2']
      expect(table.to_a).to eql([['h1','h2']])
    end
  end

  context 'with header and rows as hash' do
    it 'permits header as key and rows as hash values' do
      table = TTY::Table.new [{'h1' => ['a1','a2'], 'h2' => ['b1','b2']}]
      expect(table.to_a).to eql([['h1','h2'], ['a1','a2'], ['b1','b2']])
    end
  end

  context 'coercion' do
    it 'converts row arguments from hash to array' do
      table = TTY::Table.new rows: {a: 1, b: 2}
      expect(table.to_a).to eql([[:a,1],[:b,2]])
    end
  end
end
