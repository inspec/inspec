# frozen_string_literal: true

RSpec.describe TTY::Table, '#render' do
  let(:object) { described_class }
  let(:header) { ['h1', 'h2'] }
  let(:rows)   { [['a1', 'a2'], ['b1', 'b2']] }
  let(:color)  { Pastel.new(enabled: true) }
  let(:basic_renderer)   { TTY::Table::Renderer::Basic }
  let(:ascii_renderer)   { TTY::Table::Renderer::ASCII }

  subject(:table) { object.new header, rows }

  before { allow(Pastel).to receive(:new).and_return(color) }

  it { is_expected.to respond_to(:render) }

  context 'with block' do
    it 'allows to modify renderer in a block' do
      expected = nil
      block = lambda { |renderer| expected = renderer }
      table.render(&block)
      expect(expected).to be_kind_of(basic_renderer)
    end

    it 'sets renderer as block parameter' do
      expected = nil
      block = lambda { |renderer| expected = renderer }
      table.render(:ascii, &block)
      expect(expected).to be_kind_of(ascii_renderer)
    end

    it 'sets parameter on renderer' do
      result = table.render :ascii do |renderer|
        renderer.border.style = :red
      end
      expect(result).to eq unindent(<<-EOS)
        \e[31m+--+--+\e[0m
        \e[31m|\e[0mh1\e[31m|\e[0mh2\e[31m|\e[0m
        \e[31m+--+--+\e[0m
        \e[31m|\e[0ma1\e[31m|\e[0ma2\e[31m|\e[0m
        \e[31m|\e[0mb1\e[31m|\e[0mb2\e[31m|\e[0m
        \e[31m+--+--+\e[0m
      EOS
    end
  end

  context 'with params' do
    it 'sets params without renderer' do
      allow(TTY::Table::Renderer).to receive(:render)
      table.render(:basic)
      expect(TTY::Table::Renderer).to have_received(:render).
        with(table, {renderer: :basic})
    end

    it 'sets params with renderer' do
      allow(TTY::Table::Renderer).to receive(:render)
      table.render
      expect(TTY::Table::Renderer).to have_received(:render).with(table, {})
    end
  end
end
