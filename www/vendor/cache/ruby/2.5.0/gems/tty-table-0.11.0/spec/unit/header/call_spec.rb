# frozen_string_literal: true

RSpec.describe TTY::Table::Header, '#call' do
  let(:object) { described_class.new(attributes) }
  let(:attributes) { [:id, :name, :age] }

  subject { object[attribute] }

  context 'with a known attribute' do
    context 'when symbol' do
      let(:attribute) { :age }

      it { is_expected.to eq(2) }
    end

    context 'when integer' do
      let(:attribute) { 1 }

      it { is_expected.to eq(:name) }
    end
  end

  context 'with an unknown attribute' do
    let(:attribute) { :mine }

    it { expect { subject }.to raise_error(TTY::Table::UnknownAttributeError, "the header 'mine' is unknown")}
  end
end
