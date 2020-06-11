# frozen_string_literal: true

RSpec.describe TTY::Table, '.each_with_index' do

  context 'with no block' do
    it 'returns enumerable' do
      table = TTY::Table.new ['h1','h2'], [['a1','a2'],['b1','b2']]
      expect(table.each_with_index).to be_instance_of(to_enum.class)
    end

    it 'yields the expected values' do
      table = TTY::Table.new ['h1','h2'], [['a1','a2'],['b1','b2']]
      expect(table.each_with_index.to_a).to eql(table.to_a)
    end
  end

  context 'with block' do
    context 'without header' do
      it "yields rows with expected data" do
        yields = []
        table = TTY::Table.new [['a1','a2'],['b1','b2']]
        expected = [
          [['a1','a2'], 0],
          [['b1','b2'], 1]
        ]
        expect {
          table.each_with_index { |row, indx| yields << [row, indx] }
        }.to change { yields }.from([]).to(expected)
      end
    end

    context 'with header' do
      it "yields header and rows with expected data" do
        yields = []
        table = TTY::Table.new ['h1','h2'], [['a1','a2'],['b1','b2']]

        expected = [
          [['h1','h2'], 0],
          [['a1','a2'], 1],
          [['b1','b2'], 2]
        ]

        expect {
          table.each_with_index { |row, indx| yields << [row, indx] }
        }.to change { yields }.from( [] ).to( expected )
      end
    end
  end
end
