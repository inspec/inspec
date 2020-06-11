# frozen_string_literal: true

RSpec.describe TTY::Table, '#filter' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }

  subject(:table)  { described_class.new(header, rows) }

  it 'filters fields' do
    expect(table.render do |renderer|
      renderer.filter = proc do |val, row, col|
        (col == 1 && row > 0) ? val.capitalize : val
      end
    end).to eq unindent(<<-EOS)
      h1 h2 h3
      a1 A2 a3
      b1 B2 b3
    EOS
  end
end
