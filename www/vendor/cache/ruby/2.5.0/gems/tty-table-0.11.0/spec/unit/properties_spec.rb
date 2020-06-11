# frozen_string_literal: true

RSpec.describe TTY::Table, 'properties' do
  let(:rows) {[['a1', 'a2', 'a3'], ['b1', 'b2', 'c3']] }

  subject(:table) { described_class.new rows }

  it { expect(table.width).to eq(6) }

  it { expect(table.rows_size).to eq(2) }

  it { expect(table.columns_size).to eq(3) }

  it { expect(table.size).to eq([2,3]) }

  context 'no size' do
    let(:rows) { []  }

    it { expect(table.rows_size).to eq(0) }

    it { expect(table.columns_size).to eq(0) }
  end
end
