# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, '#column_widths' do
  let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:renderer) { described_class.new(table) }

  subject { renderer.render }

  context 'with rows only' do
    let(:rows)  { [['a1a', 'a2a2a2'], ['b1b1b', 'b2b2']] }
    let(:table) { TTY::Table.new rows }

    it 'calculates column widths' do
      expect(renderer.column_widths).to eq([5,6])
    end
  end

  context 'with header' do
    let(:header) { ['header1', 'head2', 'h3'] }
    let(:table)  { TTY::Table.new header, rows }

    it 'calcualtes column widths with header' do
      expect(renderer.column_widths).to eq([7,5,2])
    end
  end
end
