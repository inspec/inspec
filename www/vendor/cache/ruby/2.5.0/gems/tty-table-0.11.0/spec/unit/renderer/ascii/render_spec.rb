# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::ASCII, '#render' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows) { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:table) { TTY::Table.new header, rows }

  subject(:renderer) { described_class.new(table) }

  context 'only rows' do
    let(:table) { TTY::Table.new rows }

    it 'display table rows' do
      expect(renderer.render).to eq unindent(<<-EOS)
        +--+--+--+
        |a1|a2|a3|
        |b1|b2|b3|
        +--+--+--+
      EOS
    end
  end

  context 'with header' do
    it 'displays table with header' do
      expect(renderer.render).to eq unindent(<<-EOS)
        +--+--+--+
        |h1|h2|h3|
        +--+--+--+
        |a1|a2|a3|
        |b1|b2|b3|
        +--+--+--+
      EOS
    end
  end

  context 'with short header' do
    let(:header) { ['h1', 'h2'] }
    let(:rows)   { [['aaa1', 'a2'], ['b1', 'bb1']] }

    it 'displays table according to widths' do
      expect(renderer.render).to eq unindent(<<-EOS)
        +----+---+
        |h1  |h2 |
        +----+---+
        |aaa1|a2 |
        |b1  |bb1|
        +----+---+
      EOS
    end
  end

  context 'with long header' do
    let(:header) { ['header1', 'header2', 'header3'] }

    it 'header greater than row sizes' do
      expect(renderer.render).to eq unindent(<<-EOS)
      +-------+-------+-------+
      |header1|header2|header3|
      +-------+-------+-------+
      |a1     |a2     |a3     |
      |b1     |b2     |b3     |
      +-------+-------+-------+
      EOS
    end
  end
end
