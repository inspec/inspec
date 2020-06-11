# frozen_string_literal: true

RSpec.describe TTY::Table::Columns, '#extract_widths!' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }

  it 'extract widths' do
    table = TTY::Table.new(header, rows)
    expect(described_class.total_width(table.data)).to eql(6)
  end
end
