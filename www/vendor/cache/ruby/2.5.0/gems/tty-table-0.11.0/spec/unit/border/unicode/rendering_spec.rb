# frozen_string_literal: true

RSpec.describe TTY::Table::Border::Unicode, '#rendering' do

  subject(:border) { described_class.new(column_widths) }

  context 'with empty row' do
    let(:row) { TTY::Table::Row.new([]) }
    let(:column_widths) { [] }

    it 'draws top line' do
      expect(border.top_line).to eq("┌┐")
    end

    it 'draws middle line' do
      expect(border.separator).to eq("├┤")
    end

    it 'draw bottom line' do
      expect(border.bottom_line).to eq("└┘")
    end

    it 'draws row line' do
      expect(border.row_line(row)).to eq("││")
    end
  end

  context 'with row' do
    let(:row) { TTY::Table::Row.new(['a1', 'a2', 'a3']) }
    let(:column_widths) { [2,2,2] }

    it 'draws top line' do
      expect(border.top_line).to eq("┌──┬──┬──┐")
    end

    it 'draw middle line' do
      expect(border.separator).to eq("├──┼──┼──┤")
    end

    it 'draw bottom line' do
      expect(border.bottom_line).to eq("└──┴──┴──┘")
    end

    it 'draws row line' do
      expect(border.row_line(row)).to eq("│a1│a2│a3│")
    end
  end

  context 'with multiline row' do
    let(:row) { TTY::Table::Row.new(["a1\nb1\nc1", 'a2', 'a3']) }
    let(:column_widths) { [2,2,2] }

    it 'draws row line' do
      expect(border.row_line(row)).to eq unindent(<<-EOS)
        │a1│a2│a3│
        │b1│  │  │
        │c1│  │  │
      EOS
    end
  end
end
