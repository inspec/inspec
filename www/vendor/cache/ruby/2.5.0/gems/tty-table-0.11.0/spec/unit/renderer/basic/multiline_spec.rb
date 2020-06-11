# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, 'multiline content' do
  context 'with escaping' do
    it "renders multiline as single line" do
      rows = [ ["First", '1'], ["Multiline\nContent", '2'], ["Third", '3']]
      table = TTY::Table.new rows
      renderer = described_class.new(table, multiline: false)
      expect(renderer.render).to eq unindent(<<-EOS)
        First              1
        Multiline\\nContent 2
        Third              3
      EOS
    end

    it "truncates multiline content" do
      rows = [ ["First", '1'], ["Multiline\nContent", '2'], ["Third", '3']]
      table = TTY::Table.new rows
      renderer = described_class.new(table, multiline: false, column_widths: [8,1])
      expect(renderer.render).to eq unindent(<<-EOS)
        First    1
        Multil…  2
        Third    3
      EOS
    end
  end

  context 'without escaping' do
    it "renders every line" do
      rows = [["First", '1'],
              ["Multi\nLine\nContent", '2'],
              ["Third", "Multi\nLine"]]
      table = TTY::Table.new rows
      renderer = described_class.new(table, multiline: true)
      expect(renderer.render).to eq unindent(<<-EOS)
        First   1    
        Multi   2    
        Line         
        Content      
        Third   Multi
                Line 
      EOS
    end

    it "renders multiline with column widths" do
      rows = [["First", '1'], ["Multi\nLine\nContent", '2'], ["Third", '3']]
      table = TTY::Table.new rows
      renderer = described_class.new(table, multiline: true, column_widths: [8,1])
      expect(renderer.render).to eq unindent(<<-EOS)
        First    1
        Multi    2
        Line      
        Content   
        Third    3
      EOS
    end

    it 'wraps multi line' do
      rows = [["First", '1'], ["Multi\nLine\nContent", '2'], ["Third", '3']]
      table = TTY::Table.new rows
      renderer = described_class.new(table, multiline: true, column_widths: [5,1])
      expect(renderer.render).to eq unindent(<<-EOS)
        First 1
        Multi 2
        Line   
        Conte  
        nt     
        Third 3
      EOS
    end
  end
end
