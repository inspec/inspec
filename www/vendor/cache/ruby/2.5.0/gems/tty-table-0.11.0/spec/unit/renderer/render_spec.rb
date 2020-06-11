# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer, '#render' do
  let(:header) { ['h1', 'h2', 'h3'] }
  let(:rows)   { [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3']] }
  let(:table)  { TTY::Table.new(header, rows) }

  subject { described_class.render(table, {}, &block) }

  context 'when default' do
    let(:renderer)       { double(:renderer).as_null_object }
    let(:renderer_class) { double(:renderer_class).as_null_object }
    let(:yielded)        { [] }
    let(:block)          { proc { |render| yielded << render } }

    before { allow(described_class).to receive(:select).and_return(renderer_class) }

    it 'creates renderer' do
      subject
      expect(renderer_class).to have_received(:new).with(table, {})
    end

    it 'yields renderer' do
      allow(renderer_class).to receive(:new).and_return(renderer)
      expect { subject }.to change { yielded}.from([]).to([renderer])
    end

    it 'calls render' do
      allow(renderer_class).to receive(:new).and_return(renderer)
      subject
      expect(renderer).to have_received(:render)
    end
  end
end
