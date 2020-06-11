# frozen_string_literal: true

RSpec.describe TTY::Table, 'options' do
  let(:rows)   { [['a1', 'a2'], ['b1', 'b2']] }
  let(:widths) { nil }
  let(:aligns) { [] }
  let(:object) { described_class }
  let(:options) {
    {
      column_widths: widths,
      column_aligns: aligns,
      renderer: :basic
    }
  }

  subject(:table) { object.new rows, options }

  it { expect(table.header).to be_nil }

  it { expect(table.rows).to eq(rows) }

  it { expect(table.orientation).to be_kind_of TTY::Table::Orientation::Horizontal }
end
