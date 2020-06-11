# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, 'individual row separators' do
  context 'using the separator option' do
    let(:header) { ['h1', 'h2', 'h3'] }
    let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], ['c1', 'c2', 'c3']] }
    let(:table)  { TTY::Table.new(header, rows) }

    let(:object) { described_class.new table }

    subject(:renderer) { object }

    it "can use an array to specify the rows to separate" do
      renderer.border.separator = [2]
      expect(renderer.render).to eq unindent(<<-EOS)
        h1 h2 h3
        a1 a2 a3
        b1 b2 b3

        c1 c2 c3
      EOS
    end

    it "can use a proc to specify the rows to separate" do
      renderer.border.separator = ->(line) { line == 2 }
      expect(renderer.render).to eq unindent(<<-EOS)
        h1 h2 h3
        a1 a2 a3
        b1 b2 b3

        c1 c2 c3
      EOS
    end
  end

  it "works without a header row" do
    table = TTY::Table.new([['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], ['c1', 'c2', 'c3']])
    renderer = described_class.new(table)
    renderer.border.separator = [1]
    expect(renderer.render).to eq unindent(<<-EOS)
      a1 a2 a3
      b1 b2 b3

      c1 c2 c3
    EOS
  end

  context 'using the :separator keyword as a row' do
    it "the :separator keyword can be used in the row definition" do
      table = TTY::Table.new([['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], :separator, ['c1', 'c2', 'c3']])
      expect(described_class.new(table).render).to eq unindent(<<-EOS)
        a1 a2 a3
        b1 b2 b3

        c1 c2 c3
      EOS
    end

    it "the :separator keyword can be pushed into a run" do
      table = TTY::Table.new([['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']])
      table << :separator << ['c1', 'c2', 'c3']
      expect(described_class.new(table).render).to eq unindent(<<-EOS)
        a1 a2 a3
        b1 b2 b3

        c1 c2 c3
      EOS
    end

    it "the :separator keyword be used between the header and the body" do
      table = TTY::Table.new(['h1', 'h2', 'h3'], [:separator, ['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']])
      expect(described_class.new(table).render).to eq unindent(<<-EOS)
        h1 h2 h3

        a1 a2 a3
        b1 b2 b3
      EOS
    end
  end
end
