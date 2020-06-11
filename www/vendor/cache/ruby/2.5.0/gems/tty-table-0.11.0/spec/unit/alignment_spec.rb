# frozen_string_literal: true

RSpec.describe TTY::Table, 'alignment' do
  it "aligns table columns when rendering" do
    table = TTY::Table.new ['header1', 'header2'], [['a1','a2'],['b1','b2']]
    expect(table.render(alignments: [:right, :center])).to eql([
      "header1 header2",
      "     a1   a2   ",
      "     b1   b2   "
    ].join("\n"))
  end

  it "uses default alignment when too few alignments provided" do
    table = TTY::Table.new ['header1', 'header2'], [['a1','a2'],['b1','b2']]
    expect(table.render(alignments: [:right])).to eql([
      "header1 header2",
      "     a1 a2     ",
      "     b1 b2     "
    ].join("\n"))
  end

  it "aligns table columns without header when rendering" do
    table = TTY::Table.new [['aaaaa1','a2'],['b1','bbbbb2']]
    expect(table.render(alignments: [:right, :center])).to eql([
      "aaaaa1   a2  ",
      "    b1 bbbbb2"
    ].join("\n"))
  end

  it "aligns individual fields when rendering" do
    table = TTY::Table.new header: ['header1', 'header2']
    table << ['a1', {value: 'a2', alignment: :center}]
    table << [{value: 'b1', alignment: :right}, 'b2']
    expect(table.render).to eql([
      "header1 header2",
      "a1        a2   ",
      "     b1 b2     "
    ].join("\n"))
  end

  it "prioritizes individual field options over table rendering options" do
    table = TTY::Table.new header: ['header1', 'header2']
    table << [{value: 'a1', alignment: :center},'a2']
    table << ['b1','b2']
    expect(table.render(alignments: [:right, :center])).to eql([
      "header1 header2",
      "  a1      a2   ",
      "     b1   b2   "
    ].join("\n"))
  end

  it "allows to align all columns at once" do
    table = TTY::Table.new ['header1', 'header2'], [['a1','a2'],['b1','b2']]
    expect(table.render(alignment: [:center])).to eql([
      "header1 header2",
      "  a1      a2   ",
      "  b1      b2   "
    ].join("\n"))
  end

  xit "aligns specific column" do
    table = TTY::Table.new ['header1', 'header2'], [['a1','a2'],['b1','b2']]
    expect(table.render(column_alignment: [1, :center])).to eql([
      "header1 header2",
      "a1        a2   ",
      "b1        b2   "
    ].join("\n"))
  end
end
