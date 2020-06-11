# frozen_string_literal: true

RSpec.describe TTY::Table::ColumnConstraint, '#enforce' do
  let(:header) { ['h1', 'h2', 'h3', 'h4'] }
  let(:rows)   { [['a1', 'a2', 'a3', 'a4'], ['b1', 'b2', 'b3', 'b4']] }
  let(:table)  { TTY::Table.new(header, rows) }

  subject(:columns) { described_class.new(table, renderer) }

  context 'with width contraint' do
    let(:renderer) { TTY::Table::Renderer::Basic.new(table, options) }
    let(:options) { { width: 5 }}

    it 'raises error when table width is too small' do
      expect {
        columns.enforce
      }.to raise_error(TTY::Table::ResizeError)
    end
  end

  context 'with width contraint matching natural width' do
    let(:renderer) { TTY::Table::Renderer::Basic.new(table, options) }
    let(:options) { { width: 11, resize: true }}

    it 'raises error when table width is too small' do
      allow(columns).to receive(:expand_column_widths)
      columns.enforce
      expect(columns).to have_received(:expand_column_widths)
    end
  end

  context 'with table larger than allowed width' do
    let(:renderer) { TTY::Table::Renderer::Basic.new(table, options) }

    context 'with resize' do
      let(:options) { { width: 8, resize: true } }

      it 'calls shrink' do
        allow(columns).to receive(:shrink)
        columns.enforce
        expect(columns).to have_received(:shrink)
      end
    end

    context 'without resize' do
      let(:options) { { width: 8, resize: false }}

      it 'changes table orientation to vertical' do
        allow(Kernel).to receive(:warn)
        expect(renderer.column_widths).to eql([2,2,2,2])
        expect(table.orientation.name).to eql(:horizontal)
        column_widths = columns.enforce
        expect(column_widths).to eq([2,2])
        expect(table.orientation.name).to eql(:vertical)
      end
    end
  end

  context 'with table less than allowed width' do
    let(:renderer) { TTY::Table::Renderer::Basic.new(table, options) }
    let(:options)  { { width: 15 }}

    it "doesn't change original widths" do
      allow(Kernel).to receive(:warn)
      expect(renderer.column_widths).to eq([2,2,2,2])
    end
  end
end
