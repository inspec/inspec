# frozen_string_literal: true

RSpec.describe TTY::Table::BorderOptions, '#from' do

  subject(:options) { described_class.from object }

  context 'when empty hash' do
    let(:object) { {} }

    it { expect(options.style).to be_nil }

    it { expect(options.separator).to be_nil }
  end

  context 'when hash' do
    let(:object) { { style: :red, separator: :none } }

    it { expect(options).to be_kind_of(described_class) }

    it { expect(options.style).to eql :red }

    it { expect(options.separator).to eql :none }

    it { expect(options.characters).to eql({}) }
  end

  context 'when other BorderOptions' do
    let(:object) { described_class.new(nil, nil, :blue) }

    it { expect(options).to eql object }

    it { expect(options.characters).to eql({}) }

    it { expect(options.style).to eql :blue }
  end
end # from
