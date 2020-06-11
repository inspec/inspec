# frozen_string_literal: true

RSpec.describe TTY::Table, '.data' do
  it 'gets all table data' do
    header = ['h1', 'h2', 'h3']
    rows = [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']]
    table = described_class.new header, rows
    expect(table.data).to eql([header] + rows)
  end
end
