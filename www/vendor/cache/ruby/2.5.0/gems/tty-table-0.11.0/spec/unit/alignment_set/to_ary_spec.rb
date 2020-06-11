# frozen_string_literal: true

RSpec.describe TTY::Table::AlignmentSet, '#to_ary' do
  let(:argument) { [:center, :left] }
  let(:object)   { described_class.new argument }

  subject { object.to_ary }

  it { is_expected.to be_instance_of(Array) }

  it { is_expected.to eq(argument) }
end
