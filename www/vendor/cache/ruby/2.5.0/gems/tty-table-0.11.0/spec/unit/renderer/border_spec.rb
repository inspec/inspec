# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer, '#border' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:border) { nil }

  let(:table) { TTY::Table.new(header, rows) }

  subject(:renderer) { described_class.select(type).new(table) }

  context 'when basic renderer' do
    let(:type)   { :basic }
    let(:border) { {characters: {'top' => '-'}, style: :red} }

    it 'specifies border in hash' do
      renderer.border(border)
      expect(renderer.border.characters['top']).to eql('-')
    end

    it 'specifies border in characters attribute' do
      renderer.border.characters = {'top' => '*'}
      expect(renderer.border.characters['top']).to eql('*')
    end

    it 'specifies border in block' do
      renderer.border do
        mid          '='
        mid_mid      ' '
      end

      expect(renderer.render).to eq unindent(<<-EOS)
        h1 h2 h3
        == == ==
        a1 a2 a3
        b1 b2 b3
      EOS
    end
  end

  context 'when ascii renderer' do
    let(:type) { :ascii }

    it 'specifies border in block' do
      renderer.border do
        mid          '='
        mid_mid      '='
        mid_left     '='
        mid_right    '='
      end

      expect(renderer.render).to eq unindent(<<-EOS)
        +--+--+--+
        |h1|h2|h3|
        ==========
        |a1|a2|a3|
        |b1|b2|b3|
        +--+--+--+
      EOS
    end

    it 'specifies border as hash' do
      renderer.border({characters: {
        'mid'       => '=',
        'mid_mid'   => '=',
        'mid_left'  => '=',
        'mid_right' => '=',
      }})

      expect(renderer.render).to eq unindent(<<-EOS)
        +--+--+--+
        |h1|h2|h3|
        ==========
        |a1|a2|a3|
        |b1|b2|b3|
        +--+--+--+
      EOS
    end
  end

  context 'when unicode renderer' do
    let(:type) { :unicode }

    it 'specifies border in block' do
      renderer.border do
        mid          '='
        mid_mid      '='
        mid_left     '='
        mid_right    '='
      end

      expect(renderer.render).to eq unindent(<<-EOS)
        ┌──┬──┬──┐
        │h1│h2│h3│
        ==========
        │a1│a2│a3│
        │b1│b2│b3│
        └──┴──┴──┘
      EOS
    end
  end
end # border
