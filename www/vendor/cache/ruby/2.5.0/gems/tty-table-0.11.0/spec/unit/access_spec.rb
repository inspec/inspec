# frozen_string_literal: true

RSpec.describe TTY::Table, 'access' do
  let(:header) { [:head1, :head2] }
  let(:rows)   { [['a1', 'a2'], ['b1', 'b2']] }

  subject(:table) { TTY::Table.new rows: rows, header: header }

  it { is_expected.to respond_to(:element) }

  it { is_expected.to respond_to(:component) }

  it { is_expected.to respond_to(:at) }

  context 'when array like access' do
    it { expect(table[0,0]).to eq('a1') }

    it { expect(table[0]).to eq(['a1','a2']) }

    it { expect(table[5]).to eq(nil) }

    it { expect(table[-1]).to eq(['b1','b2']) }

    it { expect(table[5,5]).to eq(nil) }

    it 'raises error for negative indices' do
      expect { table[-5,-5] }.to raise_error(IndexError)
    end
  end

  context '#row' do
    it 'returns nil for wrong index' do
      expect(table.row(11)).to be_nil
    end

    it 'gets row at index' do
      expect(table.row(1)).to eq(rows[1])
    end

    it 'yields self for wrong index' do
      block = lambda { |el| [] << el }
      expect(table.row(11, &block)).to eq(table)
    end

    it 'yields row at index' do
      yields = []
      expect {
        table.row(1).each { |el| yields << el }
      }.to change { yields }.from( [] ).to( rows[1] )
    end
  end

  context '#column' do
    it "gets based on header name" do
      expect(table.column(:head1)).to eq(['a1', 'b1'])
    end

    it "yields based on header name" do
      yielded = []
      table.column(:head1) { |el| yielded << el }
      expect(yielded).to eql(['a1', 'b1'])
    end

    it 'returns nil for wrong index' do
      expect(table.column(11)).to be_nil
    end

    it 'gets column at index' do
      expect(table.column(0)).to eq(['a1', 'b1'])
    end

    it 'yields self for wrong index' do
      block = lambda { |el| [] << el }
      expect(table.column(11, &block)).to eq(table)
    end

    it 'yields column at index' do
      yields = []
      expect {
        table.column(1).each { |el| yields << el }
      }.to change { yields }.from( [] ).to( ['a2', 'b2'])
    end
  end
end
