# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, 'filter' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:table)  { TTY::Table.new(header, rows) }

  subject(:renderer) { described_class.new(table, {filter: filter}) }

  context 'with header' do
    context 'filtering only rows' do
      let(:filter) { Proc.new { |val, row, col|
          (col == 1 and row > 0) ? val.capitalize : val
        }
      }

      it 'filters only rows' do
        expect(renderer.render).to eq unindent(<<-EOS)
          h1 h2 h3
          a1 A2 a3
          b1 B2 b3
        EOS
      end
    end

    context 'filtering header and rows' do
      let(:filter) { Proc.new { |val, row, col| col == 1 ? val.capitalize : val }}

      it 'filters only rows' do
        expect(renderer.render).to eq unindent(<<-EOS)
          h1 H2 h3
          a1 A2 a3
          b1 B2 b3
        EOS
      end
    end
  end

  context 'without header' do
    let(:header) { nil }

    let(:filter) { Proc.new { |val, row, col| col == 1 ?  val.capitalize : val } }

    it 'filters only rows' do
      expect(renderer.render).to eq unindent(<<-EOS)
        a1 A2 a3
        b1 B2 b3
      EOS
    end
  end
end
