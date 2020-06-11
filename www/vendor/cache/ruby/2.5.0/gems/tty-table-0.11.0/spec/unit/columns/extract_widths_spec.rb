# frozen_string_literal: true

RSpec.describe TTY::Table::Columns, '#extract_widths' do
  let(:color) { Pastel.new(enabled: true) }

  it 'extract widths' do
    header = ['h1', 'h2', 'h3']
    rows   = [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']]
    table = TTY::Table.new(header, rows)
    expect(described_class.extract_widths(table.data)).to eql([2,2,2])
  end

  it "extracts widths from utf" do
    header = ['h1', 'うなじ']
    rows   = [['こんにちは', 'a2'], ['b1','選択']]
    table  = TTY::Table.new(header, rows)
    expect(described_class.extract_widths(table.data)).to eql([10,6])
  end

  it "extracts widths from multiline text" do
    table = TTY::Table.new
    table << ["Multi\nLine\nContent", "Text\nthat\nwraps"]
    table << ["Some\nother\ntext", 'Simple']
    expect(described_class.extract_widths(table.data)).to eq([7,6])
  end

  it "extracts widths from multiline text" do
    table = TTY::Table.new
    table << ["Multi\\nLine\\nContent", "Text\\nthat\\nwraps"]
    table << ["Some\\nother\\ntext", 'Simple']
    expect(described_class.extract_widths(table.data)).to eq([20, 17])
  end

  it "extracts widths from ANSI text" do
    header = [color.green('h1'), 'h2']
    table = TTY::Table.new header: header
    table << [color.green.on_blue('a1'), 'a2']
    table << ['b1', color.red.on_yellow('b2')]
    expect(described_class.extract_widths(table.data)).to eq([2,2])
  end
end
