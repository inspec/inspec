# frozen_string_literal: true

RSpec.describe TTY::Table::Operation::Alignment, '#call' do
  let(:object) { described_class.new alignments, widths }
  let(:value)  { 'a1' }
  let(:field)  { TTY::Table::Field.new(value)}

  subject { object.call(field, 0, 0) }

  context 'aligned with column widths and no alignments' do
    let(:alignments) { [] }
    let(:widths) { [4, 4] }

    it { is_expected.to eq("#{value}  ") }
  end

  context 'aligned with column widths and alignments' do
    let(:alignments) { [:right, :left] }
    let(:widths)     { [4, 4] }

    it { is_expected.to eq("  #{value}") }
  end

  context 'aligned with no column widths and no alignments' do
    let(:alignments) { [] }
    let(:widths)     { [] }

    it { is_expected.to eq("#{value}") }
  end

  context 'aligned with no column widths and alignments' do
    let(:alignments) { [:right, :left] }
    let(:widths)     { [] }

    it { is_expected.to eq("#{value}") }
  end
end
