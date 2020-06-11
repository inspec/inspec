# frozen_string_literal: true

RSpec.describe TTY::Table::Header, '#==' do
  let(:attributes) { [:id, :name] }
  let(:object) { described_class.new(attributes) }

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
    let(:other) { Class.new(described_class).new(attributes) }

    it { is_expected.to eql(true) }

    it 'is symmetric' do
      is_expected.to eql(other == object)
    end
  end

  context 'with an object having different attributes' do
    let(:other_attributes) { [:text] }
    let(:other) { described_class.new(other_attributes) }

    it { is_expected.to eql(false) }

    it 'is symmetric' do
      is_expected.to eql(other == object)
    end
  end
end
