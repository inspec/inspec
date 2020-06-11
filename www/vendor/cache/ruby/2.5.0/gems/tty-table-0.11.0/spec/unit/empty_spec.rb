# frozen_string_literal: true

RSpec.describe TTY::Table, '#empty?' do
  let(:header) { ['Header1', 'Header2'] }
  let(:object) { described_class.new header, rows }

  subject { object.empty? }

  context 'with rows containing no entries' do
    let(:rows) { [] }

    it { is_expected.to eq(true) }
  end

  context 'with rows containing an entry' do
    let(:rows) { [['a1']] }

    it { is_expected.to eq(false) }
  end
end

