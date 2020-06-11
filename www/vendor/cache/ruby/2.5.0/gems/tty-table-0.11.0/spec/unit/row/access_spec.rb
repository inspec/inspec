# frozen_string_literal: true

RSpec.describe TTY::Table::Row, '#access' do
  let(:object) { described_class.new [] }

  before { object[attribute] = value}

  subject { object[attribute] }

  context 'when integer' do
    let(:attribute) { 0 }
    let(:value) { 1 }

    it { is_expected.to eq(1) }
  end

  context 'when symbol' do
    let(:attribute) { :id }
    let(:value) { 1 }

    it { is_expected.to eq(1) }
  end
end
