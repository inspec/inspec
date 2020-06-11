# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Unicode, 'indentation' do
  let(:header)  { ['h1', 'h2', 'h3'] }
  let(:rows)    { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:table)   { TTY::Table.new(header, rows) }
  let(:indent)  { 2 }
  let(:options) { {indent: indent } }

  subject(:renderer) { described_class.new(table, options)}

  context 'when default' do
    it 'indents by value' do
      expect(renderer.render).to eq <<-EOS.chomp
  ┌──┬──┬──┐
  │h1│h2│h3│
  ├──┼──┼──┤
  │a1│a2│a3│
  │b1│b2│b3│
  └──┴──┴──┘
      EOS
    end
  end

  context 'when each row' do
    it 'indents by value' do
      renderer.border.separator = :each_row
      expect(renderer.render).to eql <<-EOS.chomp
  ┌──┬──┬──┐
  │h1│h2│h3│
  ├──┼──┼──┤
  │a1│a2│a3│
  ├──┼──┼──┤
  │b1│b2│b3│
  └──┴──┴──┘
      EOS
    end
  end
end
