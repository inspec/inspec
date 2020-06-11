# frozen_string_literal: true

RSpec.describe TTY::Table::Field, '#==' do
  let(:value)  { '1' }
  let(:object) { described_class.new(value) }

  subject { object == other }

  context 'with the same object' do
    let(:other) { object }

    it { is_expected.to eql(true) }

    it 'is symmetric' do
      is_expected.to eql(other == object)
    end
  end

  context 'with an equivalent object' do
    let(:other) { object.dup }

    it { is_expected.to eql(true) }

    it 'is symmetric' do
      is_expected.to eql(other == object)
    end
  end

  context 'with an equivalent object of subclass' do
    let(:other) { Class.new(described_class).new(value) }

    it { is_expected.to eq(true) }

    it 'is symmetric' do
      is_expected.not_to eql(other == object)
    end
  end

  context 'with an object having a different value' do
    let(:other_value) { '2' }
    let(:other)       { described_class.new(other_value) }

    it { is_expected.to eql(false) }

    it 'is symmetric' do
      is_expected.to eql(other == object)
    end
  end
end
