# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, 'with separator' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:table)  { TTY::Table.new(header, rows) }

  let(:object) { described_class.new table }

  subject(:renderer) { object }

  context 'when default' do
    it "sets through hash" do
      renderer.border :separator => :each_row
      expect(renderer.border.separator).to eql(:each_row)
    end

    it "sets through attribute" do
      renderer.border.separator= :each_row
      expect(renderer.border.separator).to eql(:each_row)
    end

    it "sets through block" do
      renderer.border do
        separator :each_row
      end
      expect(renderer.border.separator).to eql(:each_row)
    end

    it "renders each row" do
      renderer.border.separator= :each_row
      expect(renderer.render).to eq unindent(<<-EOS)
        h1 h2 h3

        a1 a2 a3

        b1 b2 b3
      EOS
    end
  end
end
