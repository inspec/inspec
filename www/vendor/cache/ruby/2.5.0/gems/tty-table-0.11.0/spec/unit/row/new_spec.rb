# frozen_string_literal: true

RSpec.describe TTY::Table::Row, '#new' do
  let(:object) { described_class }

  subject { object.new data }

  context 'with no arguments' do
    let(:data) { [] }

    it { is_expected.to be_instance_of(object) }

    it { is_expected.to be_empty }

    it { expect(subject.attributes).to eq([]) }

    it { expect(subject.data).to eq({}) }
  end

  context 'with Array argument' do
    let(:data) { ['a'] }

    it { is_expected.to be_instance_of(object) }

    it { expect(subject.attributes).to eq([0]) }

    it { expect(subject.to_hash).to eq({0 => "a"}) }
  end

  context 'with Hash argument' do
    let(:data) { {id: 'a'} }

    it { should be_instance_of(object) }

    it { expect(subject.attributes).to eq([:id]) }

    it { expect(subject.to_hash).to eq({:id => 'a'}) }
  end
end
