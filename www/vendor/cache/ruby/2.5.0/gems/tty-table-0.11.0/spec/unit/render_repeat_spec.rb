# frozen_string_literal: true

RSpec.describe TTY::Table, 'render repeat' do
  it "renders consistently" do
    table = TTY::Table.new header: ['header1', 'header2']
    table << ['a1', 'a2']
    table << ['b1', 'b2']
    options = {padding: [1,1,1,1], alignments: [:right, :center]}
    expect(table.render(:ascii, options)).to eq unindent(<<-EOS)
      +---------+---------+
      |         |         |
      | header1 | header2 |
      |         |         |
      +---------+---------+
      |         |         |
      |      a1 |   a2    |
      |         |         |
      |         |         |
      |      b1 |   b2    |
      |         |         |
      +---------+---------+
    EOS

    expect(table.render(:ascii, options)).to eq unindent(<<-EOS)
      +---------+---------+
      |         |         |
      | header1 | header2 |
      |         |         |
      +---------+---------+
      |         |         |
      |      a1 |   a2    |
      |         |         |
      |         |         |
      |      b1 |   b2    |
      |         |         |
      +---------+---------+
    EOS
  end
end
