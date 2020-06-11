# frozen_string_literal: true

RSpec.describe TTY::Table::ColumnConstraint, 'column widths' do
  let(:header) { ['h1', 'h2', 'h3', 'h4'] }
  let(:rows)   { [['a1', 'a2', 'a3', 'a4'], ['b1', 'b2', 'b3', 'b4']] }
  let(:table)  { TTY::Table.new(header, rows) }

  subject(:columns) { described_class.new(table, renderer) }

  context 'with basic renderer' do
    let(:renderer) { TTY::Table::Renderer::Basic.new(table) }

    it 'calculates columns natural width' do
      expect(columns.natural_width).to eq(11)
    end

    it 'calculates miminimum columns width' do
      expect(columns.minimum_width).to eq(7)
    end
  end

  context 'with ascii renderer' do
    let(:renderer) { TTY::Table::Renderer::ASCII.new(table) }

    it 'calculates columns natural width' do
      expect(columns.natural_width).to eq(13)
    end

    it 'calculates miminimum columns width' do
      expect(columns.minimum_width).to eq(9)
    end
  end
end
