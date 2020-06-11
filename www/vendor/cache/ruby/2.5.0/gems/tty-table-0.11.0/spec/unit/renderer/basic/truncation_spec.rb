# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, 'truncation' do
  let(:header) { ['header1', 'head2', 'h3'] }
  let(:rows) { [['a1111111', 'a222', 'a3333333'], ['b111', 'b2222222', 'b333333']]}
  let(:table) { TTY::Table.new header, rows }

  subject(:renderer) { described_class.new(table, options) }

  context 'without column widths' do
    let(:options) { {} }

    it "doesn't shorten the fields" do
      expect(renderer.render).to eq unindent(<<-EOS)
        header1  head2    h3      
        a1111111 a222     a3333333
        b111     b2222222 b333333 
      EOS
    end
  end

  context 'with column widths' do
    let(:options) { { column_widths: [4, 5, 7] } }

    it 'shortens the fields' do
      expect(renderer.render).to eq unindent(<<-EOS)
        he…  head2 h3     
        a1…  a222  a3333… 
        b111 b22…  b333333
      EOS
    end
  end
end
