# frozen_string_literal: true

RSpec.describe TTY::Table::Row, '#call' do
  let(:object) { described_class.new(data) }

  subject { object[attribute] }

  context 'when integer' do
    let(:data) { ['a', 'b'] }

    let(:attribute) { 1 }

    it { is_expected.to eql('b') }
  end

  context 'when symbol' do
    let(:data) { {:id => 1} }

    context 'when hash access' do
      let(:attribute) { :id }

      it { is_expected.to eql(1) }
    end

    context 'when array access' do
      let(:attribute) { 0 }

      it { is_expected.to eql(1) }
    end
  end

  context 'when unkown attribute' do
    let(:data) { {:id => 1} }

    let(:attribute) { :other }

    specify {
      expect {
        subject
      }.to raise_error(TTY::Table::UnknownAttributeError)
    }
  end
end
