# frozen_string_literal: true

RSpec.describe TTY::Table::Transformation, '#extract_tuples' do
  let(:object) { described_class }
  let(:header) { ['Header1', 'Header2'] }
  let(:rows) { [['a1', 'a2'], ['b1', 'b2']] }

  subject { object.extract_tuples(value) }

  context 'when rows' do
    let(:value) { [rows] }

    it { expect(subject[:header]).to be_nil }

    it { expect(subject[:rows]).to eql(rows) }
  end

  context 'when header and rows' do
    let(:value) { [header, rows] }

    it { expect(subject[:header]).to eql(header) }

    it { expect(subject[:rows]).to eql(rows) }
  end

  context 'when hash' do
    let(:value) { [[{'Header1' => ['a1', 'a2'], 'Header2' => ['b1', 'b2'] }]] }

    it { expect(subject[:header]).to eql(header) }

    it { expect(subject[:rows]).to eql(rows) }
  end
end
