# frozen_string_literal: true

RSpec.describe TTY::Table::BorderOptions do

  subject { described_class.new(options) }

  context 'with characters' do
    let(:options) { {top: '**'} }

    it { expect(subject.characters).to eq({top:'**'}) }
  end

  context 'without characters' do
    let(:options) { nil }

    it { expect(subject.characters).to eq({}) }
  end
end
