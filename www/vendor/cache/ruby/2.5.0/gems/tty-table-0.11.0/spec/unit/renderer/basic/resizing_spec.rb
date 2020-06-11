# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, 'resizing' do
  let(:header)  { ['h1', 'h2', 'h3'] }
  let(:rows)    { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:table)   { TTY::Table.new(header, rows) }

  subject(:renderer) { described_class.new(table, options) }

  context 'when expanding' do
    context 'even columns' do
      let(:options) { {width: 16, resize: true} }

      it 'resizes each column' do
        expect(renderer.render).to eql unindent(<<-EOS)
          h1    h2    h3  
          a1    a2    a3  
          b1    b2    b3  
        EOS
      end
    end

    context 'even columns with extra width' do
      let(:header)  { ['h1', 'h2', 'h3', 'h4'] }
      let(:rows)    { [['a1','a2','a3','a4'], ['b1','b2','b3','b4']] }
      let(:options) { {width: 21, resize: true} }

      it 'resizes each column' do
        expect(renderer.render).to eql unindent(<<-EOS)
          h1    h2    h3   h4  
          a1    a2    a3   a4  
          b1    b2    b3   b4  
        EOS
      end
    end

    context 'uneven columns' do
      let(:header)  { ['h1', 'h2', 'h3'] }
      let(:rows)    { [['aaa1', 'aa2', 'aaaaaaa3'], ['b1', 'b2', 'b3']] }
      let(:options) { {width: 32, resize: true} }

      it 'resizes each column' do
        expect(renderer.render).to eql unindent(<<-EOS)
          h1        h2       h3           
          aaa1      aa2      aaaaaaa3     
          b1        b2       b3           
        EOS
      end
    end
  end

  context 'when shrinking' do
    let(:header)  { ['head1', 'head2'] }
    let(:rows)    { [['aaaa1','aaaa2',], ['bbbb1','bbbb2']] }

    context 'even columns' do
      let(:options) { {width: 8, resize: true} }

      it 'resizes each column' do
        expect(renderer.render).to eql unindent(<<-EOS)
          he…  h… 
          aa…  a… 
          bb…  b… 
        EOS
      end
    end

    context 'even columns with extra width' do
      let(:options) { {width: 9, resize: true} }

      it 'resizes each column' do
        expect(renderer.render).to eql unindent(<<-EOS)
          he…  he… 
          aa…  aa… 
          bb…  bb… 
        EOS
      end
    end

    context 'uneven columns' do
      let(:header)  { ['head1', 'head2', 'head3'] }
      let(:rows)    { [['aaa1', 'aa2', 'aaaaaaa3'], ['b1', 'b2', 'b3']] }
      let(:options) { {width: 16, resize: true} }

      it 'resizes each column' do
        expect(renderer.render).to eql unindent(<<-EOS)
          he…  he…  head3 
          aaa1 aa2  aaaa… 
          b1   b2   b3    
        EOS
      end
    end
  end
end
