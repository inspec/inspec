# frozen_string_literal: true

RSpec.describe TTY::Table::Row, '#data' do
  let(:object) { described_class.new data, header }
  let(:data) { ['a'] }

  subject { object.to_hash }

  context 'without attributes' do
    let(:header) { nil }

    it { is_expected.to be_instance_of(Hash) }

    it { is_expected.to eql(0 => 'a') }
  end

  context 'with attributes' do
    let(:header) { [:id] }

    it { is_expected.to be_instance_of(Hash) }

    it { is_expected.to eql(id: 'a') }
  end
end
