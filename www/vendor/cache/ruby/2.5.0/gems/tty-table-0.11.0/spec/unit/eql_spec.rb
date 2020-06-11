# frozen_string_literal: true

RSpec.describe TTY::Table, '#eql?' do
  let(:rows)   { [['a1', 'a2'], ['b1', 'b2']] }
  let(:object) { described_class.new rows }

  subject { object.eql?(other) }

  describe '#inspect' do
    it { expect(object.inspect).to match(/#<TTY::Table/) }
  end

  context 'with the same object' do
    let(:other) { object }

    it { is_expected.to eql(true) }

    it 'is symmetric' do
      is_expected.to eql(other.eql?(object))
    end
  end

  context 'with an equivalent object' do
    let(:other) { object.dup }

    it { is_expected.to eql(true) }

    it 'is symmetric' do
      is_expected.to eql(other.eql?(object))
    end
  end
end
