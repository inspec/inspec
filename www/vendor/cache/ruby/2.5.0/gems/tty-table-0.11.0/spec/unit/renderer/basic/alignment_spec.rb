# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, 'alignment' do
  let(:header)  { ['h1', 'h2', 'h3'] }
  let(:rows)    { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:options) { { alignments: alignments } }
  let(:table)   { TTY::Table.new(header, rows) }

  subject(:renderer) { described_class.new table, options }

  context 'with default' do
    let(:header)     { ['h1', 'h2'] }
    let(:rows)       { [['aaaaa', 'a'], ['b', 'bbbbb']] }
    let(:alignments) { nil }

    it 'aligns left by default' do
      expect(renderer.render).to eql unindent(<<-EOS)
        h1    h2   
        aaaaa a    
        b     bbbbb
      EOS
    end
  end

  context 'with different headers' do
    let(:header)     { ['header1', 'head2', 'h3'] }
    let(:alignments) { [:left, :center, :right] }

    it 'aligns headers' do
      expect(renderer.render).to eql unindent(<<-EOS)
        header1 head2 h3
        a1       a2   a3
        b1       b2   b3
      EOS
    end
  end

  context 'with different aligns' do
    let(:header)     { nil }
    let(:rows)       { [['aaaaa', 'a'], ['b', 'bbbbb']] }
    let(:alignments) { [:left, :right] }

    it 'aligns table rows' do
      expect(renderer.render.to_s).to eql unindent(<<-EOS)
        aaaaa     a
        b     bbbbb
      EOS
    end
  end

  context 'with individual field aligns' do
    let(:header)     { ['header1', 'header2', 'header3'] }
    let(:alignments) { [:left, :center, :right] }
    let(:options)    { {alignments: alignments} }
    let(:table) {
      TTY::Table.new header: header do |t|
        t << ['a1', 'a2', 'a3']
        t << ['b1', {value: 'b2', alignment: :right}, 'b3']
        t << ['c1', 'c2', {value: 'c3', alignment: :center}]
      end
    }

    it "takes individual fields over global aligns" do
      expect(renderer.render).to eq unindent(<<-EOS)
        header1 header2 header3
        a1        a2         a3
        b1           b2      b3
        c1        c2      c3   
      EOS
    end
  end

  context 'with aligned header' do
    let(:rows)    { [['aaaaa1', 'a2', 'aaa3'], ['b1', 'bbbb2', 'bb3']] }
    let(:header)  {['h1', {value: 'h2', alignment: :right}, {value: 'h3', alignment: :center}] }
    let(:options) { { renderer: :basic } }

    it "aligns headres" do
      expect(renderer.render).to eq unindent(<<-EOS)
        h1        h2  h3 
        aaaaa1 a2    aaa3
        b1     bbbb2 bb3 
      EOS
    end
  end
end
