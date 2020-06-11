# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, 'options' do
  let(:rows)   { [['a1', 'a2'], ['b1', 'b2']] }
  let(:object) { described_class }
  let(:table)  { TTY::Table.new(rows) }
  let(:widths) { nil }
  let(:alignments) { [] }
  let(:options) {
    {
      column_widths: widths,
      alignments: alignments,
      renderer: :basic
    }
  }

  subject(:renderer) { object.new table, options }

  it { expect(renderer.border).to be_kind_of(TTY::Table::BorderOptions) }

  it { expect(renderer.column_widths).to eql([2,2]) }

  it { expect(renderer.alignments.to_a).to eql(alignments) }

  it { expect(renderer.alignments.to_a).to be_empty }

  context '#column_widths' do
    let(:widths) { [10, 10] }

    it { expect(renderer.column_widths).to eq(widths) }
  end

  context '#column_widths empty' do
    let(:widths) { [] }

    it {
      expect {
        renderer.column_widths
      }.to raise_error(TTY::Table::InvalidArgument)
    }
  end

  context '#alignments' do
    let(:alignments) { [:center, :center] }

    it 'unwraps original array' do
      expect(renderer.alignments.to_a).to eq(alignments)
    end
  end
end
