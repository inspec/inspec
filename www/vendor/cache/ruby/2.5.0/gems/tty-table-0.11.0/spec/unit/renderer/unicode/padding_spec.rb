# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Unicode, 'padding' do
  let(:header) { ['Field', 'Type', 'Null', 'Key', 'Default', 'Extra'] }
  let(:rows)   { [['id', 'int(11)', 'YES', 'nil', 'NULL', '']] }
  let(:table)  { TTY::Table.new(header, rows) }

  subject(:renderer) { described_class.new(table, options) }

  context 'with left & right padding' do
    let(:options) { {padding: [0,1,0,1]} }

    it 'pads each field' do
      expect(renderer.render).to eql unindent(<<-EOS)
        ┌───────┬─────────┬──────┬─────┬─────────┬───────┐
        │ Field │ Type    │ Null │ Key │ Default │ Extra │
        ├───────┼─────────┼──────┼─────┼─────────┼───────┤
        │ id    │ int(11) │ YES  │ nil │ NULL    │       │
        └───────┴─────────┴──────┴─────┴─────────┴───────┘
      EOS
    end
  end

  context 'with top & bottom padding' do
    let(:options) { {padding: [1,0,1,0], multiline: true} }

    it 'pads each field' do
      expect(renderer.render).to eql unindent(<<-EOS)
        ┌─────┬───────┬────┬───┬───────┬─────┐
        │     │       │    │   │       │     │
        │Field│Type   │Null│Key│Default│Extra│
        │     │       │    │   │       │     │
        ├─────┼───────┼────┼───┼───────┼─────┤
        │     │       │    │   │       │     │
        │id   │int(11)│YES │nil│NULL   │     │
        │     │       │    │   │       │     │
        └─────┴───────┴────┴───┴───────┴─────┘
      EOS
    end
  end

  context 'with full padding' do
    let(:options) { {padding: [1,1,1,1], multiline: true} }

    it 'pads each field' do
      expect(renderer.render).to eql unindent(<<-EOS)
        ┌───────┬─────────┬──────┬─────┬─────────┬───────┐
        │       │         │      │     │         │       │
        │ Field │ Type    │ Null │ Key │ Default │ Extra │
        │       │         │      │     │         │       │
        ├───────┼─────────┼──────┼─────┼─────────┼───────┤
        │       │         │      │     │         │       │
        │ id    │ int(11) │ YES  │ nil │ NULL    │       │
        │       │         │      │     │         │       │
        └───────┴─────────┴──────┴─────┴─────────┴───────┘
      EOS
    end
  end
end
