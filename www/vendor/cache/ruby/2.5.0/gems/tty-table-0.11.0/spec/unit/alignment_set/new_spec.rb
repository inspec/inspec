# frozen_string_literal: true

RSpec.describe TTY::Table::AlignmentSet, '#new' do
  let(:object) { described_class }

  subject(:alignment_set) { object.new(argument) }

  context 'with no argument' do
    let(:argument) { [] }

    it { is_expected.to be_kind_of(Enumerable) }

    it { is_expected.to be_instance_of(object) }

    it { expect(alignment_set.to_a).to eq([]) }
  end

  context 'with argument' do
    let(:argument) { [:center, :left] }

    it { is_expected.to be_instance_of(object) }

    it { expect(alignment_set.to_a).to eq(argument) }
  end
end
