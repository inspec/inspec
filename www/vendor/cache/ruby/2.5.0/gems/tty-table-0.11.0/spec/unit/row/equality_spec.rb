# frozen_string_literal: true

RSpec.describe TTY::Table::Row, '#==' do
  let(:attributes) { [:id] }
  let(:data) { ['1'] }
  let(:object) { described_class.new(data, attributes) }

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
    let(:other) { Class.new(described_class).new(data, attributes: attributes) }

    it { is_expected.to eql(true) }

    it 'is symmetric' do
      is_expected.to eql(other == object)
    end
  end

  context 'with an object having a different attributes' do
    let(:other_attributes) { [:text] }
    let(:other) { described_class.new(data, attributes: other_attributes) }

    it { is_expected.to eql(true) }

    it 'is symmetric' do
      is_expected.to eql(other == object)
    end
  end

  context 'with an object having a different attributes' do
    let(:other_data) { [2] }
    let(:other) { described_class.new(other_data, attributes: attributes) }

    it { is_expected.to eql(false) }

    it 'is symmetric' do
      is_expected.to eql(other == object)
    end
  end

  context 'with an equivalent object responding to_ary' do
    let(:other) { data }

    it { is_expected.to eql(true) }

    it 'is symmetric' do
      is_expected.to eql(other == object)
    end
  end
end
