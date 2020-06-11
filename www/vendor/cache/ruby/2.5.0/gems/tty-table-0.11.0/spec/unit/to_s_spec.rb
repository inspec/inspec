# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TTY::Table, '#to_s' do
  let(:header)   { ['h1', 'h2', 'h3'] }
  let(:rows)     { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }

  subject(:table) { described_class.new(header, rows) }

  context 'without renderer' do
    it 'displayes basic table' do
      expect(table.render(:basic)).to eq unindent(<<-EOS)
        h1 h2 h3
        a1 a2 a3
        b1 b2 b3
      EOS
    end
  end

  context 'without border' do
    it 'displays table' do
      expect(table.to_s).to eq unindent(<<-EOS)
        h1 h2 h3
        a1 a2 a3
        b1 b2 b3
      EOS
    end
  end

  context 'with ascii border' do
    it 'displays table' do
      expect(table.render(:ascii)).to eq unindent(<<-EOS)
        +--+--+--+
        |h1|h2|h3|
        +--+--+--+
        |a1|a2|a3|
        |b1|b2|b3|
        +--+--+--+
      EOS
    end
  end

  context 'with unicode border' do
    it 'displays table' do
      expect(table.render(:unicode)).to eq unindent(<<-EOS)
        ┌──┬──┬──┐
        │h1│h2│h3│
        ├──┼──┼──┤
        │a1│a2│a3│
        │b1│b2│b3│
        └──┴──┴──┘
      EOS
    end
  end
end # to_s
