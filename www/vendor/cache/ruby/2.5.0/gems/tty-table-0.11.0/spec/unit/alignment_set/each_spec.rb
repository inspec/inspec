# frozen_string_literal: true

RSpec.describe TTY::Table::AlignmentSet, '#each' do
  let(:alignments) { [:left, :center, :right] }
  let(:yields)     { [] }
  let(:object)     { described_class.new alignments }

  subject { object.each { |alignment| yields << alignment } }

  it 'yields each alignment' do
    expect { subject }.to change { yields.dup }.
      from([]).
      to(alignments)
  end
end
