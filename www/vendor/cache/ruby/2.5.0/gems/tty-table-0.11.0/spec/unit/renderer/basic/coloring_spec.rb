# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, 'coloring' do
  let(:clear)    { "\e[0m" }
  let(:color)    { Pastel.new(enabled: true) }

  before { allow(Pastel).to receive(:new).and_return(color) }

  context 'when border ' do
    it "doesn't color" do
      table = TTY::Table.new header: ['header1', 'header2']
      table << ['a1', 'a2']
      table << ['b1', 'b2']
      renderer = described_class.new(table)
      renderer.border = {style: :green}

      expect(renderer.render).to eql unindent(<<-EOS)
        header1 header2
        a1      a2     
        b1      b2     
      EOS
    end
  end

  context 'when content' do
    it "colors individual field" do
      header = [color.green('header1'), 'header2']
      table = TTY::Table.new header: header
      table << [color.green.on_blue('a1'), 'a2']
      table << ['b1', color.red.on_yellow('b2')]
      renderer = described_class.new(table)

      expect(renderer.render).to eq unindent(<<-EOS)
        #{color.green('header1')} header2
        #{color.green.on_blue('a1')}      a2     
        b1      #{color.red.on_yellow('b2')}     
      EOS
    end

    it "colors multiline content" do
      header = [color.yellow("Multi\nHeader"), 'header2']
      table = TTY::Table.new header: header
      table << [color.green.on_blue("Multi\nLine\nContent"), 'a2']
      table << ['b1', color.red.on_yellow("Multi\nLine\nContent")]
      renderer = described_class.new(table, multiline: true)

      expect(renderer.render).to eq unindent(<<-EOS)
        #{color.yellow('Multi  ')} header2
        #{color.yellow('Header')}         
        #{color.green.on_blue('Multi  ')} a2     
        #{color.green.on_blue('Line   ')}        
        #{color.green.on_blue('Content')}        
        b1      #{color.red.on_yellow("Multi  ")}
                #{color.red.on_yellow("Line   ")}
                #{color.red.on_yellow("Content")}
      EOS
    end
  end
end
